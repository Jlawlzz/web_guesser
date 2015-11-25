require 'sinatra'
require 'sinatra/reloader'
require 'pry'

number = rand(0..100)
message = "Guess a number"

get '/' do
  guess = params["guess"].to_i

  message = check_guess(guess, number)
  erb :index, :locals => {:number => number, :message => message}
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
    "Too High!"
  end
end

def too_low(guess, number)
  if guess < number && (guess + 5) < number
    "Way too low!"
  else
    "Too low!"
  end
end
