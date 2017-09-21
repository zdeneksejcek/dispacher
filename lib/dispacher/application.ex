defmodule Dispacher.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    IO.puts "* starting dispacher"

    start_http_server()

    Supervisor.start_link([], [strategy: :one_for_one, name: Dispacher.Supervisor])
  end

  def start_http_server() do
    IO.puts "* starting http server"

    dispatch_config = build_dispatch_config()
    { :ok, _ } = :cowboy.start_clear(:http, [{:port, 8080}, {:max_connections, :infinity}, {:num_acceptors, 100}], %{:env => %{:dispatch => dispatch_config}})
    # [{:dispatch, dispatch_config}]
  end

  def build_dispatch_config do
    :cowboy_router.compile([
      { :"_",
        [
          {"/ws", Dispacher.WsHandler, []}
        ]}
    ])
  end


end