# class MailerUsersController < ApplicationController
#   before_action :set_mailer_user, only: [:show, :edit, :update, :destroy]
#
#   # GET /mailer_users
#   # GET /mailer_users.json
#   def index
#     @mailer_users = MailerUser.all
#   end
#
#   # GET /mailer_users/1
#   # GET /mailer_users/1.json
#   def show
#   end
#
#   # GET /mailer_users/new
#   def new
#     @mailer_user = MailerUser.new
#   end
#
#   # GET /mailer_users/1/edit
#   def edit
#   end
#
#   # POST /mailer_users
#   # POST /mailer_users.json
#   def create
#     @mailer_user = MailerUser.new(params[:user])
#
#     respond_to do |format|
#       if @mailer_user.save
#         UserMailer.with(mailer_user: @mailer_user).welcome_email.deliver_later
#         format.html { redirect_to @mailer_user, notice: 'Mailer user was successfully created.' }
#         format.json { render json: @mailer_user, status: :created, location: @mailer_user }
#       else
#         format.html { render :new }
#         format.json { render json: @mailer_user.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   # PATCH/PUT /mailer_users/1
#   # PATCH/PUT /mailer_users/1.json
#   def update
#     respond_to do |format|
#       if @mailer_user.update(mailer_user_params)
#         format.html { redirect_to @mailer_user, notice: 'Mailer user was successfully updated.' }
#         format.json { render :show, status: :ok, location: @mailer_user }
#       else
#         format.html { render :edit }
#         format.json { render json: @mailer_user.errors, status: :unprocessable_entity }
#       end
#     end
#   end
#
#   # DELETE /mailer_users/1
#   # DELETE /mailer_users/1.json
#   def destroy
#     @mailer_user.destroy
#     respond_to do |format|
#       format.html { redirect_to mailer_users_url, notice: 'Mailer user was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end
#
#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_mailer_user
#       @mailer_user = MailerUser.find(params[:id])
#     end
#
#     # Never trust parameters from the scary internet, only allow the white list through.
#     def mailer_user_params
#       params.require(:mailer_user).permit(:name, :email, :login)
#     end
# end
