defmodule WordClock do
  @doc """
  Returns the approximate time using familiar English language.

  ## Examples:

  iex> WordClock.humanize({12,57})
  "It is five minutes to one"

  iex> WordClock.humanize({1,28})
  "It is half past one"

  iex> WordClock.humanize({23,59})
  "It is twelve o'clock"
  """
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
    12 => "twelve",
    20 => "twenty",
    25 => "twenty five"
  }

  def humanize({hours, 00}), do: "It is #{@words[hours]} o'clock"
  def humanize({hours, 15}), do: "It is quarter past #{@words[hours]}"
  def humanize({hours, 30}), do: "It is half past #{@words[hours]}"
  def humanize({hours, 45}), do: "It is quarter to #{next_hour_word(hours)}"

  def humanize(time = {hours, minutes}) when rem(minutes, 5) != 0 do
    ApproximateTime.from(time) |> humanize
  end

  def humanize({hours, minutes}) when minutes > 30 do
    "It is #{@words[60 - minutes]} minutes to #{next_hour_word(hours)}"
  end

  def humanize({hours, minutes}) do
    "It is #{@words[minutes]} minutes past #{@words[hours]}"
  end

  defp next_hour_word(current_hour) do
    @words[rem(current_hour + 1, 12)]
  end
end
