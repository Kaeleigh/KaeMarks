class LikesController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    # @topic = Topic.find(params[:topic_id])
    like = current_user.likes.build(bookmark: @bookmark)

    authorize like

    if like.save
      flash[:notice] = "Like was saved successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "Error creating like. Please try again."
      redirect_to @topic
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @topic = Topic.find(params[:topic_id])
    like = Like.find(params[:id])

    authorize like
    if like.destroy
      flash[:notice] = "Like was deleted successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "There was an error deleting the like."
      redirect_to @topic
    end
  end

end
