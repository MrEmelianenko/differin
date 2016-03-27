# frozen-string-literal: true
module Differin
  class Diff
    # Getters
    attr_reader :file1, :file2, :options

    def initialize(file1, file2)
      @file1 = Differin::File.new(file1)
      @file2 = Differin::File.new(file2)
    end

    def process(options_outer = {})
      load_options(options_outer)

      self.engine = options[:engine].new(self)
      engine.run

      self.renderer = options[:renderer].new(self)
      renderer.render
    end

    def result
      engine.result
    end

    def render(as = nil)
      return renderer.render if as.nil?
      Differin.renderer_exists?(as) or fail Differin::InvalidRenderer

      renderer = as.new(self)
      renderer.render
    end

    private

    # Setters
    attr_writer :file1, :file2, :options

    # Getters/Setters
    attr_accessor :engine, :renderer

    def load_options(options_outer)
      # noinspection RubyArgCount
      self.options = {
        engine: Differin::Engines::LCS,
        renderer: Differin::Renderers::Hash
      }.merge(options_outer)

      Differin.engine_exists?(options[:engine]) or fail Differin::InvalidEngine
      Differin.renderer_exists?(options[:renderer]) or fail Differin::InvalidRenderer
    end
  end
end
