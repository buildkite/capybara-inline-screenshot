require 'capybara-inline-screenshot'

module CapybaraInlineScreenshot::Minitest
  def before_setup
    super
    Capybara::Screenshot.final_session_name = nil
  end

  def before_teardown
    super

    if Capybara::Screenshot.autosave_on_failure && !passed?
      Capybara.using_session(Capybara::Screenshot.final_session_name) do
        filename_prefix = Capybara::Screenshot.filename_prefix_for(:minitest, self)

        saver = Capybara::Screenshot::Saver.new(Capybara, Capybara.page, true, filename_prefix)
        saver.save
        saver.output_screenshot_path

        if File.exist?(saver.screenshot_path)
          puts CapybaraInlineScreenshot.escape_code_for_image(saver.screenshot_path)
        end
      end
    end
  end
end
