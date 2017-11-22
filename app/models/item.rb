class Item < ApplicationRecord
    resourcify
    belongs_to :user, optional: true

    has_many :conversations
    has_many :orders

    has_many :wlists, :dependent => :destroy
    has_many :favorited_by, through: :wlists, source: :user

    mount_uploader :picture, PictureUploader    
    
    def user_email
        user.email
    end

    private
    def product_params
      params.require(:item).permit(:picture)
    end
end
