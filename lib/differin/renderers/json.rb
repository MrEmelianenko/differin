# frozen-string-literal: true
require 'json'

module Differin
  module Renderers
    class JSON < Differin::Renderers::Base
      def render
        diff.result.to_json
      end
    end
  end
end
