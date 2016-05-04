#!/usr/bin/env ruby

BOARD = %w{
  HYZID
  KEVSR
  NXCPT
  OWAUM
  BGJLF
}

class Puzzle

  def initialize(array = BOARD)
    @board = array.map { |row| row.upcase }
  end

  def coordinates(letter)
  end

  def adjacent_letters(letter)
  end

  def letters
  end

  def all_adjacent_letters_hash
  end

  def contains_word?(word)
  end
end

if __FILE__ == $0

  file_name = ARGV[0] ||= '/usr/share/dict/words'
  file = File.open(file_name)

  #special_board = ["phvd", "ebai", "ntko", "rlsm"]
  puzzle = Puzzle.new(BOARD)
  words_found = false
  while (word = file.gets)
    next if word == nil
    word = word.downcase.chomp
    next unless word.size == 7
    if puzzle.contains_word?(word)
      puts word
      words_found = true
    end
  end
  file.close

  puts "No words found, have you implemented the classes?" unless words_found

end
