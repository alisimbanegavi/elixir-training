defmodule Chat.Server do
  use GenServer
  # crashes iex if it crashes itself

  # client side
  def start_link do
    GenServer.start_link(__MODULE__, [], name: :chat_room)
    # __MODULE__ creates a process with all of the properties of the module
    # []  = initial state that u wanna set (empty to start)
    # We're going to hardcode the pid into :chat_room so that we don't have to constantly pass pid in functions below
  end

  def get_msgs do
    GenServer.call(:chat_room, :get_msgs) # GenServer is calling process ref'd by pid and sending it get_msgs atom
    # GenServer call is usually used to get/set state
    # Call is synchronous (blocking call) so if handle_call/1 does nothing, code will stop running
    # Used when we have something that we need a direct response from (in this case, we want process state)
  end

  def add_msg(msg) do # pid = process, msg is message to be sent obv
    GenServer.cast(:chat_room, {:add_msg, msg})
    # Asynchronous so not a blocking call
  end

  # server side / callback functions
  # responds to start_link by setting state of process
  def init(msgs) do # msgs = state of process
    {:ok, msgs}
  end

  def handle_call(:get_msgs, _from, msgs) do
    {:reply, msgs, msgs} # State returned twice - usually first one would be response state and second is the new state
    # We wanna get the state from our process
    # After get_msgs/1 gets process' state, the process fires off this handle_call/1 function
    # _from identifies where msgs is coming from
  end

  def handle_cast({:add_msg, msg}, msgs) do # msg = message to be handled, msgs = entire current state of process
    {:noreply, [msg | msgs]} # [msg | msgs] is linked list where new message is head of list, and state before new message (all old messages) is the tail
    # no reply is sent because this is simply confirmation of the receipt of the new message being handled, but nothing needs to be replied to
  end
end

# iex notes
# Process.whereis(:chat_room) will return pid of current process
# This pipeline is a command to kill our process:
# Process.whereis(:chat_room) |> Process.exit(:kill)
# Upon executing above command, we can actually call whereis again
# Supervisor will have restarted out process, so new pid will be returned
