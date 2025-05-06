defmodule PsychReport.Llm.Mock do
  @behaviour PsychReport.Llm

  @impl true
  def call(_prompt) do
    {:ok, "This is a test."}
  end
end
