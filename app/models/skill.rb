class Skill < ActiveRecord::Base
  belongs_to :robot
  has_many :trainings

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  CATEGORY_NAMES = {
    rumble: 'Rumble',
    squeal: 'Squeal',
    punch: 'Punch',
    buckle: 'Buckle',
    oil: 'Oil',
    light_eyes: 'Light Eyes',
    raise_voltage: 'Raise Voltage',
    short_circuit: 'Short Circuit'
  }

  enum category: [:rumble, :squeal, :punch, :buckle, :oil, :light_eyes, :raise_voltage, :short_circuit]

  before_create :set_defaults

  def category_name
    CATEGORY_NAMES[self.category.to_sym]
  end

  def activate
    return false if self.robot.skills.active.size == Robot::MAX_ACTIVE_SKILLS
    self.active = true
    self.save!
    return true
  end

  def deactivate
    self.active = false
    self.save!
    return true
  end

  private
    def set_defaults
      self.level = 1
      self.experience = 0
      self.active = false
      true
    end

end
