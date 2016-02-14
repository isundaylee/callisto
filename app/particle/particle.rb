class CallistoParticleParty
  include HTTParty

  base_uri "https://api.particle.io"
end

class Particle
  CATEGORY_NAMES = [:ee, :meche]

  def initialize(access_token, device_id)
    @access_token = access_token
    @device_id = device_id
  end

  def call_device_function(function, args)
    endpoint = "/v1/devices/#{@device_id}/#{function}?access_token=#{@access_token}"
    res = CallistoParticleParty.post(endpoint, body: {args: args.to_s})
    res["return_value"]
  end

  def get_device_variable(variable)
    endpoint = "/v1/devices/#{@device_id}/#{variable}?access_token=#{@access_token}"
    res = CallistoParticleParty.get(endpoint)
    res["result"]
  end
end
