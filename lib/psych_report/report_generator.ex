defmodule PsychReport.ReportGenerator do
  alias PsychReport.Llm

  def create_report(transcription) do
    Llm.call(system_prompt() <> "\"#{transcription}\"")
  end

  defp system_prompt, do: Application.fetch_env!(:psych_report, :system_prompt)
end
