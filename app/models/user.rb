class User < ApplicationRecord
  resourcify
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :item 

  has_many :wlists # just the 'relationships'
  has_many :favorites, through: :wlists, source: :item
end
