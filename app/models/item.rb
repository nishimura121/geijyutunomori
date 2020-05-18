class Item < ApplicationRecord
  is_impressionable

  belongs_to :user
  belongs_to :genre
  has_many :comments
  has_many :favorites
  has_many :bookmarks
  attachment :image

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def bookmark_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
