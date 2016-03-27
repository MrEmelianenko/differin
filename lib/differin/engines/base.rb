# frozen-string-literal: true
module Differin
  module Engines
    class Base
      # Getters
      attr_reader :diff, :result, :options

      def initialize(diff, options = {})
        @diff = diff
        @result = Differin::NULL
        @options = options
      end

      def run
        return result if result != Differin::NULL
        self.result = run_engine
      end

      private

      # Setters
      attr_writer :diff, :result, :options

      def run_engine
        fail NotImplementedError
      end
    end
  end
end
