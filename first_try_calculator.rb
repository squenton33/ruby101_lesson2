# ask the user for two numbers
# ask the user for operation to perform
# perform the operation on the two numbers
# output the result

def operation(x, y, operator)
  if operator == "+"
    answer = x + y
  elsif operator == "-"
    answer = x - y
  elsif operator == "*"
    answer = x * y
  elsif operator == "/"
    answer = x.to_f / y.to_f
  else
    puts "I don't know that operation, sorry"
  end
  puts "The result is #{answer} "
end


puts "Welcome to Calculator!"
puts "Give me two numbers"
puts "What is the first number?"
first = gets.chomp.to_i

puts("What is the second number?")
second = gets.chomp.to_i

puts "What would you like me to do to those two numbers?"
puts "To add type: + "
puts "To subtract type: - "
puts "For multiplication type: * "
puts "For division type: / "
operator = gets.chomp
operator = operator.downcase
operation(first, second, operator)