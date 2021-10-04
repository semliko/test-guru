class UserBadgesController < ApplicationController
  before_action :set_user_badge, only: %i[ show edit update destroy ]

  # GET /user_badges or /user_badges.json
  def index
    @user_badges = current_user.badges
  end

  # GET /user_badges/1 or /user_badges/1.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user_badge
    @user_badge = UserBadge.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_badge_params
    params.require(:user_badge).permit(:user_id, :badge_id)
  end
end
