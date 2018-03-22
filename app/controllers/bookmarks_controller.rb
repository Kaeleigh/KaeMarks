class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @bookmark = @topic.bookmarks.new(params[:id])

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

    if @bookmark.save
      flash[:notice] = "Bookmark was updated."
      redirect_to @topic
    else
      flash[:alert] = "An error occurred. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])

    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted."
      redirect_to @topic
    else
      flash[:alert] = "An error occurred. Please try again."
      render [@bookmark.topic, @bookmark]
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
# closes class
end
