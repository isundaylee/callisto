class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def homepage
  end

  def dashboard
    @robots = current_user.robots.all
    @current_robot = @robots.first
  end
end
