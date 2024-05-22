class Review < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :comment, presence: true
  validates :raiting, presence: true, inclusion: { in: 1..5 }
end
