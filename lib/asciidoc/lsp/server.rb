# frozen_string_literal: true

require_relative "server/version"

module AsciiDoc
  module Lsp
    # Entry point. Give this an input stream and an output stream to communicate over.
    class Server
      class Error < StandardError; end

      def initialize(in_stream = $stdin, out_stream = $stdout)
        @in_stream = in_stream
        @out_stream = out_stream
      end

      def run
        l = @in_stream.gets("\r\n")
        puts l
      end
    end
  end
end
