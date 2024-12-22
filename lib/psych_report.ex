defmodule PsychReport do
  @moduledoc """
  Documentation for `PsychReport`.
  """

  require Logger
  alias PsychReport.AudioConverter
  alias PsychReport.SpeechToText
  alias PsychReport.ReportGenerator

  def run(input_path) do
    basename = Path.basename(input_path)
    basedir = Path.join(reports_dir(), basename)

    if not File.exists?(basedir) do
      File.mkdir_p!(basedir)
    end

    with audio_path <- AudioConverter.convert_to_wav(input_path),
         {:ok, transcription} <- SpeechToText.transform(audio_path),
         report <- ReportGenerator.create_report(transcription) do
      save_report(report, basedir)
      save_transcription(transcription, basedir)
    else
      {:error, error} ->
        Logger.debug(error)
        {:error, error}
    end
  end

  defp save_transcription(transcription, basedir) do
    basedir
    |> Path.join("#{Path.basename(basedir)}_transcription.txt")
    |> File.write(transcription)
  end

  defp save_report(%{raw_response: raw_response, response: response}, basedir) do
    basedir
    |> Path.join("#{Path.basename(basedir)}_raw_response.json")
    |> File.write(Jason.encode!(raw_response))

    basedir
    |> Path.join("#{Path.basename(basedir)}_report.md")
    |> File.write(response)
  end

  defp reports_dir, do: Application.fetch_env!(:psych_report, :reports_dir)
end
