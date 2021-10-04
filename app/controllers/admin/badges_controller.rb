class Admin::BadgesController < ApplicationController
  before_action :set_badge, only: %i[ show edit update destroy ]

  # GET /badges or /badges.json
  def index
    @badges = Badge.all
  end

  # GET /badges/1 or /badges/1.json
  def show
  end

  # GET /badges/new
  def new
    @badge = Badge.new
  end

  # GET /badges/1/edit
  def edit
  end

  # POST /badges or /badges.json
  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: "Badge was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /badges/1 or /badges/1.json
  def update
    if @badge.update(badge_params)
      redirect_to @badge, notice: "Badge was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /badges/1 or /badges/1.json
  def destroy
    @badge.destroy
    redirect_to admin_badges_url, notice: "Badge was successfully destroyed."
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_badge
    @badge = Badge.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def badge_params
    params.require(:badge).permit(:name, :image_url)
  end
end
