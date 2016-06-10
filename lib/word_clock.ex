defmodule WordClock do
  @words %{
     1 => "one",
     2 => "two",
     3 => "three",
     4 => "four",
     5 => "five",
     6 => "six",
     7 => "seven",
     8 => "eight",
     9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve"
  }

  def humanize(time = {hours, minutes}) when rem(minutes, 5) != 0 do
    ApproximateTime.from(time) |> humanize
  end

  def humanize({hours, 00}), do: "It is #{hour_word(hours)} o'clock"
  def humanize({hours, 05}), do: "It is five past #{hour_word(hours)}"
  def humanize({hours, 10}), do: "It is ten past #{hour_word(hours)}"
  def humanize({hours, 15}), do: "It is quarter past #{hour_word(hours)}"
  def humanize({hours, 20}), do: "It is twenty past #{hour_word(hours)}"
  def humanize({hours, 25}), do: "It is twenty five past #{hour_word(hours)}"
  def humanize({hours, 30}), do: "It is half past #{hour_word(hours)}"
  def humanize({hours, minutes}) when minutes > 30 do
    humanize_until({hours, minutes})
  end

  defp humanize_until({hours, 35}), do: "It is twenty five to #{next_hour_word(hours)}"
  defp humanize_until({hours, 40}), do: "It is twenty to #{next_hour_word(hours)}"
  defp humanize_until({hours, 45}), do: "It is quarter to #{next_hour_word(hours)}"
  defp humanize_until({hours, 50}), do: "It is ten to #{next_hour_word(hours)}"
  defp humanize_until({hours, 55}), do: "It is five to #{next_hour_word(hours)}"

  defp hour_word(hour), do: @words[hour]
  defp next_hour_word(current_hour), do: @words[rem(current_hour + 1, 12)]
end
