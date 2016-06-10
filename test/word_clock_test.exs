defmodule WordClockTest do
  use ExUnit.Case
  doctest WordClock

  test "uses 'o'clock' on the hour" do
    assert WordClock.humanize({1, 00})  == "It is one o'clock"
    assert WordClock.humanize({2, 00})  == "It is two o'clock"
    assert WordClock.humanize({3, 00})  == "It is three o'clock"
    assert WordClock.humanize({4, 00})  == "It is four o'clock"
    assert WordClock.humanize({5, 00})  == "It is five o'clock"
    assert WordClock.humanize({6, 00})  == "It is six o'clock"
    assert WordClock.humanize({7, 00})  == "It is seven o'clock"
    assert WordClock.humanize({8, 00})  == "It is eight o'clock"
    assert WordClock.humanize({9, 00})  == "It is nine o'clock"
    assert WordClock.humanize({10, 00}) == "It is ten o'clock"
    assert WordClock.humanize({11, 00}) == "It is eleven o'clock"
    assert WordClock.humanize({12, 00}) == "It is twelve o'clock"
  end

  test "uses 'five minutes past' when the minutes round to 5" do
    assert WordClock.humanize({2, 5}) == "It is five minutes past two"
    assert WordClock.humanize({2, 6}) == "It is five minutes past two"
  end

  test "uses 'ten minutes past' when the minutes round to 10" do
    assert WordClock.humanize({2, 10}) == "It is ten minutes past two"
    assert WordClock.humanize({2, 11}) == "It is ten minutes past two"
  end

  test "uses 'quarter past' when the minutes round to 15" do
    assert WordClock.humanize({2, 15}) == "It is quarter past two"
    assert WordClock.humanize({2, 16}) == "It is quarter past two"
  end

  test "uses 'quarter past' when the minutes round to 20" do
    assert WordClock.humanize({2, 20}) == "It is twenty minutes past two"
    assert WordClock.humanize({2, 19}) == "It is twenty minutes past two"
  end

  test "uses 'twenty five minutes past' when the minutes round to 25" do
    assert WordClock.humanize({2, 25}) == "It is twenty five minutes past two"
    assert WordClock.humanize({2, 26}) == "It is twenty five minutes past two"
  end

  test "uses 'half past' when the minutes round to 30" do
    assert WordClock.humanize({2, 30}) == "It is half past two"
    assert WordClock.humanize({2, 29}) == "It is half past two"
  end

  test "uses 'twenty five minutes to' when the minutes round to 35" do
    assert WordClock.humanize({2, 34}) == "It is twenty five minutes to three"
    assert WordClock.humanize({12, 34}) == "It is twenty five minutes to one"
  end

  test "uses 'twenty minutes to' when the minutes round to 40" do
    assert WordClock.humanize({2, 41}) == "It is twenty minutes to three"
    assert WordClock.humanize({12, 41}) == "It is twenty minutes to one"
  end

  test "uses 'quarter to' when the minutes round to 45" do
    assert WordClock.humanize({2, 46}) == "It is quarter to three"
    assert WordClock.humanize({12, 45}) == "It is quarter to one"
  end

  test "uses 'ten minutes to' when the minutes round to 50" do
    assert WordClock.humanize({2, 51}) == "It is ten minutes to three"
    assert WordClock.humanize({12, 50}) == "It is ten minutes to one"
  end

  test "uses 'ten minutes to' when the minutes round to 50" do
    assert WordClock.humanize({2, 51}) == "It is ten minutes to three"
    assert WordClock.humanize({12, 50}) == "It is ten minutes to one"
  end

  test "uses 'five minutes to' when the minutes round to 55" do
    assert WordClock.humanize({2, 56}) == "It is five minutes to three"
    assert WordClock.humanize({12, 55}) == "It is five minutes to one"
  end
end
