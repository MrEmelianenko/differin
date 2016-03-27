# frozen-string-literal: true
module Differin
  module Renderers
    class Base
      # Getters
      attr_reader :diff, :options

      def initialize(diff, options = {})
        @diff = diff
        @options = options
      end

      def render
        fail NotImplementedError
      end

      private

      # Setters
      attr_writer :diff, :options
    end
  end
end
