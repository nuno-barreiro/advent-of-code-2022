defmodule Day02 do
  def run_part_one(input) do
    String.split(input, ~r/\n/)
    |> Enum.map(&get_line_score(&1))
    |> Enum.sum()
  end

  def run_part_two(input) do
    String.split(input, ~r/\n/)
    |> Enum.map(fn line ->
      opponent_shape = String.first(line) |> translate_shape()
      player_ending = String.last(line) |> translate_ending()
      player_shape = choose_shape_to_play(opponent_shape, player_ending)

      IO.inspect("#{opponent_shape} - #{player_ending} - #{player_shape}")

      get_score(player_ending, player_shape)
    end)
    |> Enum.sum()
  end

  defp get_score(ending, shape) do
    end_score =
      case ending do
        :win -> 6
        :lose -> 0
        :draw -> 3
      end

    shape_score =
      case shape do
        :rock -> 1
        :paper -> 2
        :scissors -> 3
      end

    IO.inspect("#{ending}::#{end_score} -- #{shape}::#{shape_score}")

    end_score + shape_score
  end

  defp choose_shape_to_play(opponent_shape, :win) do
    case opponent_shape do
      :rock -> :paper
      :paper -> :scissors
      :scissors -> :rock
    end
  end

  defp choose_shape_to_play(opponent_shape, :lose) do
    case opponent_shape do
      :rock -> :scissors
      :paper -> :rock
      :scissors -> :paper
    end
  end

  defp choose_shape_to_play(opponent_shape, :draw), do: opponent_shape

  defp translate_shape("A"), do: :rock
  defp translate_shape("B"), do: :paper
  defp translate_shape("C"), do: :scissors

  defp translate_ending("X"), do: :lose
  defp translate_ending("Y"), do: :draw
  defp translate_ending("Z"), do: :win

  # Rock-Rock = Draw
  defp get_line_score("A X"), do: 3 + 1
  # Rock-Paper = Win
  defp get_line_score("A Y"), do: 6 + 2
  # Rock-Scissor = Lose
  defp get_line_score("A Z"), do: 0 + 3
  # Paper-Rock = Lose
  defp get_line_score("B X"), do: 0 + 1
  # Paper-Paper = Draw
  defp get_line_score("B Y"), do: 3 + 2
  # Paper-Scissor = Draw
  defp get_line_score("B Z"), do: 6 + 3
  # Scissor-Rock = Win
  defp get_line_score("C X"), do: 6 + 1
  # Scissor-Paper = Lose
  defp get_line_score("C Y"), do: 0 + 2
  # Scissor-Scissor = Draw
  defp get_line_score("C Z"), do: 3 + 3
end
