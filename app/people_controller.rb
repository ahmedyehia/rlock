class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    People::ParserService.new(params).call
  end

  private

  attr_reader :params
end
