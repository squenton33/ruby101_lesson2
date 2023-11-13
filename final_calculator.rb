def prompt(message)
  puts("=> #{message}")
end

def val_num(num)
 num == '0' || num.to_i != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name")
name = ''
loop do
  name = gets.chomp
  if name.empty?()
    prompt("Make sure to use a valid name")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  prompt("Give me two numbers")

  num1 = ''
  loop do
    prompt("What is the first number?")
    num1 = gets.chomp
    if val_num(num1)
      break
    else
      prompt("I don't think that is an actual number, please try again")
    end
  end

  num2 = ''
  loop do
    prompt("What is the second number?")
    num2 = gets.chomp
      if val_num(num2)
        break
      else
        prompt("I don't think that is an actual number, please try again")
      end
  end

  oper_prompt = <<-COW
  What operation would you like to perform to these numbers?
     Type the coresponding number to choose
     1) Add
     2) Subtract
     3) Multiply
     4) Divide
  COW
  prompt(oper_prompt)

  operator = ''
  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Please type 1, 2, 3 or 4")
    end
  end
    result = case operator
            when '1'
              num1.to_i + num2.to_i
            when '2'
              num1.to_i - num2.to_i
            when '3'
              num1.to_i * num2.to_i
            when '4'
              num1.to_f / num2.to_f
    end
  prompt("#{operation_to_message(operator)} the two numbers...")
  prompt("The result is #{result}")
  prompt("Would you like me to perform more calculations? Press Y to continue.")
  continue = gets.chomp
  break unless continue.downcase.start_with?('y')
end

prompt("Thanks for the tasty tasty calculations")