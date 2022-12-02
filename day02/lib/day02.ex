defmodule Day02 do
  def run_part_one(input) do
    String.split(input, ~r/\n/)
    |> Enum.map(&(get_line_score(&1)))
    |> Enum.sum()
  end

  defp get_line_score("A X"), do: 3 + 1 # Rock-Rock = Draw
  defp get_line_score("A Y"), do: 6 + 2 # Rock-Paper = Win
  defp get_line_score("A Z"), do: 0 + 3 # Rock-Scissor = Lose
  defp get_line_score("B X"), do: 0 + 1 # Paper-Rock = Lose
  defp get_line_score("B Y"), do: 3 + 2 # Paper-Paper = Draw
  defp get_line_score("B Z"), do: 6 + 3 # Paper-Scissor = Draw
  defp get_line_score("C X"), do: 6 + 1 # Scissor-Rock = Win
  defp get_line_score("C Y"), do: 0 + 2 # Scissor-Paper = Lose
  defp get_line_score("C Z"), do: 3 + 3 # Scissor-Scissor = Draw
end
