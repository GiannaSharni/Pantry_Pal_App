class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :username, :title, :description, :rating, presence: true
  validates :content, presence: true
end
