class Article < ApplicationRecord
  validates :name, presence: true
  validates :url, format: { with: /\A[a-z0-9]+\z/i }
  validates :category_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 8 }

  belongs_to :user
end
