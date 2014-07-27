require 'poseidon'
require 'securerandom'
require 'citrus/event_bus/configuration'

module Citrus
  module EventBus
    class Subscriber

      def initialize(configuration = Configuration.new)
        @configuration = configuration
        @consumer      = Poseidon::PartitionConsumer.new(
            SecureRandom.uuid,
            configuration.host,
            configuration.port,
            configuration.topic,
            0,
            :latest_offset
        )
        @messages_cache = []
      end

      def call
        @messages_cache += simulate_blocking_io_because_poseidon_is_not_my_application if @messages_cache.empty?
        message = @messages_cache.shift
        @configuration.event_serializer.load(message.value)
      end

      def simulate_blocking_io_because_poseidon_is_not_my_application
        loop do
          messages = @consumer.fetch(:max_wait => 10_000, :min_bytes => 1)
          break(messages) if messages.any?
        end
      end

    end
  end
end