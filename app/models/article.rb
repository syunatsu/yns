class Article < ApplicationRecord
  validates :name, presence: true
  validates :url, format: { with: /\A[a-z0-9]+\z/i }
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
end
