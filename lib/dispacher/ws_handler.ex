defmodule Dispacher.WsHandler do
  @behaviour :cowboy_websocket

  def init(req, state) do
#    IO.puts "* connection started"
#    :erlang.start_timer(1000, self, [])
    {:cowboy_websocket, req, state}
  end

  def websocket_init(state) do
    {:ok, state}
  end

  def websocket_handle(m, state) do
    # m2 = String.reverse(m)
    {:reply, "OK", state}
  end

  def websocket_info(_info, state) do
    {:ok, state}
  end
end