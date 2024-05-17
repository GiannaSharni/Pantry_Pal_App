class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :recipes
  has_many :reviews
  has_many :favorites
  has_many :ingredients
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
