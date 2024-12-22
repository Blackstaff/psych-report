defmodule PsychReport.Llm.Gemini do
  @behaviour PsychReport.Llm

  @impl true
  def call(prompt) do
    GoogleAI.client()
    |> GoogleAI.Model.new(model: llm_model_name())
    |> GoogleAI.Content.generate(prompt)
  end

  defp llm_model_name, do: Application.get_env(:psych_report, :llm_model_name)
end
