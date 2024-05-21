class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  validates :comment, :raiting, presence: true
end
