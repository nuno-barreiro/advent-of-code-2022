defmodule Day01Test do
  use ExUnit.Case

  test "Day 01 Test Case" do
    expected_result = 24_000
    test_input = "1000\n2000\n3000\n\n4000\n\n5000\n6000\n\n7000\n8000\n9000\n\n10000"

    assert expected_result == Day01.run(test_input)
  end

end
