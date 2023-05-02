# frozen_string_literal: true

# Not used, but for creating a show view potentially
class ShowsController < ApplicationController
  before_action :set_show, only: %i[show edit update destroy]

  # GET /shows or /shows.json
  def index
    @shows = Show.all
  end

  def search
    response = TmdbService.find_tv_show(params[:title])
  end

  # GET /shows/1 or /shows/1.json
  def show; end

  # GET /shows/new
  def new
    #     @show = Show.new
    #     hash = TmdbService.new
    #     data = hash.get_show_by_title(query)
    #     result = data[0]
  end

  # GET /shows/1/edit
  def edit; end

  # POST /shows or /shows.json
  def create
    # hash = TmdbService.new
    # data = hash.get_show_by_title(query)
    # result = data[0]
    #     @show = Show.new(
    #                     name: result["name"],
    #                     original_name: result["original_name"],
    #                     original_language
    #                     tmdb_id: result["id"],
    #                     origin_country: result["origin_country"],
    #                     overview: result["overview"],
    #                     poster_path: result["poster_path"],
    #                     vote_average: result["vote_average"],
    #                     first_air_date: result["first_air_date"]
    #     )

    respond_to do |format|
      if @show.save
        format.html { redirect_to show_url(@show), notice: 'Show was successfully created.' }
        format.json { render :show, status: :created, location: @show }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shows/1 or /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to show_url(@show), notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1 or /shows/1.json
  def destroy
    @show.destroy

    respond_to do |format|
      format.html { redirect_to shows_url, notice: 'Show was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_show
    @show = Show.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def show_params
    params.require(:show).permit(:tmdb_id)
  end
end
