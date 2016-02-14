class InvokeSkill
  @queue = :invoke_skill

  def self.perform(skill_id)
    skill = Skill.find(skill_id)

    client = 
      Particle.new('7941c28d0fca23c2efbe75bbd0f0d6ad81210f5c', skill.robot.identifier)

    case skill.category.to_sym
    when :rumble
      client.call_device_function("setEyes", :on)
      sleep 2
      client.call_device_function("setEyes", :off)
    when :squeal
    when :punch
    when :buckle
    when :oil
    when :light_eyes
    when :raise_voltage
    when :short_circuit
    end
  end
end