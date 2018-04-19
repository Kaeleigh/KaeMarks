class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.includes(bookmarks: :likes).find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    if @topic.save
      flash[:notice] = "Topic created successfully!"
      redirect_to @topic
    else
      flash.now[:alert] = "An error occurred. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Topic updated successfully!"
      redirect_to @topic
    else
      flash.now[:alert] = "An error occurred. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" Topic was deleted!"
      redirect_to action: :index
    else
      flash.now[:alert] = "An error occurred. Please try again."
      render :show
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end

# closes class
end
