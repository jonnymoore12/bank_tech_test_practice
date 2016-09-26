require 'bank_account'

describe BankAccount do
  it 'balance should be initialized at 0 by default' do
    expect(subject.balance).to eq 0
  end

  it 'balance can be initialized with an amount passed in as parameter' do
    account = BankAccount.new(10)
    expect(account.balance).to eq 10
  end

  describe '#deposit' do
    it 'deposits an amount of money and adds it to the balance' do
      expect { subject.deposit(20.00) }.to change { subject.balance }.by 20.00
    end

    it 'adds a record of the deposit to the transactions in statement' do
      account = BankAccount.new(10)
      account.deposit(20)
      expect(account.statement.transactions).to include "#{Time.now.strftime("%d/%m/%Y")} || 20 || || 30"
    end
  end

  describe '#withdrawal' do
    it 'withdraws an amount of money and adds it to the balance' do
      expect { subject.withdraw(20.00) }.to change { subject.balance }.by -20.00
    end

    it 'adds a record of the withdrawals to the statements' do
      account = BankAccount.new(10)
      account.withdraw(20)
      expect(account.statement.transactions).to include "#{Time.now.strftime("%d/%m/%Y")} || || 20 || -10"
    end
  end

end
