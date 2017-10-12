class Item < ApplicationRecord
    resourcify
    belongs_to :user, optional: true
    
    def user_email
        user.email
    end


end
