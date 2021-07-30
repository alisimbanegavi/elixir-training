defmodule Chat.Supervisor do
  # Supervisors allow us to create processes which watch our running process
  # If a process dies, Supervisor can try to restart it
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
    
    # This will negate the need to call start_link/2 in server.ex when in iex
  end

  def init(_) do
    # Creating our own state inside this, hence the lack of parameter
      children = [
        worker(Chat.Server, []) # [] = initial state of Chat.Server
      ]

    supervise(children, strategy: :one_for_one)
    # :one_for_one means if a supervised process dies, the supervisor will only try to restart that one process
    # :one_for_all means "" supervisor will restart that process AND all of the processes after it
    # :simple_one_for_one defines when we want processes to be reset
  end
end
