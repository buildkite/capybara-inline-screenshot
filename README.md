# capybara-inline-screenshot

Extends [capybara-screenshot](https://github.com/mattheworiordan/capybara-screenshot) with inline image output.

In [iTerm3 (beta)](https://www.iterm2.com/version3.html):

![Screenshot of iTerm2](screenshots/iterm.png)

In [Buildkite](https://buildkite.com/):

![Screenshot of Buildkite](screenshots/buildkite.png)

## Usage

In your Gemfile simply replace `capybara-screenshot` with `capybara-inline-screenshot`:

```ruby
gem 'capybara-inline-screenshot'
```

### RSpec

For Rspec update your capabara-screenshot `require` statement from:

```ruby
require 'capybara-screenshot/rspec'
```

to:

```ruby
require 'capybara-inline-screenshot/rspec'
```

### MiniTest

For MiniTest update your capabara-screenshot `require` statement from:

```ruby
require 'capybara-screenshot/rspec'
```

to:

```ruby
require 'capybara-inline-screenshot/minitest'
```

and then include it in your tests as you need:

```
class SystemTest < Minitest::Test
  include CapybaraInlineScreenshot::Minitest
end
```

### Cucumber

For Cucumber update your capabara-screenshot `require` statement from:

```ruby
require 'capybara-screenshot/cucumber'
```

to:

```ruby
require 'capybara-inline-screenshot/cucumber'
```

### Artifact uploads

The final step is to configure your build steps to upload the screenshot artifacts. The default path is your app’s `tmp` directory, so the artifact upload pattern would be `tmp/*.png`

## Fallback

Thanks the wonder of ANSI escape codes if your terminal client doesn't understand the escape codes it'll simply ignore them—it'll just be be like using the standard capybara-screenshot gem.

## CI-mode

If the `CI` environment variable is present screenshots will be output in the [Terminal artifact:// format](http://buildkite.github.io/terminal/inline-images/) with the expectation that the images are uploaded as build artifacts and inlined by your CI system. You can also force this mode by setting the environment variable `CAPYBARA_INLINE_SCREENSHOT=artifact`.

If the `CI` environment variable is not present screenshots will be output in the base64 encoded [iTerm2 image format](http://iterm2.com/images.html) for viewing in a local terminal. You'll need the nightly release of iTerm to see the images.

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT).
