require 'base64'
require 'capybara-screenshot'

module CapybaraInlineScreenshot
  # Sets the default base directory for artifacts (usually the root dir of the
  # project). Defaults to Rails.root but can be set to another value if you're
  # not using Rails.
  def self.base_artifact_dir=(path)
    @base_artifact_dir = path
  end

  def self.base_artifact_dir
    @base_artifact_dir || (Rails.root if defined? Rails)
  end

  def self.escape_code_for_image(path)
    if ENV['CI'] || ENV['CAPYBARA_INLINE_SCREENSHOT'] == 'artifact'
      artifact_escape_code_for_image(path)
    else
      base64_escape_code_for_image(path)
    end
  end

  def self.artifact_escape_code_for_image(path)
    relative_path = path.sub(/\A#{base_artifact_dir}\/?/, '')
    "\e]1338;url=artifact://#{relative_path}\a"
  end

  def self.base64_escape_code_for_image(path)
    name = inline_base64(File.basename(path))
    image = inline_base64(File.read(path))
    "\e]1337;File=name=#{name};inline=1:#{image}\a"
  end

  def self.inline_base64(string)
    Base64.encode64(string).gsub("\n",'')
  end
end
