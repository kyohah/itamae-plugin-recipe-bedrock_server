# frozen_string_literal: true

require_relative "lib/itamae/plugin/recipe/bedrock_server/version"

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-bedrock_server"
  spec.version       = Itamae::Plugin::Recipe::BedrockServer::VERSION
  spec.authors       = ["kyohah"]
  spec.email         = ["3257272+kyohah@users.noreply.github.com"]

  spec.summary       = "Write a short summary, because RubyGems requires one."
  spec.description   = "Write a longer description or delete this line."
  spec.homepage      = "https://github.com/kyohah/itamae-plugin-recipe-bedrock_server"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "itamae"

  spec.add_development_dependency "docker-api"
  spec.add_development_dependency "serverspec"
end
