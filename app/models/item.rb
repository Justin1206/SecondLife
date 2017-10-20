class Item < ApplicationRecord
    resourcify
    belongs_to :user, optional: true

    has_many :wlists # just the 'relationships'
    has_many :favorited_by, through: :wlists, source: :user
    
    def user_email
        user.email
    end
end
