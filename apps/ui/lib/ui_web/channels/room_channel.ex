defmodule UiWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("color_toggle", %{"color" => color}, socket) when color in ["rojo", "azul", "verde", "amarillo", "blanco"] do
    IO.puts(color)
    GenServer.call Fw.Logica, {:pulsar, String.to_atom(color)}
    {:reply, {:ok, "color cambiado"}, socket}
  end

  def handle_in("color_toggle", _params, socket) do
    {:reply, {:error, "colores no validos"}, socket}
  end
end
