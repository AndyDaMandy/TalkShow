# frozen_string_literal: true

# Holds season data separate from API call. Potentially no API calls here!
class SeasonViewingsController < ApplicationController
  before_action :set_season_viewing, only: %i[show edit update destroy]

  # GET /season_viewings or /season_viewings.json
  def index
    @season_viewings = SeasonViewing.all.order(created_at: :desc)
  end

  # GET /season_viewings/1 or /season_viewings/1.json
  def show
    @season = Season.where(content_id: @season_viewing.content_id).first!
    hash = TmdbService.new
    @data = hash.get_season_by_id(@season_viewing.tmdb_id, @season.season_number)
  end

  # GET /season_viewings/new
  def new
    @season_viewing = SeasonViewing.new
    @season = Season.find_or_create_by!(tmdb_id: params[:tmdb_id], content_id: params[:content_id].to_i,
                                        episode_count: params[:episode_count], season_number: params[:season_number].to_i,
                                        air_date: params[:air_date],
                                        name: params[:name], poster_path: params[:poster_path],
                                        overview: params[:overview])
  end

  # GET /season_viewings/1/edit
  def edit; end

  # POST /season_viewings or /season_viewings.json
  def create
    @season_viewing = SeasonViewing.new(season_viewing_params)
    @season_viewing.user = current_user

    respond_to do |format|
      if @season_viewing.save
        format.html { redirect_to season_viewing_url(@season_viewing), notice: "Season viewing was successfully created." }
        format.json { render :show, status: :created, location: @season_viewing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @season_viewing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /season_viewings/1 or /season_viewings/1.json
  def update
    respond_to do |format|
      if @season_viewing.update(season_viewing_params)
        format.html { redirect_to season_viewing_url(@season_viewing), notice: "Season viewing was successfully updated." }
        format.json { render :show, status: :ok, location: @season_viewing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @season_viewing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /season_viewings/1 or /season_viewings/1.json
  def destroy
    @season_viewing.destroy

    respond_to do |format|
      format.html { redirect_to season_viewings_url, notice: "Season viewing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season_viewing
      @season_viewing = SeasonViewing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def season_viewing_params
      params.require(:season_viewing).permit(:tmdb_id, :content_id, :show_id, :user_id, :viewing_id, :status, :note, :progress)
    end
end
