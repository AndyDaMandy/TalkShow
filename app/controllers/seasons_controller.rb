# frozen_string_literal: true

# Shows seasons in a view...without API
class SeasonsController < ApplicationController
  before_action :set_season, only: %i[ show edit update destroy ]

  # GET /seasons or /seasons.json
  def index
    @seasons = Season.all
  end

  # GET /seasons/1 or /seasons/1.json
  def show
    @new_season = Season.find_or_create_by!(tmdb_id: params[:tmdb_id], content_id: params[:content_id].to_i,
                                            episode_count: params[:episode_count], season_number: params[:season_number].to_i,
                                            air_date: params[:air_date],
                                            name: params[:name], poster_path: params[:poster_path],
                                            overview: params[:overview])
    hash = TmdbService.new
    @data = hash.get_season_by_id(@season.tmdb_id, @season.season_number)
  end

  # GET /seasons/new
  def new
    @season = Season.new
  end

  # GET /seasons/1/edit
  def edit
  end

  # POST /seasons or /seasons.json
  def create
    @season = Season.new(season_params)

    respond_to do |format|
      if @season.save
        format.html { redirect_to season_url(@season), notice: 'Season was successfully created.' }
        format.json { render :show, status: :created, location: @season }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seasons/1 or /seasons/1.json
  def update
    respond_to do |format|
      if @season.update(season_params)
        format.html { redirect_to season_url(@season), notice: 'Season was successfully updated.' }
        format.json { render :show, status: :ok, location: @season }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seasons/1 or /seasons/1.json
  def destroy
    @season.destroy

    respond_to do |format|
      format.html { redirect_to seasons_url, notice: 'Season was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_season
    @season = Season.find(params[:id])
  end

  def season_params
    params.require(:season).permit(:name, :content_id, :season_number, :episode_count, :air_date, :overview, :poster_path)
  end
end
