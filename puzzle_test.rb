#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'puzzle'

BOARD = %w{
  HYZID
  KEVSR
  NXCPT
  OWAUM
  BGJLF
}

class PuzzleTest < Minitest::Test
  def puzzle
    @puzzle ||= Puzzle.new(BOARD)
  end

  def test_letters
    assert_equal BOARD.join, puzzle.letters
  end

  def test_coordinates
    assert_equal [0,0], puzzle.coordinates('H')
    assert_equal [0,1], puzzle.coordinates('K')
    assert_equal [4,4], puzzle.coordinates('F')
  end

  def test_coordinates_case_sensitivity
    assert_equal [0, 1], puzzle.coordinates('k')
    assert_equal [0, 1], puzzle.coordinates('K')
  end

  def test_adjacent_letters
    assert_equal 'YKE',      puzzle.adjacent_letters('H')
    assert_equal 'EVSXPWAU', puzzle.adjacent_letters('C')
    assert_equal 'UML',      puzzle.adjacent_letters('F')
  end

  def test_letters_case_sensitivity
    assert_equal 'YKE', puzzle.adjacent_letters('h')
  end

  def test_contains_word?
    assert_equal true, puzzle.contains_word?('capsize')
    assert_equal true, puzzle.contains_word?('hexagon')
    assert_equal false, puzzle.contains_word?('1234567')
    assert_equal false, puzzle.contains_word?('zzzzzzz')
  end

end
