require 'json'
require 'citrus/event_bus/event'

module Citrus
  module EventBus
    class Serializer

      def load(event_data)
        event_hash = JSON.load(event_data)
        event_hash.each_with_object(Event.new) { |(key, value), event| event.send("#{key}=", value) }
      end

      def dump(event)
        JSON.dump(event.to_h)
      end

    end
  end
end