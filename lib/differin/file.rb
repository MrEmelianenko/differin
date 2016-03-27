# frozen-string-literal: true
module Differin
  class File
    # Getters
    attr_reader :file

    def initialize(file)
      @file = load_file(file)
      fail Differin::InvalidFile unless valid?
    end

    def filename
      ::File.basename(file.path)
    end

    def extension
      ::File.extname(file.path).delete('.')
    end

    def lines
      return @lines if defined?(@lines)
      @lines = readlines
    end

    def valid?
      return false unless ALLOWED_EXTENSIONS.include?(extension)
      true
    end

    private

    # Setters
    attr_writer :file

    def load_file(file)
      return file if file.is_a?(::File)
      fail Differin::FileNotFound unless ::File.exist?(file.to_s)

      ::File.open(file.to_s, 'r')
    end

    def readlines
      file.readlines.map do |line|
        line.delete("\r").delete("\n")
      end
    end
  end
end
