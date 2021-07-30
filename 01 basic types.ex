#######################################
# FUNCTION SYNTAX
# func/[num arguments]

# ------------------------------ATOMS------------------------------
# Basically strings that return their literal value
IO.puts(:apple) # output: "apple"

# ------------------------------------STRINGS------------------------------------
# Library functions

# Assignment/Concatenation
my_str = "This" <> " string" # output: "This string"

IO.puts "Length : #{String.length(my_str)}"
# Returns length of string

combo_str = my_str <> " is text" # output: "This string is text"

IO.puts "My ? #{String.contains?(my_str, "My")}"
# Returns boolean indicating if substring exists

IO.puts "First : #{String.first(my_str)}"
# Returns character at index 0

IO.puts "Index 4 : #{String.at(my_str, 4)}"
# Returns character at index 4

IO.puts "Substring : #{String.slice(my_str, 3, 8)}"
# Returns substring starting at index 3 that is 8 characters long

IO.inspect String.split(combo_str, " ")
# Splits string representation into list using delimiter

IO.puts String.reverse(combo_str) # Returns string backwards
IO.puts String.upcase(combo_str) # Return string in all caps
IO.puts String.downcase(combo_str) # Returns string with no caps
IO.puts String.capitalize(combo_str) # Returns string with capital first letter

# Interpolation example:
string = :world
IO.puts("hello #{string}")
# output: "hello world"

String.length("wow") # output: 3

#------------------------------ANONYMOUS FUNCTIONS----------------------------
# Example
# args = a, b
add = fn (a, b) -> a + b end

add.(1,2)
# output: 3

is_function(add) # output: true
is_function(add, 2) # output: true
is_function(add, 1) # output: false


# Example 2
# Anonymous functions can use other functions
double = fn a -> add.(a, a) end

double.(3) # output: 6

# Shorthand notation of anonymous functions
get_less = &(&1 - &2) # fn (var1, var2) -> var1 - var2 end

IO.puts "7 - 6 = #{get_less.(7,6)}"

# Execution can be different depending on number of arguments
add_sum = fn
  {x, y} -> IO.puts "#{x} + #{y} = #{x+y}"
  {x, y, z} -> IO.puts "#{x} + #{y} + #{z} = #{x+y+z}"
end

# NOTE: When writing a function, you can set default values for parameters

def do_it(x \\ 1, y \\ 1) do # x = 1, y = 1
  x + y # output = 2
end

# ------------------------------(LINKED) LISTS-------------------------------
# Each element contains a value and points to next element in list
# Example
list = [1, 2, true, 3]

length[1, 2, 3] # output: 3

# Lists are immutable
# Cannot modify lists - must return a whole new list
# ++/2 (concantenation)
[1, 2, 3] ++ [4, 5, 6] # output: [1, 2, 3, 4, 5, 6]

list1 = [1, true, 2, false, 3, true] -- [true, false] # output: [1, 2, 3, true]

IO.puts 7 in list1 # boolean to check if element is in list, returns false here

# Can use hd/1 to retrieve head (first element in list)
list = [1, 2, 3]
hd(list) # output: 1
# Can use tl/1 to retrieve tail (all elements in list after head)
tl(list) # output: [2, 3]

[head | tail] = list
IO.puts "Head : #{head}"
IO.write "Tail : "
IO.inspect tail

display_list(List.delete([list], [element to delete])) # outputs new list with selected element deleted
display_list(List.delete_at([list], [index to delete])) # outputs new list with selected index's element deleted
display_list(List.insert_at([list], [index to insert to])) # outputs new list with selected index element inserted

List.first([list]) # first element
List.last([list]) # last element

# Lists with printable ASCII characters may be returned as value in single quotes
[11, 12, 13] # output: '\v\f\r'
[104, 101, 108, 108, 111] # output: 'hello'

# Function i/1 returns info about a value
i 'hello'
# output:
# Term
#  'hello'
# Data type
#   List
# Description
#   ...
# Raw representation
#   [104, 101, 108, 108, 111]
# Reference modules
#   List
# Implemented protocols
#   ...

IO.inspect [97, 98], char_lists: :as_lists #  Prints actual list of numbers, not char representations

# Enumerating each element in list (tail in this case)
Enum.each tail, fn item ->
  IO.puts item
end


# -------------------------------TUPLES-------------------------------
# Stored contiguosly and 0-indexed, kinda like arrays
# Constant access if element index is known (unlike lists, which are O(n) access time)
tuple = {:ok, "hello"} # output: {:ok, "hello"}
elem(tuple, 1) # output: "hello"
tuple_size(tuple) # output: 2

# Can add elements to specific indices; this does take up hella memory tho bc you create a whole new tuple
tuple = {:a, :b, :c, :d}
put_elem(tuple, 2, :e) # output: {:a, :b, :e, :d} //WHOLE NEW TUPLE

# File contents can be read and returned as tuple in Elixir with function File.read/1
File.read("path/to/existing/file") # output: {:ok, "... contents ..."}
iex> File.read("path/to/unknown/file") # output: {:error, :enoent}

# When counting the elements in a data structure, Elixir also abides by a simple rule:
# The function is named size/1 if the operation is in constant time (i.e. the value is pre-calculated)
# or length/1 if the operation is linear (i.e. calculating the length gets slower as the input grows).
# As a mnemonic, both “length” and “linear” start with “l”.

# Tuple example functions
my_stats = {175, 6.25, :Ali}

# Returns boolean to check if input is tuple
IO.puts "Tuple #{is_tuple(my_stats)}" # output: true

# Creates new tuple with new element at end
my_stats2 = Tuple.append(my_stats, 23) # output: {175, 6.25, :Ali, 23}

# Returns element at index specified
IO.puts "Age #{elem(my_stats2, 3)}" # output: 23

# Returns size of tuple
IO.puts "Size : #{tuple_size(my_stats2)}" # output: 4

# Creates new tuple with index specified deleted
my_stats3 = Tuple.delete_at(my_stats2, 0) # output: {6.25, :Ali, 23}

# Creates new tuple specified element inserted at specified index
my_stats3 = Tuple.insert_at(my_stats2, 0, 1998) # output: {1998, 6.25, :Ali, :23}

# Creates new tuple with element at specific index replaced
my_stats4 = Tuple.put_elem(my_stats3, 1, 5.3) # output: {1998, 5.3, :Ali, :23}

{weight, height, name} = {120, 5.3, "Ali"}

IO.puts "Weight : #{weight}" # output:


#------------------------------MAPS----------------------------
map_name = %{_key1 => _value1, _key1 => _value1, ..., _key_n => _value_n, }

# Example
capitals = %{
  "NB" => "Fredericton",
  "ON" => "Ottawa",
  "AB" => "Edmonton"
}

IO.puts "Capital of New Brunswick is #{capitals["NB"]}"

# Atom version of map
capitals2 = %{
  nb: "Fredericton",
  on: "Ottawa",
  ab: "Edmonton"
}

IO.puts "Capital of Ontario is #{elem(Map.fetch(capitals2, :on), 1)}"

capitals3 = Map.put_new(capitals, "QC", "Quebec")
