module People
  class ParserService
    WHITE_LIST_FORMATS = %i[dollar percent].freeze
    WHITE_LIST_ORDER   = %i[first_name last_name city birthdate].freeze

    attr_accessor :params

    def initialize(params)
      @params = params
      @persons = []
    end

    def call
      load_persons
      if WHITE_LIST_ORDER.include?(params[:order])
        @persons = Person.sort(@persons, params[:order])
      end

      @persons.map(&:to_s)
    end

    def load_persons
      WHITE_LIST_FORMATS.each do |format|
        people_param = params["#{format}_format".to_sym]
        skip if people_param.nil?

        parser_class_name = "Parsers::People::#{format.to_s.capitalize}Parser"
        parser_class = Object.const_get parser_class_name
        @persons += parser_class.new(people_param).parse
      end
    end
  end
end