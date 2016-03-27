# frozen-string-literal: true
module Differin
  module Renderers
    class Hash < Differin::Renderers::Base
      def render
        diff.result
      end
    end
  end
end
