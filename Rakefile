#!/usr/bin/env rake

$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'active_path/view_injection/version'

desc "Release version #{ActivePath::ViewInjection::VERSION} of the gem"
task :release do

  system "git tag -a v#{ActivePath::ViewInjection::VERSION} -m 'Tagging #{ActivePath::ViewInjection::VERSION}'"
  system 'git push --tags'

  system "gem build active_path-view_injection.gemspec"
  system "gem push active_path-view_injection-#{ActivePath::ViewInjection::VERSION}.gem"
  system "rm active_path-view_injection-#{ActivePath::ViewInjection::VERSION}.gem"
end
