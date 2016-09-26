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
    printed_statement = ''
    printed_statement << "date || credit || debit || balance"
    @statements.reverse!.each { |statement| printed_statement << statement }
    printed_statement
  end

  # puts "date || credit || debit || balance"
  # @statements.reverse!.each { |statement| printed_statement << statement }

end
