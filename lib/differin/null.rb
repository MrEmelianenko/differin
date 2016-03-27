# frozen-string-literal: true
module Differin
  class NULL
    class << self
      def nil?
        true
      end

      def present?
        false
      end

      def blank?
        true
      end
    end
  end
end
