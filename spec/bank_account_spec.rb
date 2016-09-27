require 'bank_account'

describe BankAccount do
  let(:account) { BankAccount.new(10, Statement.new) }

  it 'balance should be initialized at 0 by default' do
    account = BankAccount.new(statement: Statement.new)
    expect(account.balance).to eq 0
  end

  it 'balance can be initialized with an amount passed in as parameter' do
    expect(account.balance).to eq 10
  end

  describe '#deposit' do
    it 'deposits an amount of money and adds it to the balance' do
      account.deposit(20)
      expect(account.balance).to eq 30
    end

    it 'adds a record of the deposit to the transactions in statement' do
      account.deposit(20)
      expect(account.statement.transactions).to include "#{Time.now.strftime("%d/%m/%Y")} || 20 || || 30"
    end
  end

  describe '#withdrawal' do
    it 'withdraws an amount of money and adds it to the balance' do
      account.withdraw(5)
      expect(account.balance).to eq 5
    end

    it 'adds a record of the withdrawals to the statements' do
      account.withdraw(20)
      expect(account.statement.transactions).to include "#{Time.now.strftime("%d/%m/%Y")} || || 20 || -10"
    end
  end

end
