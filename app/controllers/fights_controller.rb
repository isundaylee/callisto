class FightsController < ApplicationController
  def show
    @fight = Fight.find(params[:id])
  end

  def create
    @fight = Fight.create!(fight_params)
    redirect_to @fight
  end

  private
    def fight_params
      params.require(:fight).permit(:challenger_id, :challengee_id)
    end
end
