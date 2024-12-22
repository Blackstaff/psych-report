defmodule PsychReportWeb.ProcessRecordingLive do
  use PsychReportWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:uploaded_recording, nil)
     |> allow_upload(:recording,
       accept: ~w(video/mp4 audio/mpeg audio/wav video/mpeg),
       max_entries: 1,
       max_file_size: 1_000_000_000
     )}
  end

  @impl Phoenix.LiveView
  def handle_event("validate", _params, socket) do
    {:noreply, socket}
  end

  @impl Phoenix.LiveView
  def handle_event("cancel-upload", %{"ref" => ref}, socket) do
    {:noreply, cancel_upload(socket, :recording, ref)}
  end

  @impl Phoenix.LiveView
  def handle_event("save", _params, socket) do
    uploaded_recording =
      consume_uploaded_entries(socket, :recording, fn %{path: path}, _entry ->
        dest =
          Path.join([
            :code.priv_dir(:psych_report),
            "uploaded_recordings",
            Path.basename(path)
          ])

        PsychReport.run(path)

        {:ok, ~p"/reports/#{Path.basename(dest)}/#{Path.basename(dest) <> "_report.md"}"}
      end)
      |> List.first()

    {:noreply, assign(socket, :uploaded_recording, uploaded_recording)}
  end

  defp error_to_string(:too_large), do: "Too large"
  defp error_to_string(:too_many_files), do: "You have selected too many files"
  defp error_to_string(:not_accepted), do: "You have selected an unacceptable file type"
end
