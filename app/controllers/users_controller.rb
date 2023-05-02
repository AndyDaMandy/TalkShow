# frozen_string_literal: true

# Users controller for views and viewing friends. Cannot edit or delete
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit; end

  def update; end
end
