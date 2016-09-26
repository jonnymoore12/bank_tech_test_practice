class BankAccount

  attr_reader :balance, :statements

  def initialize(starting_amount = 0)
    @balance = starting_amount
    @statements = []
  end

  def deposit(amount)
    deposit = Deposit.new(@balance, amount)
    @balance = deposit.new_balance
    @statements << deposit.record
  end

  def withdraw(amount)
    withdrawal = Withdrawal.new(@balance, amount)
    @balance = withdrawal.new_balance
    @statements << withdrawal.record
  end

  def print_statement
    puts "date || credit || debit || balance"
    @statements.reverse!.each { |statement| p statement }
  end

end
