defmodule PsychReport.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PsychReportWeb.Telemetry,
      PsychReport.Repo,
      {DNSCluster, query: Application.get_env(:psych_report, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PsychReport.PubSub},
      # Start a worker by calling: PsychReport.Worker.start_link(arg)
      # {PsychReport.Worker, arg},
      # Start to serve requests, typically the last entry
      PsychReportWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PsychReport.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PsychReportWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
