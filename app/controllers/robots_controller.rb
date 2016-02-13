class RobotsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    current_user.robots.create!(robot_params)
    redirect_to dashboard_path
  end

  private
    def robot_params
      params.require(:robot).permit(:name, :identifier)
    end
end
