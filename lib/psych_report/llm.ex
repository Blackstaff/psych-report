defmodule PsychReport.Llm do
  @llm Application.compile_env!(:psych_report, :llm)

  @callback call(prompt :: String.t()) :: {:ok, response: %{}} | {:error, any()}

  defdelegate call(prompt), to: @llm
end
