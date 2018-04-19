class Bookmark < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  has_many :likes, dependent: :destroy

  def like_present_for(user)
    likes.find_by(user: user)
  end
end
