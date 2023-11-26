require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')

def prompt(message)
  puts(">> #{message}")
end

def translate_to_rps(input)
  input = case input
          when '1'
            'ROCK'
          when '2'
            'PAPER'
          when '3'
            'SCISSORS'
          end
end

prompt(MESSAGES['welcome'])
user_name = gets.chomp
prompt(user_name + MESSAGES['play'])
want_to_play = gets.chomp
prompt(MESSAGES['playing'])
prompt(MESSAGES['initiate'])

number_of_user_wins = []
number_of_pc_wins = []
loop do
  loop do
    prompt(MESSAGES['make_a_choice1'])
    prompt(MESSAGES['make_a_choice2'])
    prompt(MESSAGES['make_a_choice3'])
    user_input = ''
    loop do
      user_input = gets.chomp
      if %w[1 2 3].include?(user_input)
        user_input = user_input
        break
      else
        prompt(MESSAGES['invalid_choice'])
      end
    end

    computer_input = Random.new.rand(1..3)
    user_choice = translate_to_rps(user_input)
    computer_choice = translate_to_rps(computer_input.to_s)

    prompt(MESSAGES['youser_chose'] + ' :: ' + user_choice + ' :: ')
    prompt(MESSAGES['pc_chose'] + ' :: ' + computer_choice + ' :: ')
    if user_choice == computer_choice
      prompt(MESSAGES['tied_try_again'])
    elsif (user_choice == 'ROCK' && computer_choice == 'SCISSORS') ||
          (user_choice == 'PAPER' && computer_choice == 'ROCK') ||
          (user_choice == 'SCISSORS' && computer_choice == 'PAPER')
      prompt(MESSAGES['user_win'])
      number_of_user_wins << 1
      break
    elsif (user_choice == 'ROCK' && computer_choice == 'PAPER') ||
          (user_choice == 'PAPER' && computer_choice == 'SCISSORS') ||
          (user_choice == 'SCISSORS' && computer_choice == 'ROCK')
      prompt(MESSAGES['pc_win'])
      number_of_pc_wins << 1
      break
    end
  end
  prompt("You have won " + number_of_user_wins.sum.to_s + " games")
  prompt("I have won " + number_of_pc_wins.sum.to_s + " games")
  prompt(MESSAGES['play_again'])
  playing_again = gets.chomp.downcase
  break unless playing_again == 'y'
end
