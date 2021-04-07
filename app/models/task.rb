class Task < ApplicationRecord
  acts_as_votable
  belongs_to :category
  belongs_to :user
  has_one_attached :photo
  has_many :comments

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [:title, :location],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    },
    order_within_rank: "cached_votes_total DESC"

  validates :title, :description, :location, :phone_number, :photo, presence: true
end
