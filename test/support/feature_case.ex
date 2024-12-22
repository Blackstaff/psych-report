defmodule PsychReportWeb.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use PsychReportWeb, :verified_routes

      import PsychReportWeb.FeatureCase

      import PhoenixTest
    end
  end

  setup do
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
