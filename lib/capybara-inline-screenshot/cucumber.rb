require 'capybara-inline-screenshot'
require 'capybara-screenshot'

Before do |scenario|
  Capybara::Screenshot.final_session_name = nil
end

After do |scenario|
  if Capybara::Screenshot.autosave_on_failure && scenario.failed?
    Capybara.using_session(Capybara::Screenshot.final_session_name) do
      filename_prefix = Capybara::Screenshot.filename_prefix_for(:cucumber, scenario)

      saver = Capybara::Screenshot::Saver.new(Capybara, Capybara.page, true, filename_prefix)
      saver.save
      saver.output_screenshot_path

      if File.exist?(saver.screenshot_path)
        encoded_img = CapybaraInlineScreenshot.inline_base64(File.read(saver.screenshot_path))
        embed(encoded_img, 'image/png;base64', "Screenshot of the error")

        STDOUT.puts CapybaraInlineScreenshot.escape_code_for_image(saver.screenshot_path)
      end
    end
  end
end
