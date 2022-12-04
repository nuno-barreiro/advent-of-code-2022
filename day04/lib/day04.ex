defmodule Day04 do
  def run_part_one(input) do
    String.split(input, "\n")
    |> Enum.map(&get_pair_assignents(&1))
    |> Enum.map(&assignment_fully_overlaps?(&1))
    |> Enum.count(&(&1 == true))
  end

  def run_part_two(input) do
    String.split(input, "\n")
    |> Enum.map(&get_pair_assignents(&1))
    |> Enum.map(&assignment_overlaps_at_all?(&1))
    |> Enum.count(&(&1 != nil))
  end

  def get_pair_assignents(input_line) do
    String.split(input_line, ",")
    |> Enum.map(&(create_range(&1)))
  end

  def create_range(pair_str) do
    [from, to] = String.split(pair_str, "-")
    Range.new(from |> String.to_integer(), to |> String.to_integer())
  end

  def assignment_overlaps_at_all? ([first_assignments, second_assignments] = _pair_assignments) do
    List.myers_difference(first_assignments |> Enum.to_list, second_assignments |> Enum.to_list)
    |> Keyword.get(:eq)
  end

  def assignment_fully_overlaps?([first_assignments, second_assignments] = _pair_assignments) do
    first_in_sec = MapSet.subset?(MapSet.new(first_assignments), MapSet.new(second_assignments))
    sec_in_first = MapSet.subset?(MapSet.new(second_assignments), MapSet.new(first_assignments))

    first_in_sec || sec_in_first
  end
end
