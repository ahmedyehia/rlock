require './app/people_controller.rb'
require './app/person.rb'

Dir[File.join(__dir__, 'app', 'adapters', 'people', '*.rb')].sort.each do |file|
  require file
end

Dir[File.join(__dir__, 'app', 'parsers', 'people', '*.rb')].sort.each do |file|
  require file
end

require './app/services/people/parser_service.rb'
