class Withdrawal

  attr_reader :date, :new_balance, :record

  def initialize(balance, amount)
    @date = Time.now.strftime("%d/%m/%Y")
    @balance, @amount = balance, amount
    new_balance
    withdrawal_record
  end

  def new_balance
    @new_balance = @balance - @amount
  end

  def withdrawal_record
    @record = "#{@date} || || #{@amount} || #{@new_balance}"
  end


end
