class BankAccount
  def initialize( name )
    @name = name
    @status = 'open'
    @balance = 1000
  end
  attr_accessor :status, :balance
  attr_reader :name
  #################################################
  def deposit( money )
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if self.balance > 0 && self.status == 'open'
      true
    else
      false
    end
  end

  def close_account
    self.status = 'closed'
  end
end
