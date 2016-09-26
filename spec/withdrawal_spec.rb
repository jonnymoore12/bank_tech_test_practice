require 'withdrawal'

describe Withdrawal do
  let(:withdrawal) { Withdrawal.new(20, 10) }

  it 'takes the current date in DD/MM/YYYY format' do
    expect(withdrawal.date).to eq "#{Time.now.strftime("%d/%m/%Y")}"
  end

  it 'decreases the balance by the deposited amount' do
    account = BankAccount.new
    account.withdraw(20)
    expect(account.balance).to eq -20
  end

  describe '#new_balance' do
    it 'calculates the new_balance by subtracting by the withdrawal amount' do
      withdrawal = Withdrawal.new(10,5)
      expect(withdrawal.new_balance).to eq 5
    end
  end

  describe '#deposit_record' do
    it 'creates a historical record of the deposit' do
      withdrawal = Withdrawal.new(10,5)
      expect(withdrawal.record).to eq "#{Time.now.strftime("%d/%m/%Y")} || || 5 || 5"
    end
  end
end
