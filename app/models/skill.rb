class Skill < ActiveRecord::Base
  belongs_to :robot

  scope :active, -> { where(active: true) }

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

  private
    def set_defaults
      self.level = 1
      self.experience = 0
    end

end
