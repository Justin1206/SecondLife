class Conversation < ApplicationRecord
    has_many :messages, dependent: :destroy
    belongs_to :sender, class_name: 'User'
    belongs_to :recipient, class_name: 'User'
    belongs_to :item
    # validates :sender_id, uniqueness: { scope: :recipient_id }
  
    scope :between, -> (sender_id, recipient_id, item_id) do
      where(sender_id: sender_id, recipient_id: recipient_id, item_id: item_id).or(
        where(sender_id: recipient_id, recipient_id: sender_id, item_id: item_id))
    end
  
    def self.get(sender_id, recipient_id, item_id)
    
      conversation = between(sender_id, recipient_id, item_id).first

      return conversation if conversation.present?
  
      create(sender_id: sender_id, recipient_id: recipient_id, item_id: item_id)
    end
  
    # def opposed_user(user)
    #   user == recipient ? sender : recipient
    # end
  end