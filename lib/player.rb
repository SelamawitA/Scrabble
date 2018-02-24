require 'awesome_print'
MAX_NUM_OF_TILES_ALLOWED = 7
module Scrabble
  class Player

    attr_reader :name
    attr_writer :players_plaque
    def initialize(name)
      #returns the value of the @name instance variable
      @name = name
      @array_of_words = []
      @players_plaque = []
    end

    def tiles
      return @players_plaque
    end

    def draw_tiles(title_bag)
      tile_bag = Scrabble::TileBag.new
      add_tiles = MAX_NUM_OF_TILES_ALLOWED  - @players_plaque.length
      @players_plaque.concat(tile_bag.draw_tiles(add_tiles))
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


    def total_score
      #Returns the sum of scores of played words
      #Look for an enum update below
      sum = 0
      @array_of_words.each do |a_word|
        sum+= Scrabble::Scoring.score(a_word)
      end
      return sum
    end


    def won?
       #If the player has over 100 points, returns true, otherwise returns false
       player_case = false
       if total_score >= 100
         player_case = true
       end
       return player_case
    end

    def highest_scoring_word
      #Returns the highest scoring played word
      highest_scoring_word = Scrabble::Scoring.highest_score_from(@array_of_words)

      return highest_scoring_word
    end

    def highest_word_score
      #Returns the highest_scoring_word score
      return highest_scoring_value = Scrabble::Scoring.score(highest_scoring_word)

    end

  end
end
