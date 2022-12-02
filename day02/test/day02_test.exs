defmodule Day02Test do
  use ExUnit.Case

  test "part one" do
    expected_result = 15
    input = "A Y\nB X\nC Z"

    assert Day02.run_part_one(input) == expected_result
  end

  test "part two" do
    expected_result = 12
    input = "A Y\nB X\nC Z"

    assert Day02.run_part_two(input) == expected_result
  end
end
