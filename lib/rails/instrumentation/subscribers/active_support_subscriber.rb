module Rails
  module Instrumentation
    module ActiveSupportSubscriber
      include Subscriber

      EVENT_NAMESPACE = 'active_support'.freeze

      EVENTS = %w[
        cache_read
        cache_generate
        cache_fetch_hit
        cache_write
        cache_delete
        cache_exist?
      ].freeze

      # rubocop:disable Style/MutableConstant
      BASE_TAGS = { 'component' => 'ActiveSupport' }
      # rubocop:enable Style/MutableConstant.

      class << self
        def cache_read(event)
          tags = span_tags(
            'key' => event.payload[:key],
            'hit' => event.payload[:hit],
            'super_operation' => event.payload[:super_operation]
          )

          Utils.trace_notification(event: event, tags: tags)
        end

        def cache_generate(event)
          tags = span_tags(
            'key' => event.payload[:key]
          )

          Utils.trace_notification(event: event, tags: tags)
        end

        def cache_fetch_hit(event)
          tags = span_tags(
            'key' => event.payload[:key]
          )

          Utils.trace_notification(event: event, tags: tags)
        end

        def cache_write(event)
          tags = span_tags(
            'key' => event.payload[:key]
          )

          Utils.trace_notification(event: event, tags: tags)
        end

        def cache_delete(event)
          tags = span_tags(
            'key' => event.payload[:key]
          )

          Utils.trace_notification(event: event, tags: tags)
        end

        def cache_exist?(event)
          tags = span_tags(
            'key' => event.payload[:key]
          )

          Utils.trace_notification(event: event, tags: tags)
        end
      end
    end
  end
end
