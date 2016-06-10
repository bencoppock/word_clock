# WordClock

Generates familiar English sentences describing the time using Elixir.

## Example:
* "It is three o'clock"
* "It is five minutes to twelve"
* "It is half past one"
* "It is quarter to ten"
* "It is twenty five past four"

# Usage

1. `brew install elixir`
1. Run `mix test` to run unit tests
1. Run `iex -S mix` to load up the application in the interactive Elixir console
1. `h ApproximateTime.from` for help with rounding time to the nearest 5 minutes
1. `h WordClock.humanize` for help with turning times into English sentences
