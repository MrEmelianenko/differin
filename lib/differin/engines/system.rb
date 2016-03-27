# frozen-string-literal: true
module Differin
  module Engines
    class System < Differin::Engines::Base
      private

      def run_engine
        {
          a: :a,
          b: :b
        }
      end
    end
  end
end
