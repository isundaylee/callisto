class Robot < ActiveRecord::Base
  CATEGORY_NAMES = {
    ee: 'Electrical Engineering', 
    cs: 'Computer Science', 
    physics: 'Physics'
  }

  belongs_to :user

  enum category: [:ee, :cs, :physics]

  before_create :set_defaults

  def category_name
    CATEGORY_NAMES[self.category.to_sym]
  end

  def max_health
    8 + 2 * self.level
  end

  private
    def set_defaults
      self.level = 1
      self.category = 'cs'
      self.strength = 10
      self.speed = 10
      self.health = 10
      self.experience = 0
    end
end
