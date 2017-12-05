defmodule Kuber.Hex.Examples.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    # List all child processes to be supervised
    stripe_settings = %{credentials: {"sk_test_mnrVg6z2G0HeDzwy5gxJfmfP", ""}, default_currency: "USD"}
    monei_settings = %{userId: "8a829417539edb400153c1eae83932ac", password: "6XqRtMGS2N", entityId: "8a829417539edb400153c1eae6de325e"}

    children = [
      # Starts a worker by calling: Test.Worker.start_link(arg)
      # {Test.Worker, arg},
      worker(Kuber.Hex.Worker, [Kuber.Hex.Gateways.Stripe, stripe_settings, [name: :stripe_gateway]], id: Kuber.Hex.Gateways.Stripe),
      worker(Kuber.Hex.Worker, [Kuber.Hex.Gateways.Monei, monei_settings, [name: :monei_gateway]], id: Kuber.Hex.Gateways.Monei)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Test.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
