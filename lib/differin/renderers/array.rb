# frozen-string-literal: true
module Differin
  module Renderers
    class Array < Differin::Renderers::Base
      def render
        diff.result.map do |row|
          [
            row[:status],
            [row[:lines].first, row[:values].first],
            [row[:lines].last, row[:values].last]
          ]
        end
      end
    end
  end
end
