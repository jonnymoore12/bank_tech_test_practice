require 'deposit'

describe Deposit do
  let(:deposit) { Deposit.new(10, 5) }
  let(:account) { BankAccount.new(10, Statement.new) }

  it 'takes the current date in DD/MM/YYYY format' do
    expect(deposit.date).to eq "#{Time.now.strftime("%d/%m/%Y")}"
  end

  it 'increases the balance by the deposited amount' do
    account.deposit(5)
    expect(account.balance).to eq 15
  end

  describe '#new_balance' do
    it 'calculates the new_balance by adding on the deposit' do
      expect(deposit.new_balance).to eq 15
    end
  end

  describe '#deposit_record' do
    it 'creates a historical record of the deposit' do
      expect(deposit.record).to eq "#{Time.now.strftime("%d/%m/%Y")} || 5 || || 15"
    end
  end

end
