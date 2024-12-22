defmodule PsychReport.AudioConverter do
  @audio_converter Application.compile_env!(:psych_report, :audio_converter)

  @callback convert_to_wav(%{input_path: Path.t(), basename: String.t()}) :: Path.t()

  defdelegate convert_to_wav(params), to: @audio_converter
end
