# MIDI Visualizer - Simulator

![Screenshot](./docs/assets/screenshot.png)

## Installation

You will need to install [`simple2d`](http://www.ruby2d.com/learn/get-started/) before running the application. Then call `bundle exec rake install` to set up the rest. 

If you are using [Homebrew](https://brew.sh) you can quickly get up and running with the following commands.

```
brew tap simple2d/tap
brew install simple2d
bundle install
```

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).