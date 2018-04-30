$:.push File.expand_path('../lib', __FILE__)
require 'active_path/view_injection/version'

Gem::Specification.new do |s|
  s.name        = 'active_path-view_injection'
  s.version     = ActivePath::ViewInjection::VERSION
  s.date        = '2018-04-28'
  s.summary     = "ActivePath View Injection"
  s.description = "Inject partials before or after other partials!"
  s.authors     = ["Ryan Tulino"]
  s.email       = 'rtulino@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'http://rubygems.org/gems/active_path-view_injection'
  s.required_ruby_version = '>= 2.2.0'
  s.add_dependency 'rails', '~> 5'
  s.add_dependency 'active_path', '~> 0.1.0'
end