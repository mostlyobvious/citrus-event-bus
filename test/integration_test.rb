require 'test/unit'
require 'citrus/event_bus'

module Citrus
  module EventBus
    class IntegrationTest < Test::Unit::TestCase

      def test_event_flow_on_defaults
        event = Event.for_type(:dummy)
        Thread.new { Publisher.new.(event) }
        received_event = Subscriber.new.()
        assert_equal event, received_event
      end

    end
  end
end
