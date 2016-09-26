require_relative 'statement'

class BankAccount

  attr_reader :balance, :statement

  def initialize(starting_amount = 0)
    @balance = starting_amount
    @statement = Statement.new
  end

  def deposit(amount)
    deposit = Deposit.new(@balance, amount)
    @balance = deposit.new_balance
    @statement.transactions << deposit.record
  end

  def withdraw(amount)
    withdrawal = Withdrawal.new(@balance, amount)
    @balance = withdrawal.new_balance
    @statement.transactions << withdrawal.record
  end

end
