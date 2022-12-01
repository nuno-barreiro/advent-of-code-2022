defmodule Day01 do
  def run_part_one(input) do
    [ head | _tail ] = String.split(input, ~r/\n/)
    |> Enum.map(&(parse_entry(&1)))
    |> Enum.chunk_by(&(&1 == 0))
    |> Enum.map(&(Enum.sum(&1)))
    |> Enum.sort(:desc)

    head
  end

  defp parse_entry(""), do: 0
  defp parse_entry(str), do: String.to_integer(str)
end
