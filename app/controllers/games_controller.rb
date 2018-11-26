require 'net/http'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('A'..'Z').to_a[rand(26)] }
  end

  def score
    score = 0
    letters = params[:letters].split()
    answer = params[:answer_user].upcase.split("")
    answer.each do |let|
      if letters.include?(let)
        letters -= [let]
        score += 1
      else
        return score = 2654276345328
      end
      if english_word(answer) == false
        return 'It is not a english word'
      else
        return 'It is a english word'
      end
    end
    raise
  end
end

def english_word(answer)
  url = "https://wagon-dictionary.herokuapp.com/#{answer.join}"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  return JSON.parse(response)["found"]
end
