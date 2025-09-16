defmodule PsychReportWeb.PageController do
  use PsychReportWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
