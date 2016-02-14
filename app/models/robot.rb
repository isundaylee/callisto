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

  DEFAULT_IMAGE_URI = {
    base: "https://placehold.it/400x250",
    ee: "http://i.imgur.com/ThumYo2.jpg",
    meche: "http://i.imgur.com/bf0llYo.jpg"
  }

  MAX_ACTIVE_SKILLS = 4

  belongs_to :user
  has_many :skills

  enum category: [:ee, :meche]

  before_create :fetch_category
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
      self.strength = 10
      self.speed = 10
      self.health = 10
      self.experience = 0
      self.image_uri = DEFAULT_IMAGE_URI[self.category.to_sym]
      puts self.image_uri
      true
    end

    def grant_base_skills
      [:base, self.category.to_sym].each do |set|
        DEFAULT_SKILLSET[set].each do |s|
          self.skills.create!(category: s)
        end
      end
      true
    end

    def fetch_category
      client = Particle.new('7941c28d0fca23c2efbe75bbd0f0d6ad81210f5c', self.identifier)
      self.category = client.get_device_variable('category')
      true
    end
end
