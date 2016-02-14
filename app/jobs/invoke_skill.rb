class InvokeSkill
  @queue = :invoke_skill

  def self.perform(skill_id)
    skill = Skill.find(skill_id)

    client = Particle.new('7941c28d0fca23c2efbe75bbd0f0d6ad81210f5c', skill.robot.identifier)

    case skill.category.to_sym
    when :rumble
      client.call_device_function("setRumble", :on)
      sleep 2
      client.call_device_function("setRumble", :off)
    when :squeal
    when :punch
      client.call_device_function("setArm", 180)
      sleep 0.5
      client.call_device_function("setArm", 0)
      sleep 0.5
      client.call_device_function("setArm", 180)
      sleep 0.5
      client.call_device_function("setArm", 0)
    when :buckle
    when :oil
    when :light_eyes
      client.call_device_function("setBlaze", 180)
      sleep 0.5
      client.call_device_function("setBlaze", 0)
      sleep 0.5
      client.call_device_function("setBlaze", 180)
      sleep 0.5
      client.call_device_function("setBlaze", 0)
    when :raise_voltage
    when :short_circuit
      client.call_device_function("setBlaze", 255)
      sleep 2
      client.call_device_function("setBlaze", 0)
    end
  end
end
