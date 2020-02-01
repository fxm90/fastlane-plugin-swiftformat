describe Fastlane::Actions::SwiftformatAction do
  describe 'SwiftFormat' do
    it 'Calls SwiftFormat with given executable' do
      # Given
      executable_path = "path/to/executable"

      # When
      result = Fastlane::FastFile.new.parse("lane :test do
        swiftformat(
          executable: '#{executable_path}'
        )
      end").runner.execute(:test)

      # Then
      expect(result).to eq("#{executable_path} .")
    end

    it 'Calls SwiftFormat with given path to format' do
      # Given
      formatting_path = "path/to/format"

      # When
      result = Fastlane::FastFile.new.parse("lane :test do
        swiftformat(
          path: '#{formatting_path}'
        )
      end").runner.execute(:test)

      # Then
      expect(result).to eq("swiftformat #{formatting_path}")
    end

    it 'Calls SwiftFormat with a whitelist of rules' do
      # Given
      rules = "indent,linebreaks"

      # When
      result = Fastlane::FastFile.new.parse("lane :test do
        swiftformat(
          rules: '#{rules}'
        )
      end").runner.execute(:test)

      # Then
      expect(result).to eq("swiftformat . --rules #{rules}")
    end

    it 'Calls SwiftFormat with rules to disable' do
      # Given
      rules_to_disable = "redundantSelf,trailingClosures"

      # When
      result = Fastlane::FastFile.new.parse("lane :test do
        swiftformat(
          disable: '#{rules_to_disable}'
        )
      end").runner.execute(:test)

      # Then
      expect(result).to eq("swiftformat . --disable #{rules_to_disable}")
    end

    it 'Calls SwiftFormat with rules to enable' do
      # Given
      rules_to_enable = "isEmpty"

      # When
      result = Fastlane::FastFile.new.parse("lane :test do
        swiftformat(
          enable: '#{rules_to_enable}'
        )
      end").runner.execute(:test)

      # Then
      expect(result).to eq("swiftformat . --enable #{rules_to_enable}")
    end

    it 'Calls SwiftFormat with given swiftversion' do
      # Given
      swift_version = "123.456.789"

      # When
      result = Fastlane::FastFile.new.parse("lane :test do
        swiftformat(
          swiftversion: '#{swift_version}'
        )
      end").runner.execute(:test)

      # Then
      expect(result).to eq("swiftformat . --swiftversion #{swift_version}")
    end

    it 'Calls SwiftFormat with given path to configuration file' do
      # Given
      config_path = "path/to/configuration/.swiftformat"

      # When
      result = Fastlane::FastFile.new.parse("lane :test do
        swiftformat(
          config: '#{config_path}'
        )
      end").runner.execute(:test)

      # Then
      expect(result).to eq("swiftformat . --config #{config_path}")
    end

    it 'Calls SwiftFormat with dryrun parameter' do
      # Given
      dryrun = "true"

      # When
      result = Fastlane::FastFile.new.parse("lane :test do
        swiftformat(
          dryrun: '#{dryrun}'
        )
      end").runner.execute(:test)

      # Then
      expect(result).to eq("swiftformat . --dryrun")
    end

    it 'Calls SwiftFormat with lint parameter' do
      # Given
      lint = "true"

      # When
      result = Fastlane::FastFile.new.parse("lane :test do
        swiftformat(
          lint: '#{lint}'
        )
      end").runner.execute(:test)

      # Then
      expect(result).to eq("swiftformat . --lint")
    end

    it 'Calls SwiftFormat with all given parameters' do
      # Given
      executable_path = "path/to/executable"
      formatting_path = "path/to/format"
      rules = "indent,linebreaks"
      rules_to_disable = "redundantSelf,trailingClosures"
      rules_to_enable = "isEmpty"
      swift_version = "123.456.789"
      config_path = "path/to/configuration/.swiftformat"
      dryrun = "true"
      lint = "true"

      # When
      result = Fastlane::FastFile.new.parse("lane :test do
        swiftformat(
          executable: '#{executable_path}',
          path: '#{formatting_path}',
          rules: '#{rules}',
          disable: '#{rules_to_disable}',
          enable: '#{rules_to_enable}',
          swiftversion: '#{swift_version}',
          config: '#{config_path}',
          dryrun: '#{dryrun}',
          lint: '#{lint}'
        )
      end").runner.execute(:test)

      # Then
      expect(result).to eq("#{executable_path} #{formatting_path} --rules #{rules} --disable #{rules_to_disable} --enable #{rules_to_enable} --swiftversion #{swift_version} --config #{config_path} --dryrun --lint")
    end
  end
end
