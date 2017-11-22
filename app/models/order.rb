class Order < ApplicationRecord
  belongs_to :conversation
  belongs_to :item

  belongs_to :buyller, class_name: 'User'
  belongs_to :seller, class_name: 'User'
end
