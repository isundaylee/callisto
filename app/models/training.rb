class Training < ActiveRecord::Base
  belongs_to :skill

  def self.trainings_for(skill)
    trainings[skill.category.to_s] || []
  end

  def self.available_trainings_for(skill)
    trainings_for(skill).select do |t|
      !skill.has_completed_training?(t['name'])
    end.select do |t|
      (!t['prereq'].present?) || skill.has_completed_training?(t['prereq'])
    end
  end

  def self.next_training_for(skill)
    self.available_trainings_for(skill).first
  end

  def self.has_available_trainings_for?(skill)
    !self.next_training_for(skill).nil?
  end

  def self.training_with_name(name)
    trainings.map do |k, v|
      v.detect { |t| t['name'] == name }
    end.compact.first
  end

  private
    def self.trainings
      JSON.parse(File.read(File.join(Rails.root, 'app/assets/trainings.json')))
    end
end
