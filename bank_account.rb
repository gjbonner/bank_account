class BankAccount

  attr_reader :person, :status
  attr_accessor :balance

  @@all = []
  def initialize(person, balance=500, status="open")
    @person = person
    @balance = balance
    @status = status
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    self.status == "open"
  end

  def self.total_amount_of_money
    balance = 0
    @@all.each do |account|
     balance += account.balance
    end
    balance
  end


end
