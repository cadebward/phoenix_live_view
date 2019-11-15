defmodule DemoWeb.UrlBLive do
  use Phoenix.LiveView

  alias DemoWeb.UrlALive
  alias DemoWeb.Router.Helpers, as: Routes

  def render(assigns) do
    ~L"""
    <div>
      <button phx-click="redirect">live_redirect to prev page</button>
    </div>
    """
  end

  def mount(_session, socket) do
    {:ok, socket}
  end

  def handle_params(_params, url, socket) do
    IO.inspect(url)
    {:noreply, socket}
  end

  def handle_event("redirect", _data, socket) do
    socket =
      socket
      |> live_redirect(to: Routes.live_path(socket, UrlALive, :param))
    {:noreply, socket}
  end
end
