require 'serverspec'
require 'docker'
require "yaml"
require "itamae"

set :backend, :docker

set :docker_image, ENV['DOCKER_IMAGE']
set :docker_container, ENV['DOCKER_CONTAINER']

def node
  return @node if @node

  hash = YAML.load_file("#{__dir__}/../recipes/node.yml")

  @node = Itamae::Node.new(hash, Specinfra.backend)
end
