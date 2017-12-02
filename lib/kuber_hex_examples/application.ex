defmodule Kuber.Hex.Examples.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    # List all child processes to be supervised
    settings = %{credentials: {"sk_test_mnrVg6z2G0HeDzwy5gxJfmfP", ""}, default_currency: "USD"}

    children = [
      # Starts a worker by calling: Test.Worker.start_link(arg)
      # {Test.Worker, arg},
      worker(Kuber.Hex.Worker, [Kuber.Hex.Gateways.Stripe, settings, [name: :stripe_gateway]])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Test.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
