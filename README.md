# capybara-inline-screenshot

Extends [capybara-screenshot](https://github.com/mattheworiordan/capybara-screenshot) with inline image output.

In [iTerm2 (nightly)](http://iterm2.com/):

![Screenshot of iTerm2](screenshots/iterm.png)

In [Buildkite](https://buildkite.com/):

![Screenshot of Buildkite](screenshots/buildkite.png)

## Usage

Add it to your Gemfile (after `capybara-screenshot`):

```ruby
gem 'capybara-inline-screenshot'
```

And replace your call to:

```ruby
require 'capybara-screenshot/rspec'
```

with:

```ruby
require 'capybara-inline-screenshot/rspec'
```

## Fallback

Thanks the wonder of ANSI escape codes if your terminal client doesn't understand what this gem outputs it'll simply ignore it (it'll be like you're just using the standard capybara-screenshot). But if it does support it: INLINE IMAGES!

## CI-mode

If the `CI` environment variable is present screenshots will be output in the [Terminal artifact:// format](http://buildkite.github.io/terminal/inline-images/) with the expectation that the images are uploaded as build artifacts and inlined by your CI system. You can also force this mode by setting the environment variable `CAPYBARA_INLINE_SCREENSHOT=artifact`.

If the `CI` environment variable is not present screenshots will be output in the base64 encoded [iTerm2 image format](http://iterm2.com/images.html) for viewing in a local terminal.

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT).
