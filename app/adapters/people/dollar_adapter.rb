require 'Date'

module Adapters
  module People
    class DollarAdapter < BaseAdapter
      BIRTHDATE_FORMAT = '%d-%m-%Y'.freeze
      CITIES = {
        'LA' => 'Los Angeles',
        'NYC' => 'New York City'
      }.freeze

      def parse_birthdate(value)
        person.birthdate = Date.strptime(value, BIRTHDATE_FORMAT)
      end

      def parse_city(value)
        person.city = CITIES[value]
      end
    end
  end
end
