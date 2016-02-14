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
    @skill.invoke!
  end
end
