# information to get:
# 1) loan amount
# 2) APR
# 3) duration of loan

# calculations to do
# 1) monthly interest rate
# 2) loan duration in months
# 3) monthly payment

require 'yaml'
MESSAGES = YAML.load_file('loan_messages.yml')

monthly_payment = ''
def month_payment(loan, interest, duration)
  l = loan
  j = interest
  n = duration
  monthly_payment = l * (j / (1 - (1 + j)**(-n)))
  monthly_payment_to_s = monthly_payment.round(2).to_s
end

def prompt(input)
  puts ">> #{input} "
end
def convert_to_months(length)
  months = length.to_f * 12
end
prompt(MESSAGES['greetings'])
prompt(MESSAGES['initialize'])
name = ''
loop do
  name = gets.chomp
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("#{name}! " + MESSAGES['start'])
loan = gets.chomp.to_f
prompt(MESSAGES['monthly_int'])
interest = gets.chomp.to_f
prompt(MESSAGES['interest_unit'])
interest_unit = gets.chomp.downcase
interest = case interest_unit
           when 'm'
           interest = interest.to_f
           when 'y'
           interest = interest.to_f / 12
           end
prompt(MESSAGES['loan_duration'])
duration = gets.chomp.to_i
prompt(MESSAGES['duration_unit'])
duration_unit = gets.chomp.downcase
duration = case duration_unit
         when 'm'
          duration = duration.to_f
         when 'y'
          duration = duration.to_f * 12
         end

prompt(MESSAGES['result'] + month_payment(loan, interest, duration))