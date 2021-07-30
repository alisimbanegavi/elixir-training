# = is match operator when not being used to assigned a variable
x = 1 # output: 1
1 = x # output: 1
2 = x # output: ** (MatchError) no match of right hand side value: 1

# Can be used on tuples
{a, b, c} = {:hello, "world", 42} # output: {:hello, "world", 42}
a # output: :hello
b # output: "world"

# Doesn't work with matching tuples of different sizes
{a, b, c} = {:hello, "world"} # output: ** (MatchError) no match of right hand side value: {:hello, "world"}

# Doesn't work with matching tuples and lists
{a, b, c} = [:hello, "world", 42] # output: ** (MatchError) no match of right hand side value: [:hello, "world", 42]

# With lists, head and tail can be athced
[head | tail] = [1, 2, 3] # output: [1, 2, 3]
head # output: 1
tail # output: [2, 3]

# head|tail format can also be used for prepending items to list
list = [1, 2, 3] # output: [1, 2, 3]
[0 | list] # output: [0, 1, 2, 3]

# pin operator ^ can be used when we want to pattern match a variable's existing values (kinda like valueOf)
# Not using this would re-assign the variable
x = 2 # output: 2
x = 1 # output: 1 // Re-assigning variable
^x = 2 # output: ** (MatchError) no match of right hand side value: // Euqivalent to 1 = 2

x = 1 # output: 1
[^x, 2, 3] = [1, 2, 3] # output: [1, 2, 3]
{y, ^x} = {2, 1} # output: {2, 1}
y # output: 2
{y, ^x} = {2, 2} # output: ** (MatchError) no match of right hand side value: {2, 2}

# _ operator can be used if you don't give a shit about a value ur gonna read in a pattern match
# This operator can't be read from
[head | _] = [1, 2, 3] # output: [1, 2, 3]
head # output: 1
_ # output: ** (CompileError) iex:1: invalid use of _. "_" represents a value to be ignored in a pattern and cannot be used in expressions
