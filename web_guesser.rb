require 'sinatra'
require 'sinatra/reloader'
require 'pry'

number = rand(0..100)

get '/' do
  guess = params["guess"].to_i
  message = check_guess(guess, number)
  color = check_color(message)
  erb :index, :locals => {:number => number, :message => message, :color => color}
end

def check_guess(guess, number)
  if guess > number
    too_high(guess, number)
  elsif guess < number
    too_low(guess, number)
  elsif guess == number
    "You got it right!"
  end
end

def too_high(guess, number)
  if guess > number && (guess - 5) > number
    "Way too high!"
  else
    "Too high!"
  end
end

def too_low(guess, number)
  if guess < number && (guess + 5) < number
    "Way too low!"
  else
    "Too low!"
  end
end

def check_color(message)
  if message == "Way too low!" || message == "Way too high!"
    'red'
  elsif message == "Too low!" || message == "Too high!"
    'orange'
  elsif message == "You got it right!"
    'green'
  end
end
