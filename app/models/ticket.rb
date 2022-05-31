class Ticket < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :language, presence: true, inclusion: { in: %w(Ruby HTML C CSS JavaScript Python TypeScript Elixir Vue) }
  
  include PgSearch::Model
  pg_search_scope :search_by_language,
  against: [ :language ],
  using: {
    tsearch: { prefix: true }
  }
end
