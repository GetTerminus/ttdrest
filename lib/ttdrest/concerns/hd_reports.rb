module Ttdrest
  module Concerns
    module HdReports

      def get_reports(report_date, options = {})
        advertiser_id = self.advertiser_id || options[:advertiser_id]
        path = "/hdreports"
        content_type = 'application/json'
        report_data = {}.tap do |search_params|
          search_params["AdvertiserId"] = advertiser_id
          search_params["ReportDateUTC"] = report_date.strftime("%Y-%m-%d")
          search_params["ReportScheduleNameContains"] = options[:report_schedule_name_contains] if options[:report_schedule_name_contains]
          search_params["ExecutionStates"] = options[:execution_states] if options[:execution_states]
        end

        result = data_post(path, content_type, report_data.to_json)
        return result
      end

    end
  end
end
