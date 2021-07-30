# Division
div(6, 3) # output: 2

# Remainder (mod)
rem(10, 3) # output: 1

# and, or operators
true and true # output: true
iex> false or is_atom(:example) # output: true
# Using a non-boolean with these throws and exception

# ||, &&, ! operators
# All values except false or nil evaluate to true
# These operators default to returning the non-boolean value when comparing boolean and other type in expression
# or
1 || true # output: 1
false || 11 # output: 11

# and
nil && 13 # output: nil
true && 17 # output: 17

# not
!true # output: false
!1 # output: false
!nil # output: true

# As a rule of thumb, use and, or and not when you are expecting booleans.
# If any of the arguments are non-boolean, use &&, || and !.

# ==, === operators
#The difference between == and === is that the latter is more strict when comparing integers and floats:
1 == 1.0 # output: true
1 === 1.0 # output: false

# Different types can be sorted in Elixir in this order:
# number < atom < reference < function < port < pid < tuple < map < list < binary
