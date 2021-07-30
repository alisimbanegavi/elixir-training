defmodule Calculator do
  def start do
    spawn(fn -> loop(0) end) #returns PID
  end
  defp loop(current_value) do
    new_value = receive do #does nothing until it receives actual input
      {:value, client_id} -> send(client_id, {:response, current_value})
        current_value
      {:add, value} -> current_value + value
      {:sub, value} -> current_value - value
      {:mult, value} -> current_value * value
      {:div, value} -> current_value / value

      invalid_request -> IO.puts("Invalid Request #{inspect invalid_request}")
        current_value
    end
    loop(new_value)
  end

  def value(pid) do
    send(pid, {:value, self()})
    receive do
        {:response, value} -> value
    end
  end
  def add(pid, num) do
    send(pid, {:add, num})
    value(pid)
  end
  def sub(pid, num) do
    send(pid, {:sub, num})
    value(pid)
  end
  def mult(pid, num) do
    send(pid, {:mult, num})
    value(pid)
  end
  def div(pid, num) do
    send(pid, {:div, num})
    value(pid)
  end
end
