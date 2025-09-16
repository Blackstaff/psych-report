defmodule PsychReport.Repo do
  use Ecto.Repo,
    otp_app: :psych_report,
    adapter: Ecto.Adapters.Postgres
end
