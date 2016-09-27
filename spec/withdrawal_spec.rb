require 'withdrawal'

describe Withdrawal do
  let(:withdrawal) { Withdrawal.new(10, 5) }
  let(:account) { BankAccount.new(0, Statement.new) }

  it 'takes the current date in DD/MM/YYYY format' do
    expect(withdrawal.date).to eq "#{Time.now.strftime("%d/%m/%Y")}"
  end

  it 'decreases the balance by the deposited amount' do
    account.withdraw(20)
    expect(account.balance).to eq (-20)
  end

  describe '#new_balance' do
    it 'calculates the new_balance by subtracting by the withdrawal amount' do
      expect(withdrawal.new_balance).to eq 5
    end
  end

  describe '#deposit_record' do
    it 'creates a historical record of the deposit' do
      expect(withdrawal.record).to eq "#{Time.now.strftime("%d/%m/%Y")} || || 5 || 5"
    end
  end
end
