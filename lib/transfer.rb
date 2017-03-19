require 'pry'
class Transfer
  # your code here
  def initialize( sender, receiver, money )
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = money
  end
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  #################################################
  def valid?
    self.sender.valid? && self.receiver.valid? && self.sender.balance > amount
  end

  def execute_transaction
    if self.valid? && self.status == 'pending'
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete' && self.receiver.balance > self.amount
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = 'reversed'
    end
  end
end
