module Adapters
  module People
    class BaseAdapter
      attr_accessor :headers, :data, :person

      def initialize(headers, data)
        @headers = headers
        @data    = data
        @person = Person.new
      end

      def map
        data.each_with_index do |value, index|
          key = headers[index].to_sym
          if respond_to?("parse_#{key}")
            send("parse_#{key}", value)
          else
            person.send("#{key}=", value)
          end
        end
        person
      end
    end
  end
end
