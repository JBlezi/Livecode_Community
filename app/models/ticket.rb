class Ticket < ApplicationRecord
  has_one :chat, dependent: :destroy
  belongs_to :user
  has_one :chat, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true
  validates :language, presence: true, inclusion: { in: %w(Ruby HTML C CSS JavaScript Python TypeScript Elixir Vue) }

  include PgSearch::Model
  pg_search_scope :search_by_everything,
  against: [ :language, :title, :content ],
  using: {
    tsearch: { prefix: true }
  }

  CATEGORIES = ["Ruby", "HTML", "C", "CSS", "JavaScript", "Python", "Typescript", "Elixir", "Vue"]
end
