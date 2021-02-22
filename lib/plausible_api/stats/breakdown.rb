# frozen_string_literal: true

module PlausibleApi
  module Stats
    class Breakdown
      def initialize(options = {})
        @property = options[:property] || 'event:page' # required
        @period  = options[:period] || '30d' # required
        @metrics = options[:metrics]
        @limit   = options[:limit]
        @page    = options[:page]
        @filters = options[:filters]
      end

      def request_url
        url = "/api/v1/stats/breakdown?site_id=$SITE_ID"
        url += "&property=#{@property}"
        url += "&period=#{@period}"
        url += "&metrics=#{@metrics}" if @metrics
        url += "&limit=#{@limit}" if @limit
        url += "&page=#{@page}" if @page
        url += "&filters=#{CGI.escape(@filters)}" if @filters
        url
      end

      def parse_response(body)
        JSON.parse(body)['results']
      end
    end
  end
end