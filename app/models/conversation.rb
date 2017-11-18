class Conversation < ApplicationRecord
    has_many :messages, dependent: :destroy
    belongs_to :sender, class_name: 'User'
    belongs_to :recipient, class_name: 'User'
    belongs_to :item
    
    validates :sender_id, uniqueness: { scope: :item_id }
  
    scope :between, -> (recipient_id, sender_id, item_id) do
      where(recipient_id: recipient_id, sender_id: sender_id, item_id: item_id).or(where(recipient_id: sender_id, sender_id: recipient_id, item_id: item_id))
    end
  
    def self.get(recipient_id, sender_id, item_id)
    
      conversation = between(recipient_id, sender_id, item_id).first

      return conversation if conversation.present?
  
      create(recipient_id: recipient_id, sender_id: sender_id, item_id: item_id)
    end
  
    def opposed_user(user)
      user == sender ? recipient : sender
    end
  end