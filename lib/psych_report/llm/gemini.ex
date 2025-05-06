defmodule PsychReport.Llm.Gemini do
  @behaviour PsychReport.Llm

  @impl true
  def call(prompt) do
    GoogleAI.client()
    |> GoogleAI.Model.new(model: llm_model_name())
    |> GoogleAI.Content.generate(prompt)
    |> unwrap()
  end

  defp unwrap({:ok, response}) do
    {:ok, response |> get_in(["candidates", Access.at(0), "content", "parts"]) |> Enum.join(" ")}
  end

  defp llm_model_name, do: Application.get_env(:psych_report, :llm_model_name)
end
