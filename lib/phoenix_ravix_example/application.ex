defmodule PhoenixRavixExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PhoenixRavixExample.Repo,
      # Start the Raven Ecto Repository
      PhoenixRavixExample.RavenRepo,
      # Start the Telemetry supervisor
      PhoenixRavixExampleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhoenixRavixExample.PubSub},
      # Start the Endpoint (http/https)
      PhoenixRavixExampleWeb.Endpoint
      # Start a worker by calling: PhoenixRavixExample.Worker.start_link(arg)
      # {PhoenixRavixExample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixRavixExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixRavixExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
