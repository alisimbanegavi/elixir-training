# case-------------------------
# Allows for comparison against many patterns until a matching one is found
case {1, 2, 3} do
  ...>   {4, 5, 6} ->
  ...>     "This clause won't match"
  ...>   {1, x, 3} ->
  ...>     "This clause will match and bind x to 2 in this clause"
  ...>   _ ->
  ...>     "This clause would match any value"
  ...> end
  "This clause will match and bind x to 2 in this clause"

# Can use "when" to specify extra conditions
case {1, 2, 3} do
  ...>   {1, x, 3} when x > 0 ->
  ...>     "Will match"
  ...>   _ ->
  ...>     "Would match, if guard condition were not satisfied"
  ...> end
  "Will match"
# The first clause above will only match when x is positive.

# If none of the clauses match, an error is raised
case :ok do
  ...>   :error -> "Won't match"
  ...> end
  ** (CaseClauseError) no case clause matching: :ok

# cond

# Also possible for anonymous functions to use clauses
f = fn
  ...>   x, y when x > 0 -> x + y
  ...>   x, y -> x * y
  ...> end
  #Function<12.71889879/2 in :erl_eval.expr/5>
f.(1, 3) # output: 4
f.(-1, 3) # output: -3

# cond
# Equivalent to else if
#[condition] -> [result]

cond do
  2 + 2 == 5 -> "This will not be true"
  2 * 2 == 3 -> "Nor this"
  1 + 1 == 2 -> "But this will"
end
  "But this will"
# anything that's not nil or false is considered to be true
# If all of the conditions return nil or false, an error (CondClauseError) is raised.
# For this reason, it may be necessary to add a final condition, equal to true, which will always match

#if/unless
# Good for checking for a singular condition
# Ex 1
if true, do: 1 + 2 # output: 3

# Ex 2
if nil do
  ...>   "This won't be seen"
  ...> else
  ...>   "This will"
  ...> end
  "This will"

# Ex 3
if true do
  ...>   "This works!"
  ...> end
  "This works!"

unless true do
  ...>   "This will never be seen"
  ...> end
  nil
# If the condition given to if/2 returns false or nil, the body given between do/end is not executed
# and instead it returns nil. The opposite happens with unless/2.

# ternary operator
IO.puts "Ternary : #{if age > 18, do: "Can Vote", else: "Can't Vote"}"
# if [condition], do: [result], else: [alternate result]
