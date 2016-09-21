require 'bank_account'

describe BankAccount do
  it 'balance should be initialized at 0 by default' do
    expect(subject.balance).to eq 0
  end

  it 'balance can be initialized with an amount passed in as parameter' do
    account = BankAccount.new(10)
    expect(account.balance).to eq 10
  end

  it 'is initialized with an empty record of statements' do
    expect(subject.statements).to eq []
  end

  describe '#deposit' do
    it 'deposits an amount of money and adds it to the balance' do
      expect {subject.deposit(20.00) }.to change { subject.balance }.by 20.00
    end

    it 'adds a record of the deposit to the statements' do
      account = BankAccount.new(10)
      account.deposit(20)
      expect(account.statements).to include "#{Time.now.strftime("%d/%m/%Y")} || 20 || || 30"
    end
  end

  describe '#withdrawal' do
    it 'withdraws an amount of money and adds it to the balance' do
      expect { subject.withdraw(20.00) }.to change { subject.balance }.by -20.00
    end

    it 'adds a record of the withdrawals to the statements' do
      account = BankAccount.new(10)
      account.withdraw(20)
      expect(account.statements).to include "#{Time.now.strftime("%d/%m/%Y")} || || 20 || -10"
    end
  end

  describe '#print_statement' do
    xit 'returns an account statement with correctly formatted row headers' do
      expect(subject.print_statement).to include "date || credit || debit || balance"
    end

    it 'also returns historical record of deposits' do
      account = BankAccount.new
      account.deposit(40)
      expect(account.print_statement).to include "#{Time.now.strftime("%d/%m/%Y")} || 40 || || 40"
    end

    it 'also returns historical record of withdrawals' do
      account = BankAccount.new
      account.deposit(40)
      account.withdraw(40)
      expect(account.print_statement).to include "#{Time.now.strftime("%d/%m/%Y")} || || 40 || 0"
    end
  end

end
