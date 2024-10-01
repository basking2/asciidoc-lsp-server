# frozen_string_literal: true

require "logger"

module AsciiDoc
  module Lsp
    # Extend the normal logger with defaults appropriate for running over stdio.
    class Logger < ::Logger
      def initialize
        super($stderr)
      end
    end
  end
end
