require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class SwiftformatHelper
      # class methods that you define here become available in your action
      # as `Helper::SwiftformatHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the swiftformat plugin helper!")
      end
    end
  end
end
