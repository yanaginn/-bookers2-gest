class Book < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: { maximum: 200 }
  has_many :favorites, dependent: :destroy


  belongs_to :user

  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end


end
