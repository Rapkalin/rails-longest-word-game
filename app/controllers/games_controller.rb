require 'json'
require 'open-uri'

class GamesController < ApplicationController

    def new
        @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }
    end

    def score
        new
        @result = true
        @input = params[:input]
        url = "https://wagon-dictionary.herokuapp.com/#{params[:input]}"
        input_serialized = URI.open(url).read
        result = JSON.parse(input_serialized)["found"]
        @splitted_word = @input.split("")
        @splitted_word.each do |item|
            unless @letters.include?(item)
             @result = false
             return @result
            end
        end
        return @result
    end
end
