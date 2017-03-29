# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'protonbot/chanop'

Gem::Specification.new do |spec|
  spec.name          = 'protonbot-chanop'
  spec.version       = ProtonBot::Chanop::VERSION
  spec.authors       = ['Nickolay Ilyushin']
  spec.email         = ['nickolay02@inbox.ru']

  spec.summary       = 'Chanop plugin for protonbot'
  spec.description   = 'Chanop plugin for protonbot'
  spec.homepage      = 'https://github.com/handicraftsman/protonbot-chanop'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_runtime_dependency 'protonbot', '~> 0.1.0'
end
