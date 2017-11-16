class User < ApplicationRecord
  resourcify
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :item 

  has_many :wlists, :dependent => :destroy
  has_many :favorites, through: :wlists, source: :item

  has_many :messages
  has_many :conversations
end
