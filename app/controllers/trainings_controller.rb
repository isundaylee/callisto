class TrainingsController < ApplicationController
  def train
    @skill = Skill.find(params[:id])
    @training_name = params[:name]
    @training = Training.training_with_name(@training_name)

    @questions = @training['questions']
  end

  def submit
    @skill = Skill.find(params[:id])
    @training_name = params[:name]
    @training = Training.training_with_name(@training_name)
    @wrong = []
    @answers = []

    @training['questions'].each_with_index do |q, i|
      @wrong << i unless params["answer_#{i}"].to_i == q['answer']
      @answers << params["answer_#{i}"].to_i
    end

    if @wrong.empty?
      @skill.level += 1
      @skill.save! 
      @skill.trainings.create!(name: @training_name)

      redirect_to dashboard_path
    else
      @questions = @training['questions']
      render 'train', locals: {wrong: @wrong, answers: @answers}
    end
  end
end
