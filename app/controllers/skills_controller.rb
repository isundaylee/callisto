class SkillsController < ApplicationController
  def activate
    @skill = Skill.find(params[:id])
    @success = @skill.activate
  end

  def deactivate
    @skill = Skill.find(params[:id])
    @success = @skill.deactivate
  end

  def invoke
    @skill = Skill.find(params[:id])
    @opponent = Robot.find(params[:opponent])
    @opponent.health -= 2
    @opponent.save!
    @skill.invoke!
    redirect_to :back
  end
end
