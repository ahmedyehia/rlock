require 'spec_helper'

RSpec.describe 'Dollar Parser Test' do
  let(:text) { "city $ birthdate $ last_name $ first_name\n LA $ 03-11-1990 $ Yehia $ Ahmed" }
  let(:mock_person) do
    Person.new(city: 'Los Angeles',
               birthdate: Date.new(1990, 11, 3),
               last_name: 'Yehia',
               first_name: 'Ahmed')
  end
  let(:headers) { %w[city birthdate last_name first_name] }
  let(:data) { %w[LA 03-11-1990 Yehia Ahmed] }

  describe '#sperator' do
    it 'returns dollar sign' do
      parser_object = Parsers::People::DollarParser.new(text)
      expect(parser_object.sperator).to eq('$')
    end
  end

  describe '#headers' do
    it 'returns text header' do
      adapter_double_instance = double('Adapter Mock instance', map: mock_person)
      adapter_double = double('Adapter Mock', new: adapter_double_instance)
      parser_object = Parsers::People::DollarParser.new(text)

      allow(parser_object).to receive(:person_adapter).and_return(adapter_double)

      parser_object.parse
      expect(parser_object.headers).to eq(%w[city birthdate last_name first_name])
    end
  end


  describe 'calls adabter with right data' do
    it 'calls the adapter with right data array' do
      adapter_double = double('Adapter Mock')
      adapter_double_instance = double('Adapter Mock instance', map: mock_person)

      parser_object = Parsers::People::DollarParser.new(text)
      allow(parser_object).to receive(:person_adapter).and_return(adapter_double)

      expect(adapter_double).to receive(:new).with(headers, data).and_return(adapter_double_instance)
      parser_object.parse
    end
  end
end
