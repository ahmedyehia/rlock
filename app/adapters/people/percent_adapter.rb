module Adapters
  module People
    class PercentAdapter < BaseAdapter
      BIRTHDATE_FORMAT = '%Y-%m-%d'.freeze

      def parse_birthdate(value)
        person.birthdate = Date.strptime(value, BIRTHDATE_FORMAT)
      end
    end
  end
end