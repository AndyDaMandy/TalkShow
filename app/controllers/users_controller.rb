# frozen_string_literal: true

# Users controller for views and viewing friends. Cannot edit or delete
class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'Profile was successfully updated.' }
        format.json { render :user, status: :ok, location: @user }
      else
        format.html { render :user, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_params
    params.require(:user).permit(:words_to_live_by, :age, :avatar, :first_name, :last_name, :location)
  end

end
