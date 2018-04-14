class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)

    @bookmark.user = current_user
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved!"
      redirect_to @topic
    else
      flash.now[:alert] = "An error occurred. Please try again."
      render :new
    end
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.assign_attributes(bookmark_params)

    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was updated."
      redirect_to @bookmark.topic
    else
      flash[:alert] = "An error occurred. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted."
      redirect_to @bookmark.topic
    else
      flash[:alert] = "An error occurred. Please try again."
      render :show
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
# closes class
end
