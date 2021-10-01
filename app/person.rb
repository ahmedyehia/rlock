class Person
  attr_accessor :first_name, :last_name, :city, :birthdate

  def initialize(first_name: '', last_name: '', city: '', birthdate: nil)
    @first_name = first_name
    @last_name = last_name
    @city = city
    @birthdate = birthdate
  end

  def formatted_birthdate
    birthdate.strftime('%-m/%-d/%Y')
  end

  def to_s
    "#{first_name}, #{city}, #{formatted_birthdate}"
  end

  def self.sort(people_array, attr, order = 'asc')
    people_array.sort do |a, b|
      if order == 'asc'
        a.send(attr) <=> b.send(attr)
      else
        b.send(attr) <=> a.send(attr)
      end
    end
  end
end
