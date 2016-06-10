defmodule ApproximateTime do
  @doc """
  Rounds the time to the nearest 5 minutes

  ## Examples:

  iex> ApproximateTime.from({12,57})
  {12,55}

  iex> ApproximateTime.from({12,58})
  {1,0}

  iex> ApproximateTime.from({23,59})
  {12,0}
  """
  def from({hours, minutes}) when rem(minutes, 5) != 0 do
    from {hours, approx(minutes)}
  end

  def from({hours, minutes}) when hours > 12 do
    from {hours - 12, minutes}
  end

  def from({hours, 60}), do: from {hours + 1, 0}

  def from(time), do: time

  defp approx(minutes) when rem(minutes, 5) < 3, do: minutes - rem(minutes, 5)
  defp approx(minutes), do: minutes + 5 - rem(minutes, 5)
end
