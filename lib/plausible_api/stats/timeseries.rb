# frozen_string_literal: true

module PlausibleApi
  module Stats
    class Timeseries < Base

      def initialize(options = {})
        super({ period: '30d' }.merge(options))
      end

      def request_url_base
        "/api/v1/stats/timeseries?site_id=$SITE_ID"
      end

      def parse_response(body)
        JSON.parse(body)['results']
      end
    end
  end
end
