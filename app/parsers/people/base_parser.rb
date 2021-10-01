module Parsers
  module People
    class BaseParser
      attr_accessor :text
      attr_writer :headers

      def initialize(text)
        @text = text
        @headers = nil
      end

      # If your parser headers is not exact equal the person attributes
      # You can override this method to return false and override headers method
      # ex:
      #  def extract_headers
      #   false
      # end

      # def headers
      #   %i[city birthdate last_name first_name]
      # end
      def extract_headers
        true
      end

      def headers
        throw 'Must implement headers method if you set extract_headers false' unless extract_headers
        @headers
      end

      def sperator
        throw 'Must implement sperator method'
      end

      def person_adapter
        throw 'Must implement person_adapter method'
      end

      def parse
        people = []

        text.each_line.with_index do |line, line_num|
          data = line.split(sperator).map(&:strip)
          if line_num.zero?
            @headers = data if extract_headers
            next
          end
          people << person_adapter.new(headers, data).map
        end

        people
      end
    end
  end
end
