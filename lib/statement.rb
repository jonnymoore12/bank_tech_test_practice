class Statement

  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def print_statement
    printed_statement = ''
    printed_statement << "date || credit || debit || balance"
    @transactions.reverse!.each { |transactions| printed_statement << transactions }
    printed_statement
  end

end
