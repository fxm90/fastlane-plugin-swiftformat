require 'fastlane/action'
require_relative '../helper/swiftformat_helper'

module Fastlane
  module Actions
    class SwiftformatAction < Action
      def self.run(params)
        if `which swiftformat`.to_s.length == 0 && params[:executable].nil? && !Helper.test?
          UI.user_error!("You have to install swiftformat using `brew install swiftformat` or specify the executable path with the `:executable` option.")
        end

        command = ""
        if params[:executable]
          command << params[:executable]
        else
          command << "swiftformat"
        end

        if params[:path]
          command << " #{params[:path].shellescape}"
        else
          command << " ."
        end

        command << " --rules #{params[:rules].shellescape}" if params[:rules]
        command << " --disable #{params[:disable].shellescape}" if params[:disable]
        command << " --enable #{params[:enable].shellescape}" if params[:enable]

        command << " --swiftversion #{params[:swiftversion].shellescape}" if params[:swiftversion]
        command << " --config #{params[:config].shellescape}" if params[:config]
        command << ' --header "' + params[:header] + '"' if params[:header]

        command << " --dryrun" if params[:dryrun]
        command << " --lint" if params[:lint]

        Actions.sh(command)
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Run swift code formatting using SwiftFormat"
      end

      def self.details
        "Run swift code formatting using [SwiftFormat](https://github.com/nicklockwood/SwiftFormat). Please specify your options using a `.swiftformat` file.  An up-to-date list with all available rules can be found in [Rules.md](https://github.com/nicklockwood/SwiftFormat/blob/master/Rules.md) along with documentation for how they are used."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :executable,
                                       env_name: "SWIFTFORMAT_EXECUTABLE",
                                       description: "Path to the `swiftformat` executable on your machine",
                                       is_string: true,
                                       optional: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Couldn't find path '#{File.expand_path(value)}'") unless File.exist?(value) || Helper.test?
                                       end),
          FastlaneCore::ConfigItem.new(key: :path,
                                       env_name: "SWIFTFORMAT_PATH",
                                       description: "Path to format",
                                       is_string: true,
                                       optional: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Couldn't find path '#{File.expand_path(value)}'") unless File.exist?(value) || Helper.test?
                                       end),
          FastlaneCore::ConfigItem.new(key: :rules,
                                       env_name: "SWIFTFORMAT_RULES",
                                       description: "Specify a whitelist of rules",
                                       is_string: false,
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :disable,
                                       env_name: "SWIFTFORMAT_DISABLE",
                                       description: "Specify rules to disable",
                                       is_string: false,
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :enable,
                                       env_name: "SWIFTFORMAT_ENABLE",
                                       description: "Specify rules to enable",
                                       is_string: false,
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :swiftversion,
                                       env_name: "SWIFTFORMAT_SWIFTVERSION",
                                       description: "Specify swift version",
                                       is_string: false,
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :config,
                                       env_name: "SWIFTFORMAT_CONFIG",
                                       description: "Path to configuration file",
                                       is_string: true,
                                       optional: true,
                                       verify_block: proc do |value|
                                         UI.user_error!("Couldn't find path '#{File.expand_path(value)}'") unless File.exist?(value) || Helper.test?
                                       end),
          FastlaneCore::ConfigItem.new(key: :header,
                                       env_name: "SWIFTFORMAT_HEADER",
                                       description: "Strip or replace the header comments in every file with the given template",
                                       is_string: true,
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :dryrun,
                                       env_name: "SWIFTFORMAT_DRYRUN",
                                       description: "Run in dry mode (without actually changing any files)",
                                       is_string: false,
                                       optional: true),
          FastlaneCore::ConfigItem.new(key: :lint,
                                       env_name: "SWIFTFORMAT_LINT",
                                       description: "Like `--dryrun`, but returns an error if formatting is needed",
                                       is_string: false,
                                       optional: true)
        ]
      end

      def self.output
      end

      def self.return_value
      end

      def self.authors
        ["fxm90"]
      end

      def self.is_supported?(platform)
        [:ios, :mac].include?(platform)
      end

      def self.example_code
        [
          'swiftformat(
            executable: "Pods/SwiftFormat/CommandLineTool/swiftformat", # Path to the `swiftformat` executable on your machine (optional)
            path: "path/to/format",                                     # Path to format (optional)
            rules: "indent,linebreaks",                                 # Specify a whitelist of rules (optional)
            disable: "redundantSelf,trailingClosures",                  # Specify rules to disable (optional)
            enable: "isEmpty",                                          # Specify rules to enable (optional)
            swiftversion: "5.1"                                         # Specify swift version (optional)
            config: "path/to/configuration/.swiftformat"                # Path to configuration file (optional)
            header: "{file}\nCopyright (c) 2022 Foobar Industries"      # Strip or replace the header comments in every file with the given template (optional)
            dryrun: false,                                              # Run in dry mode (without actually changing any files) (optional)
            lint: true                                                  # Like `--dryrun`, but returns an error if formatting is needed (optional)
          )'
        ]
      end

      def self.category
        :testing
      end
    end
  end
end
