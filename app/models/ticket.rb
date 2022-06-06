class Ticket < ApplicationRecord
  enum status: [:open, :in_progress, :closed]
  has_one :chat, dependent: :destroy
  has_one :review, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :language, presence: true, inclusion: { in: %w(Ruby HTML C CSS JavaScript Python TypeScript Elixir Vue) }

  include PgSearch::Model
  pg_search_scope :search_by_everything,
  against: [ :language, :title, :content ],
  using: {
    tsearch: { prefix: true }
  }

  LANGUAGES = ["Ruby", "HTML", "C", "CSS", "JavaScript", "Python", "Typescript", "Elixir", "Vue"]
end
