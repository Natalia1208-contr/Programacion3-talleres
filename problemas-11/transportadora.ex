defmodule Trasportadora do

  def iniciar(nombre_transportadora, tarifa_base, valor_kg, valor_km, tiempo) do
    IO.puts("Iniciando a trasportadora #{nombre_transportadora}...")

    pid = spawn(fn -> esperar_cotizacion(nombre_transportadora, tarifa_base, valor_kg, valor_km, tiempo) end)

    IO.puts("Trasportadora iniciada com sucesso!")

    pid
  end

  defp esperar_cotizacion(nombre_transportadora, tarifa_base, valor_kg, valor_km, tiempo) do
    receive do
      {:cotizar, nombre_cliente, peso, distancia, simulador} ->
        IO.puts("Se recibió una solicitud de cotización para #{nombre_cliente}.")

        # Cálculo del costo
        costo = tarifa_base + (peso * valor_kg) + (distancia * valor_km)
        IO.puts("Estamos realizando la cotización para #{nombre_cliente} en la trasportadora #{nombre_transportadora}")

        Process.sleep(tiempo)

        send(simulador, {:cotizacion, nombre_transportadora, costo})

        esperar_cotizacion(nombre_transportadora, tarifa_base, valor_kg, valor_km, tiempo)
    end
  end

end
