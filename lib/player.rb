#require_relative '/scoring.rb'
require 'awesome_print'

module Scrabble
  class Player

    attr_reader :name

    def initialize(name)
      #returns the value of the @name instance variable
      @name = name
      @array_of_words = []
    ##  @total_score = 0
    end

    def plays
      #returns an Array of the words played by the player
      return @array_of_words
    end

    def play(word)
      #Adds the input word to the plays Array
      player_status = false
      total_score = 0
      @array_of_words.each do |word_in_arr|
        total_score += Scrabble::Scoring.score(word_in_arr)
      end

      if total_score <  100
        word_score = Scrabble::Scoring.score(word)
        player_status = word_score
        @array_of_words << word
      end

      return player_status
    end



    #
    # def total_score
    #   #Returns the sum of scores of played words
    #   returns @total_score
    # end


    # def won?
    #    #If the player has over 100 points, returns true, otherwise returns false
    #    player_case = false
    #    if total_score => 100
    #      player_case = true
    #    end
    #    return player_case
    # end

    def highest_scoring_word
      #Returns the highest scoring played word

    end

    def highest_word_score
      #Returns the highest_scoring_word score
    end

  end
end
