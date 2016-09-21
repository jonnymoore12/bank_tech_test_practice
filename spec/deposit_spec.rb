require 'deposit'

describe Deposit do
  let(:deposit) { Deposit.new(10, 5) }
  let(:bank_account) { BankAccount.new }

  it 'takes the current date in DD/MM/YYYY format' do
    expect(deposit.date).to eq '21/09/2016'
  end

  it 'increases the balance by the deposited amount' do
    account = BankAccount.new
    account.deposit(5)
    expect(account.balance).to eq 5
  end

  describe '#new_balance' do
    it 'calculates the new_balance by adding on the deposit' do
      deposit = Deposit.new(10,5)
      expect(deposit.new_balance).to eq 15
    end
  end

  describe '#deposit_record' do
    it 'creates a historical record of the deposit' do
      deposit = Deposit.new(10,5)
      expect(deposit.record).to eq "#{Time.now.strftime("%d/%m/%Y")} || 5 || || 15"
    end
  end

end
