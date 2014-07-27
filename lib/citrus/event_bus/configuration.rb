require 'citrus/event_bus/serializer'

module Citrus
  module EventBus
    class Configuration
      attr_reader :event_serializer, :host, :port, :topic

      def initialize
        @event_serializer = Serializer.new
        @topic            = 'citrus_stream'
        @host             = 'localhost'
        @port             = 9092
      end

      def connection_string
        "#{host}:#{port}"
      end

    end
  end
end