defmodule PsychReport.Llm.Mock do
  @behaviour PsychReport.Llm

  @impl true
  def call(_prompt) do
    {:ok,
     %{
       "candidates" => [
         %{
           "content" => %{
             "role" => "model",
             "parts" => ["This is a test."]
           },
           "finishReason" => "STOP",
           "index" => 0
         }
       ]
     }}
  end
end
