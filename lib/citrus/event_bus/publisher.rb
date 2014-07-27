require 'poseidon'
require 'securerandom'
require 'citrus/event_bus/configuration'

module Citrus
  module EventBus
    class Publisher

      def initialize(configuration = Configuration.new)
        @configuration = configuration
        @producer      = Poseidon::Producer.new([@configuration.connection_string], SecureRandom.uuid)
      end

      def call(event)
        message = Poseidon::MessageToSend.new(
            @configuration.topic,
            @configuration.event_serializer.dump(event)
        )
        @producer.send_messages([message])
      end

    end
  end
end