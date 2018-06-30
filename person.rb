class Person

  attr_reader :first_name, :last_name
  @@all = []

  def initialize(first_name, last_name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def full_name
  	"#{first_name} #{last_name}"
  end

  

end
