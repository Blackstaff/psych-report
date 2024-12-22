defmodule PsychReport.AudioConverter.FfmpegTest do
  use ExUnit.Case
  use Patch

  alias PsychReport.AudioConverter.Ffmpeg

  test "returns path to converted file" do
    patch(Ffmpeg, :run_ffmpeg, nil)

    assert Ffmpeg.convert_to_wav(Path.join([System.tmp_dir(), "foo/bar.mp3"])) ==
             Path.join([System.tmp_dir(), "psych_report/audio", "bar.wav"])
  end
end
