# frozen-string-literal: true
require 'diff-lcs'

module Differin
  module Engines
    class LCS < Differin::Engines::Base
      private

      # Getters/Setters
      attr_accessor :sequence1, :sequence2, :engine_result

      def run_engine
        load_sequences
        run_diff_lcs
        convert_result
      end

      def load_sequences
        self.sequence1 = diff.file1.lines
        self.sequence2 = diff.file2.lines
      end

      def run_diff_lcs
        self.engine_result = ::Diff::LCS.sdiff(sequence1, sequence2)
      end

      def convert_result
        engine_result.map do |row|
          row = row.to_a

          {
            status: map_status(row[0]),
            lines: [row[1][0], row[2][0]],
            values: [row[1][1], row[2][1]]
          }
        end
      end

      # Map statuses from LCS to Differin
      def map_status(status)
        {
          Differin::MODIFIED  => '!',
          Differin::EQUAL     => '=',
          Differin::ADDED     => '+',
          Differin::REMOVED   => '-'
        }.key(status)
      end
    end
  end
end
