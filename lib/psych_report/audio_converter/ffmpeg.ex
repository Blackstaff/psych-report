defmodule PsychReport.AudioConverter.Ffmpeg do
  @behaviour PsychReport.AudioConverter

  @impl true
  def convert_to_wav(input_path) do
    dir_path = Path.join(System.tmp_dir(), "/psych_report/audio")
    basename = input_path |> Path.rootname() |> Path.basename()
    filename = basename <> ".wav"

    if not File.exists?(dir_path) do
      File.mkdir_p!(dir_path)
    end

    args = ~w(-ac 1 -ar 16k -f f32le -v quiet -)

    run_ffmpeg(
      ["-i", input_path, "-y"] ++ args ++ ["#{System.tmp_dir()}/psych_report/audio/#{filename}"]
    )

    # Think about:
    # ffmpeg -i output_dirty.wav -af "afftdn=nr=20:nf=-20:tn=1" output.wav
    # to denoise the audio

    Path.join(dir_path, filename)
  end

  defp run_ffmpeg(args), do: System.cmd(ffmpeg_path(), args)

  defp ffmpeg_path do
    case Application.get_env(:psych_report, :ffmpeg_path) do
      nil -> System.find_executable("ffmpeg")
      path -> path
    end
  end
end
