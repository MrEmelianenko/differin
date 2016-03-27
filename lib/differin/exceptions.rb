# frozen-string-literal: true
module Differin
  class BaseError < StandardError; end

  # Files
  class FileNotFound < Differin::BaseError; end
  class InvalidFile < Differin::BaseError; end

  # Engines
  class InvalidEngine < Differin::BaseError; end

  # Renderers
  class InvalidRenderer < Differin::BaseError; end
end
