defmodule ApproximateTimeTest do
  use ExUnit.Case
  doctest ApproximateTime

  test "it rounds time to the nearest five minutes" do
    assert ApproximateTime.from({11, 27}) == {11, 25}
    assert ApproximateTime.from({11, 28}) == {11, 30}
    assert ApproximateTime.from({11, 58}) == {12, 00}
    assert ApproximateTime.from({12, 59}) == {1, 00}
  end

  test "it handles military time" do
    assert ApproximateTime.from({21, 59}) == {10, 00}
  end
end
