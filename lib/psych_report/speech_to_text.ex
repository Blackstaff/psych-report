defmodule PsychReport.SpeechToText do
  @provider Application.compile_env(:psych_report, :speech_to_text_provider)

  @callback transform(audio_path :: Path.t()) :: {:ok, String.t()} | {:error, any()}

  defdelegate transform(audio_path), to: @provider
end
