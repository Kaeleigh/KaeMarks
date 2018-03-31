class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.find_by(email: params[:sender])

    if user.nil?
      head 404
    else
      topic = Topic.find_or_create_by(user: user, title: params[:subject])
      topic.bookmark.create(url: params["body-plain"])
      head 200
    end
  end
end
