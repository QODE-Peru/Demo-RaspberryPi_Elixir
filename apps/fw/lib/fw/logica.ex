defmodule Fw.Logica do
  use GenServer
  alias Nerves.Leds
  alias ElixirALE.GPIO

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def pulsar(color) when color in [:rojo, :azul, :verde, :amarillo, :blanco] do
    GenServer.call(__MODULE__, {:pulsar, color})
  end

  def init(_par) do
    [:red, :green] |> Enum.each(&fastblink/1)
    {:ok, rojo_pid} = GPIO.start_link(14, :output)
    {:ok, azul_pid} = GPIO.start_link(15, :output)
    {:ok, verde_pid} = GPIO.start_link(18, :output)
    {:ok, amarillo_pid} = GPIO.start_link(20, :output)
    {:ok, blanco_pid} = GPIO.start_link(21, :output)
    {:ok, %{rojo: {rojo_pid, :apagado},
            azul: {azul_pid, :apagado},
            verde: {verde_pid, :apagado},
            amarillo: {amarillo_pid, :apagado},
            blanco: {blanco_pid, :apagado}
          }
     }
  end

  def handle_call({:pulsar, color}, _from, colores) do
    colores
    |> Map.get(color)
    |> toggle_led()
    |> respuesta_pulsar(color, colores)
  end

  defp toggle_led({color_pid, :apagado}) do
    GPIO.write(color_pid, 1)
    {color_pid, :encendido}
  end

  defp toggle_led({color_pid, :encendido}) do
    GPIO.write(color_pid, 0)
    {color_pid, :apagado}
  end

  defp respuesta_pulsar(estado, color, colores) do
    {:reply, :ok, colores |> Map.put(color, estado)}
  end

  defp fastblink(led) do
    Leds.set([{led, :fastblink}])
  end
end
