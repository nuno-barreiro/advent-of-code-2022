defmodule Day03 do
  def run_part_one(file_input) do
    String.split(file_input, ~r/\n/)
    |> Enum.map(&(get_compartiments(&1)))
    |> Enum.map(&(find_misplaced_item(&1)))
    |> Enum.map(&(calculate_priority(&1)))
    |> Enum.sum()
  end

  defp calculate_priority(item) do
    subtract_by = if Regex.match?(~r/[a-z]/, item), do: 96, else: 38
    char_code = String.to_charlist(item) |> hd
    char_code - subtract_by
  end

  defp find_misplaced_item({ first_compartiment, second_compartiment } = _rucksack) do
    String.myers_difference(first_compartiment, second_compartiment)
    |> Keyword.fetch!(:eq)
  end

  defp get_compartiments(rucksack) do
    half_size = String.length(rucksack) |> div(2)
    rucksack |> String.split_at(half_size)
  end
end
