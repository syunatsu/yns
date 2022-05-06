class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A[a-z0-9]+\z/i }
  validates :nickname, presence: true, length: { maximum: 15 }

  has_many :articles
  has_many :comments
end
