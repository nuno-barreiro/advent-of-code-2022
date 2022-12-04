defmodule Day04Test do
  use ExUnit.Case

  test "part one" do
    input = "2-4,6-8\n2-3,4-5\n5-7,7-9\n2-8,3-7\n6-6,4-6\n2-6,4-8"
    expected_result = 2

    assert Day04.run_part_one(input) == expected_result
  end

  test "part two" do
    input = "2-4,6-8\n2-3,4-5\n5-7,7-9\n2-8,3-7\n6-6,4-6\n2-6,4-8"
    expected_result = 4

    assert Day04.run_part_two(input) == expected_result
  end
end
