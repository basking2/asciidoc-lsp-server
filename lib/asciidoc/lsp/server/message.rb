# frozen_string_literal: true

require "json"

require_relative "./message/initialize"

module AsciiDoc
  module Lsp
    class Server
      # Message
      class Message
        attr_accessor :logger

        def initialize(out_stream, logger)
          @logger = logger
          @out_stream = out_stream
        end

        def handle(msg)
          case msg["method"]
          when "rando"
            puts "Rando."
          when "initialize"
            $stderr.print("INIT!")
            $stderr.flush
          else
            $stderr.print("Whoops.")
            $stderr.flush
          end
        end
      end
    end
  end
end
