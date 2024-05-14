class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :reviews

  include PgSearch::Model
  pg_search_scope :search_by_title,
    against: [ :title ],
    using: {
      tsearch: { prefix: true }
    }
end
