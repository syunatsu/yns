class Article < ApplicationRecord
  validates :name, presence: true
  # validates :url, format: { with: /\A[a-z0-9]+\z/i }
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }
  validate :validate_image

  belongs_to :user
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  def self.search(search)
    if search != ""
      Article.where('name like(?)', "%#{search}%")
    else
      Aeticle.all
    end
  end

  private

  def validate_image
    errors.add(:image, 'を1枚添付してください') unless image.attached?
  end
end
