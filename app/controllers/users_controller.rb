# class UsersController < ApplicationController
#  def new
#    @user = User.new
#  end
#
#  def create
#    @user = User.create(user_params)
#    if @user.save
#      redirect_to tests_path
#    else
#      flash.now[:errors] = @user.errors.full_messages
#      render :new
#    end
#  end
#
#  private
#
#  def user_params
#    params.require(:user).permit(:email, :password, :password_confirmation, :name)
#  end
# end
