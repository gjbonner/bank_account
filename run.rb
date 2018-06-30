require_relative 'bank_account.rb'
require_relative 'person.rb'
require_relative 'transaction.rb'
require 'pry'
giles = Person.new("Giles")
thomas = Person.new("Thomas")

account1 = BankAccount.new(giles, 500, "closed")
account2 = BankAccount.new(thomas)

transaction = Transaction.new(account1, account2, 250)
transaction2 = Transaction.new(account2, account1, 100)

p transaction.complete_transaction
p Transaction.declined
true
