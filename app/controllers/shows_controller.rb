# frozen_string_literal: true

class ShowsController < ApplicationController
  before_action :set_show, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[edit update destroy create]
  before_action :require_admin!, only: %i[edit update new destroy create]

  # GET /shows
  # GET /shows.json
  def index
    @shows = Show.where('time BETWEEN ? and ?', Time.zone.now - 1.hour, Time.zone.now + 1.day)
    @is_admin = current_user&.is_admin
  end

  # GET /shows/1
  # GET /shows/1.json
  def show; end

  # GET /shows/new
  def new
    @show = Show.new
  end

  # GET /shows/1/edit
  def edit; end

  # POST /shows
  # POST /shows.json
  def create
    @show = Show.new(show_params)

    respond_to do |format|
      if current_user.is_admin && @show.save
        NewShowMailer.with(show: @show).new_show.deliver_later
        format.html { redirect_to shows_url, notice: 'Show was successfully created.' }
      else
        format.html { render :new,  notice: "Show was not created because #{@show.errors.messages}."  }
      end
    end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { render :show, status: :ok, location: @show }
      else
        format.html { render :edit }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
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

  def require_admin!
    unless current_user&.is_admin
      format.html { redirect_to root_url, notice: 'Permission denied.' }
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def show_params
    params.require(:show).permit(:name, :time, :location, :tickets, :price,
                                :industry_price, :theater_id, :link)
  end
end
