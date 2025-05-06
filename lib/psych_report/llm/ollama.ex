defmodule PsychReport.Llm.Ollama do
  @behaviour PsychReport.Llm

  @impl true
  def call(prompt) do
    Ollama.init()
    |> Ollama.completion(model: llm_model_name(), prompt: prompt)
    |> unwrap()
  end

  defp unwrap({:ok, %{"response" => response}}), do: {:ok, response}

  defp llm_model_name, do: Application.get_env(:psych_report, :llm_model_name)
end
