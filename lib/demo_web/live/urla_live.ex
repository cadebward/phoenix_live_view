defmodule DemoWeb.UrlALive do
  use Phoenix.LiveView

  alias DemoWeb.UrlBLive
  alias DemoWeb.Router.Helpers, as: Routes

  def render(assigns) do
    ~L"""
    <div>
      <button phx-click="redirect">live_redirect to next page</button>
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
    {:noreply, live_redirect(socket, to: Routes.live_path(socket, UrlBLive, :param))}
  end
end
