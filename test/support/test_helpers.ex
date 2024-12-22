defmodule PsychReport.TestHelpers do
  @fixtures_path Path.join(File.cwd!(), "test/fixtures")

  def read_fixture(fixture) do
    @fixtures_path
    |> Path.join(fixture)
    |> File.read!()
  end
end
