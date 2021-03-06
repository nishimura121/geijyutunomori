class Item < ApplicationRecord
  is_impressionable

  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  attachment :image

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
 enum genre:[
    :絵,
    :陶芸,
    :彫刻,
    :工芸,
    :書
  ]


end
