require 'date'
class Transaction
  attr_reader :sender, :receiver, :amount

  @@all = []
  @@declined = []

  def initialize(sender, receiver, amount=20)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @@all << self
   end

  def self.all
    @@all
  end

  def self.big_spendas
      Transaction.all.select do |transaction|
      transaction.amount > 200
     end
  end

  def valid?
    sender.valid? && receiver.valid?
  end


  def decline_transaction
    valid? == false
     "Transaction declined. Check account status and balance."
  end

  def complete_transaction
    if valid? && sender.balance > 20
      sender.balance -= self.amount
      receiver.balance += self.amount
    else
      puts decline_transaction
      @@declined << self
      # binding.pry
    end
  end

  def auto_transfer
    @@my_date = DateTime.new('01/01/2018 00:00')
    time = Time.now.to_s
    time = DateTime.parse(time).strftime("%d/%m/%Y %H:%M")
    @@my_date.month
    binding.pry 
    if my_date.to_s == time
      self.complete_transaction

    end
    binding.pry

  end

  def transaction_amount
    puts "$#{self.amount}"
  end

  def self.declined
     if @@declined.length != 0
      @@declined
    else
      puts "No declined transactions."
    end
  end

end
