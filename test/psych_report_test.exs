defmodule PsychReportTest do
  use ExUnit.Case
  use Patch

  import PsychReport.TestHelpers

  alias PsychReport.AudioConverter
  alias PsychReport.SpeechToText
  alias PsychReport.ReportGenerator

  setup do
    patch(AudioConverter, :convert_to_wav, "fake/path")
    patch(SpeechToText, :transform, {:ok, read_fixture("transcription.txt")})
    patch(ReportGenerator, :create_report, %{raw_response: %{"foo" => "bar"}, response: "foobar"})
    :ok
  end

  test "creates report from recording" do
    PsychReport.run("some/input")

    assert_called(AudioConverter.convert_to_wav(_))
    assert_called(SpeechToText.transform("fake/path"))
    assert_called(ReportGenerator.create_report(transcription))
    assert transcription == read_fixture("transcription.txt")

    transcription_path =
      Application.fetch_env!(:psych_report, :reports_dir)
      |> Path.join("input/input_transcription.txt")

    assert File.exists?(transcription_path)
    assert File.read!(transcription_path) =~ "Lorem ipsum"

    raw_report_path =
      Application.fetch_env!(:psych_report, :reports_dir)
      |> Path.join("input/input_raw_response.json")

    assert File.exists?(raw_report_path)
    assert raw_report_path |> File.read!() |> Jason.decode!() == %{"foo" => "bar"}

    report_path =
      Application.fetch_env!(:psych_report, :reports_dir) |> Path.join("input/input_report.md")

    assert File.exists?(report_path)
    assert File.read!(report_path) == "foobar"
  end
end
