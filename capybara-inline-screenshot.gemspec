Gem::Specification.new do |gem|
  gem.name        = "capybara-inline-screenshot"
  gem.version     = "1.0.0"
  gem.author      = "Tim Lucas"
  gem.email       = "t@toolmantim.com"
  gem.homepage    = "http://github.com/buildkite/capybara-inline-screenshot"
  gem.summary     = "Extends capybara-screenshot with inline image output"
  gem.description = gem.summary
  gem.license     = "MIT"

  gem.files = %x{ git ls-files }.split("\n").select { |d| d =~ %r{^(LICENSE.md|README.md|lib/)} }
  gem.require_paths = ["lib"]

  gem.add_dependency 'capybara-screenshot'
end
