class FightsController < ApplicationController
  def show
    @fight = Fight.find(params[:id])

    @bot_a, @bot_b = @fight.challenger, @fight.challengee
    @bot_a, @bot_b = @bot_b, @bot_a if @bot_a.user == current_user
  end

  def create
    @fight = Fight.create!(fight_params)
    @fight.challenger.heal
    @fight.challengee.heal
    redirect_to @fight
  end

  private
    def fight_params
      params.require(:fight).permit(:challenger_id, :challengee_id)
    end
end
