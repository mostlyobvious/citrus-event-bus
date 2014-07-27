require 'securerandom'

module Citrus
  module EventBus
    class Event < Struct.new(:id, :timestamp, :type, :body)

      def self.for_type(type, body = nil)
        self.new(SecureRandom.uuid, Time.now.to_i, type.to_s, Hash(body))
      end

    end
  end
end