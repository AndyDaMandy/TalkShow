# frozen_string_literal: true

# users
class RecommendsController < ApplicationController
  before_action :set_recommend, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /recommends or /recommends.json
  def index
    @recommends = Recommend.where(friend_id: current_user.id) + current_user.recommends
  end

  # GET /recommends/1 or /recommends/1.json
  def show
  end

  # GET /recommends/new
  def new
    @recommend = Recommend.new
    @friends = current_user.friends
    @friends.each do |friend|
      if !friend.friends.include? current_user
        @friends.delete(friend)
      end
    end

    # @friends = current_user.friends.where(inverse_friends == current_user)
    # @inverse_friendships = current_user.inverse_friendships
    # @confirmed_Friends
    @friendships = current_user.friendships
    @show = Show.where(tmdb_id: params[:tmdb_id]).first!
  end

  # GET /recommends/1/edit
  def edit
  end

  # the create action will be how we build the app. It will preload the show params and pull friends via a dropdown
  # POST /recommends or /recommends.json
  def create
    @friendship = Friendship.where(friend_id: recommend_params[:friend_id]).first!
    @recommend = Recommend.new(recommend_params)
    @recommend.user = current_user
    # @recommend.show = @show
    @recommend.friendship = @friendship

    respond_to do |format|
      if @recommend.save
        format.html { redirect_to recommend_url(@recommend), notice: "Recommendation was successfully created." }
        format.json { render :show, status: :created, location: @recommend }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recommend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recommends/1 or /recommends/1.json
  def update
    respond_to do |format|
      if @recommend.update(recommend_params)
        format.html { redirect_to recommend_url(@recommend), notice: "Recommendation was successfully updated." }
        format.json { render :show, status: :ok, location: @recommend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recommend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recommends/1 or /recommends/1.json
  def destroy
    @recommend.destroy

    respond_to do |format|
      format.html { redirect_to recommends_url, notice: "Recommendation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
  def set_recommend
    @recommend = Recommend.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def recommend_params
    params.require(:recommend).permit(:user_id, :friend_id, :friendship_id, :show_id, :tmdb_id)
  end
end
