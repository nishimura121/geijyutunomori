class Item < ApplicationRecord
  is_impressionable

  belongs_to :user
  belongs_to :genre
  has_many :comments
  has_many :favorites
  has_many :likes
  attachment :image

end
