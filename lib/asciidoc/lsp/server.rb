# frozen_string_literal: true

require "logger"
require "json"
require "asciidoc/lsp/server/message"

require_relative "server/version"

module AsciiDoc
  module Lsp
    # Entry point. Give this an input stream and an output stream to communicate over.
    class Server
      class Error < StandardError; end

      attr_accessor :logger

      def initialize(in_stream = $stdin, out_stream = $stdout)
        @in_stream = in_stream
        @out_stream = out_stream
        @logger = Logger.new($stderr)
        @message_processor = Message.new(@out_stream, @logger)
      end

      def run
        body_length = nil
        loop do
          line = @in_stream.gets("\r\n", chomp: true)
          @logger.info("> #{line}")

          if line.empty?
            body = @in_stream.read(body_length)
            @logger.info(body)
            body = JSON.parse(body)

            @message_procesor.handle(body)
          elsif line =~ /content-length: (\d+)/i
            body_length = Regexp.last_match[1].to_i
            @logger.info("D #{line}")
          end

        end
      end
    end
  end
end
