# Example
def sum([h|t]), do: h + sum(t)
# Recursively adds all items in list
# 1. Starts with head
# 2. Head + sum of tail elements is calculated
# 3. Each calculation involves getting the new head of the list and adding to new tail
# 4. Process repeats (like a queue) until list has been fully traversed

# Prints list of numbers from max to min
def loop(max, min) do
  if (max < min) do
    loop(0, min) # When min is reached, nil is returned
    # This end condition is established in above function on last line
  else
    IO.puts "Num : #{max}"
    loop(max - 1, min)
  end
end

def loop(0,_), do: nil
