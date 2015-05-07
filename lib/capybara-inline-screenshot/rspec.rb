require 'capybara-inline-screenshot'
require 'capybara-screenshot'
require 'capybara-screenshot/rspec'

module CapybaraInlineScreenshot::Rspec
  extend Capybara::Screenshot::RSpec::BaseReporter

  enhance_with_screenshot :example_failed

  def example_failed_with_screenshot(notification)
    example_failed_without_screenshot(notification)

    if screenshot = notification.example.metadata[:screenshot]
      output.puts CapybaraScreenshot::Helpers.yellow("HTML screenshot: file://#{screenshot[:html]}") if screenshot[:html]
      output.puts CapybaraScreenshot::Helpers.yellow("Image screenshot: file://#{screenshot[:image]}") if screenshot[:image]
      output.puts CapybaraInlineScreenshot.escape_code_for_image(screenshot[:image]) if screenshot[:image]
    end
  end
end

Capybara::Screenshot::RSpec::REPORTERS["RSpec::Core::Formatters::ProgressFormatter"] = CapybaraInlineScreenshot::Rspec
Capybara::Screenshot::RSpec::REPORTERS["RSpec::Core::Formatters::DocumentationFormatter"] = CapybaraInlineScreenshot::Rspec
