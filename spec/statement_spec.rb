require 'statement'

describe Statement do
  let(:account) { BankAccount.new(0, Statement.new) }

  it 'is initialized with an empty array of transactions' do
    expect(subject.transactions).to eq []
  end

  describe '#print_statement' do
    it 'returns an account statement with correctly formatted row headers' do
      expect(subject.print_statement).to include "date || credit || debit || balance"
    end

    it 'also returns historical record of deposits' do
      account.deposit(40)
      expect(account.statement.print_statement).to include "#{Time.now.strftime("%d/%m/%Y")} || 40 || || 40"
    end

    it 'also returns historical record of withdrawals' do
      account.deposit(40)
      account.withdraw(40)
      expect(account.statement.print_statement).to include "#{Time.now.strftime("%d/%m/%Y")} || || 40 || 0"
    end
  end
end
