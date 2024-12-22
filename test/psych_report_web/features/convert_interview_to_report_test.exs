defmodule PsychReportWeb.Features.ConvertInterviewToReportTest do
  use PsychReportWeb.FeatureCase, async: true
  use Patch

  @test_file_path Path.join(File.cwd!(), "test/fixtures/test.mp3")

  setup do
    patch(PsychReport, :run, :ok)
    :ok
  end

  test "convert interview to report", %{conn: conn} do
    conn
    |> visit("/")
    |> upload("Upload interview", @test_file_path)
    |> click_button("Upload")

    assert_called(PsychReport.run(_))
  end
end
