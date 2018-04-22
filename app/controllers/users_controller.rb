class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    #populate @user_bookmarks with user's bookmarks
    @user_bookmarks = Bookmark.where(:user_id => current_user.id)
    #populate @liked_bookmarks with liked bookmarks
    @liked_bookmarks = Like.where(:user_id => current_user.id)
  end
end
