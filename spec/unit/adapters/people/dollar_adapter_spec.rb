require 'spec_helper'

RSpec.describe 'Dollar Adapter Test' do
  describe '#map' do
    let(:headers) { %w[city birthdate last_name first_name] }
    let(:line) { %w[LA 03-11-1990 Yehia Ahmed] }

    before do
      @person = Adapters::People::DollarAdapter.new(headers, line).map
    end

    it 'returns an object of person' do
      expect(@person).to be_instance_of(Person)
    end

    it 'parses first_name and last_name correctly' do
      expect(@person.first_name).to eq('Ahmed')
    end

    it 'parses city correct' do
      expect(@person.city).to eq('Los Angeles')
    end

    it 'parses date correct' do
      expect(@person.birthdate).to eq(Date.new(1990, 11, 3))
    end
  end
end
