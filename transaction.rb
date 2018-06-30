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
    end
  end

  def self.declined
    @@declined
  end

end
