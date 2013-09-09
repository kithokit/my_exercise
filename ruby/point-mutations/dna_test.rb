require 'minitest/autorun'
require_relative 'dna'

class DNATest < MiniTest::Unit::TestCase

  def test_no_difference_between_empty_strands
    assert_equal 0, DNA.new('').hamming_distance('')
  end

  def test_1_difference_between_both_strands
    assert_equal 1, DNA.new('ACC').hamming_distance('ACG')
  end

  def test_5_difference_between_both_strands
    assert_equal 5, DNA.new('CGAAACCC').hamming_distance('ATAAAGGG')
  end

  def test_large_distance
    assert_equal 2, DNA.new('ACCAGGG').hamming_distance('ACTATGG')
  end

  def test_ignore_remaining_strands_for_testing_strands
    assert_equal 6, DNA.new('AAAAAA').hamming_distance('CCCCCCTCG')
  end

  def test_ignore_original_strands_for_its_remaining_part_if_input_strands_is_shorter
    assert_equal 7, DNA.new('AAAAATTTTT').hamming_distance('CCCCCGGT')
  end


end
