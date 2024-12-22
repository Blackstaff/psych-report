defmodule PsychReport.SpeechToText.Whisperpp do
  @behaviour PsychReport.SpeechToText

  @impl true
  def transform(audio_path) do
    output_dir = Path.join([System.tmp_dir(), "psych_report/transcriptions"])
    output_file_path = Path.join([output_dir, Uniq.UUID.uuid7()])

    if not File.exists?(output_dir) do
      File.mkdir_p!(output_dir)
    end

    whisper_args = [
      "--file",
      audio_path,
      "--model",
      whisper_model_path(),
      "--language",
      "pl",
      "--output-txt",
      "--output-file",
      output_file_path
    ]

    System.cmd(whisper_executable_path(), whisper_args)

    File.read("#{output_file_path}.txt")
  end

  defp whisper_executable_path,
    do: Application.fetch_env!(:psych_report, :whisper_executable_path)

  defp whisper_model_path, do: Application.fetch_env!(:psych_report, :whisper_model_path)
end
