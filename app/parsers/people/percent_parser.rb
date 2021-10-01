module Parsers
  module People
    class PercentParser < BaseParser
      def sperator
        '%'
      end

      def person_adapter
        Adapters::People::PercentAdapter
      end
    end
  end
end
