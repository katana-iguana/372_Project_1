#!/usr/bin/ruby
print "Hello Ruby!\n\n"

def displaystrings( *args )
  args.each {|string| puts string}
end

def multiply(val1, val2)
  result = val1 * val2
  return result
end

class BankAccount
  def initialize ()
  end

  # class variable, like a static variable in Java
  def interestRate
    @@interestRate = 0.2
  end

  def accountNumber
    @accountNumber
  end

  def accountNumber=( value )
    @accountNumber = value
  end

  def accountName
    @accountName
  end

  def accountName=( value )
    @accountName = value
  end

  def calc_interest ( balance )
    puts balance * interestRate
  end

  def print
    puts "name: " + @accountName
    puts "num:  " + @accountNumber
    calc_interest(1000)
  end
end

class NewBankAccount < BankAccount
  def customerPhone
    @customerPhone
  end

  def customerPhone=( value )
    @customerPhone = value
  end
end

account = BankAccount.new()
account.accountName = "Fred Flintstone"
account.accountNumber = "54321"
account.print
