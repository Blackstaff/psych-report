defmodule PsychReport.ReportGeneratorTest do
  use ExUnit.Case
  use Patch

  alias PsychReport.ReportGenerator
  alias PsychReport.Llm

  setup do
    patch(Llm, :call, &Llm.Mock.call/1)
    :ok
  end

  test "creates a report based on transcription" do
    assert ReportGenerator.create_report("foo") == {:ok, "This is a test."}         
    assert_called(Llm.call(prompt))
    assert prompt =~ "foo"
  end

  test "includes initial prompt" do
    ReportGenerator.create_report("foo")
    assert_called(Llm.call(prompt))
    assert prompt =~ "Oto zapis"
  end
end
