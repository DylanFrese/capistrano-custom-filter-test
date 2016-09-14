class RegionFilter

  def initialize(regions)
    @regions = Array(regions)
  end

  def filter(servers)
    servers.select {|server|
      region = server.fetch(:region)
      region && @regions.include?(region)
    }
  end
end

set :stage_config_path, 'capistrano-config/deploy'
set :deploy_config_path, 'capistrano-config/deploy.rb'

if ENV['REGIONS']
  regions = ENV['REGIONS'].split(',')
  filter = RegionFilter.new(regions)
  Capistrano::Configuration.env.add_filter(filter)
end

require 'capistrano/setup'
require 'capistrano/deploy'
