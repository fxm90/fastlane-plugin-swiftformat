# fastlane-plugin-swiftformat

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-swiftformat)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-swiftformat`, add it to your project by running:

```bash
gem "fastlane-plugin-swiftformat", git: "https://github.com/fxm90/fastlane-plugin-swiftformat"
```

## About fastlane-plugin-swiftformat

Run swift code formatting using [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) with fastlane. An up-to-date list with all available rules can be found in [Rules.md](https://github.com/nicklockwood/SwiftFormat/blob/master/Rules.md) along with documentation for how they are used.

##### Example Code
```ruby
swiftformat(
  executable: "Pods/SwiftFormat/CommandLineTool/swiftformat", # Path to the `swiftformat` executable on your machine (optional)
  path: "path/to/format",                                     # Path to format (optional)
  rules: "indent,linebreaks",                                 # Specify a whitelist of rules (optional)
  disable: "redundantSelf,trailingClosures",                  # Specify rules to disable (optional)
  enable: "isEmpty",                                          # Specify rules to enable (optional)
  swiftversion: "5.1"                                         # Specify swift version (optional)
  config: "path/to/configuration/.swiftformat"                # Path to configuration file (optional)
  dryrun: false,                                              # Run in dry mode (without actually changing any files) (optional)
  lint: true                                                  # Like `--dryrun`, but returns an error if formatting is needed (optional)
)
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
