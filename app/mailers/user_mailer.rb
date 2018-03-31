class UserMailer < ApplicationMailer
  default from:
  'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url = 'https://kaemarks-bloc.herokuapp.com/'
    mail(to: @user.email, subject:
    'Welcome to KaeMarks')
  end
end
