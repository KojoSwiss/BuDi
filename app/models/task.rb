class Task < ApplicationRecord
  belongs_to :category
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [:title, :location],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
