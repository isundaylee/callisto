class Robot < ActiveRecord::Base
  CATEGORY_NAMES = {
    ee: 'Electrical Engineering', 
    meche: 'Mechanical Engineering'
  }

  DEFAULT_SKILLSET = {
    base: [:rumble, :squeal], 
    ee: [:short_circuit], 
    meche: [:oil]
  }

  MAX_ACTIVE_SKILLS = 4

  belongs_to :user
  has_many :skills

  enum category: [:ee, :meche]

  before_create :set_defaults
  after_create :grant_base_skills

  def category_name
    CATEGORY_NAMES[self.category.to_sym]
  end

  def max_health
    8 + 2 * self.level
  end

  private
    def set_defaults
      self.level = 1
      self.category = 'ee'
      self.strength = 10
      self.speed = 10
      self.health = 10
      self.experience = 0
    end

    def grant_base_skills
      [:base, self.category.to_sym].each do |set|
        DEFAULT_SKILLSET[set].each do |s|
          self.skills.create!(category: s)
        end
      end
    end
end
