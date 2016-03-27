# frozen-string-literal: true
require 'differin/null'
require 'differin/exceptions'
require 'differin/file'
require 'differin/diff'
require 'differin/version'
require 'differin/engines/base'
require 'differin/engines/lcs'
require 'differin/engines/system'
require 'differin/renderers/base'
require 'differin/renderers/hash'
require 'differin/renderers/json'
require 'differin/renderers/array'

module Differin
  # List of allowed extensions
  ALLOWED_EXTENSIONS = %w(txt)

  # List of allowed engines
  ALLOWED_ENGINES = [
    Differin::Engines::LCS,
    Differin::Engines::System
  ]

  # List of allowed renderers
  ALLOWED_RENDERERS = [
    Differin::Renderers::Hash,
    Differin::Renderers::JSON,
    Differin::Renderers::Array
  ]

  # Line statuses
  MODIFIED = :modified
  ADDED = :added
  REMOVED = :removed
  EQUAL = :equal

  class << self
    def diff(file1, file2, options = {})
      diff = Differin::Diff.new(file1, file2)
      diff.process(options)
    end

    def engine_exists?(engine)
      ALLOWED_ENGINES.include?(engine)
    end

    def renderer_exists?(renderer)
      ALLOWED_RENDERERS.include?(renderer)
    end
  end
end
