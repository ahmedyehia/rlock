module Parsers
  module People
    class DollarParser < BaseParser
      def sperator
        '$'
      end

      def person_adapter
        Adapters::People::DollarAdapter
      end
    end
  end
end