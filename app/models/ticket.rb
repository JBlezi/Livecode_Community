class Ticket < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :language, presence: true, inclusion: { in: %w(Ruby HTML C CSS JavaScript Python TypeScript Elixir Vue) }
end
