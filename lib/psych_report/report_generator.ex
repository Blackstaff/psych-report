defmodule PsychReport.ReportGenerator do
  alias PsychReport.Llm

  def create_report(transcription) do
    {:ok, raw_response} = Llm.call(initial_prompt() <> "\"#{transcription}\"")

    response =
      raw_response
      |> get_in(["candidates", Access.at(0), "content", "parts"])
      |> Enum.join(" ")

    %{raw_response: raw_response, response: response}
  end

  defp initial_prompt, do: Application.fetch_env!(:psych_report, :initial_prompt)
end
