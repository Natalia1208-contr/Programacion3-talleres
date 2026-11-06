Code.require_file("transportadora.ex")
Code.require_file("Util.ex")
defmodule Simulador do
  def main do
    nombre_cliente = Util.ingresar("Ingrese el nombre del cliente: ", :texto)
    peso_paquete = Util.ingresar("Ingrese el peso del paquete (kg): ", :entero)
    distancia_envio = Util.ingresar("Ingrese la distancia de envío (km): ", :entero)

    if peso_paquete <= 0 or distancia_envio <= 0 do
      IO.puts("El peso y la distancia deben ser mayores a cero.")
      main() # Reinicia el proceso de ingreso de datos
    else
      transportadoras = inicializar_trasportadoras()

      # Enviar la solicitud a todas las transportadoras
      enviar_solicitud_cotizacion(transportadoras, nombre_cliente, peso_paquete, distancia_envio)

      # Recibir y mostrar las cotizaciones de las 3 transportadoras
      cotizaciones = recolectar_cotizaciones(length(transportadoras), [])

      # Mostrar la mejor opción (la de menor costo)
      mostrar_resultado_final(cotizaciones)
    end
  end

  def inicializar_trasportadoras() do
    # Inicia las trasportadoras con sus respectivas tarifas y tiempos de procesamiento:
    [
      {"Andina", Trasportadora.iniciar("Andina", 8000, 1200, 90, 3000)},
      {"Cafetera", Trasportadora.iniciar("Cafetera", 7000, 1000, 100, 1000)},
      {"Express", Trasportadora.iniciar("Express", 10000, 1500, 80, 2000)}
    ]
  end

  def enviar_solicitud_cotizacion(transportadoras, nombre_cliente, peso, distancia) do
    Enum.each(transportadoras, fn {_nombre, pid} ->
      send(pid, {:cotizar, nombre_cliente, peso, distancia, self()})
    end)
  end

  # Función auxilar para esperar y recibir los mensajes de las 3 transportadoras
  defp recolectar_cotizaciones(0, acumulador), do: acumulador
  defp recolectar_cotizaciones(pendientes, acumulador) do
    receive do
      {:cotizacion, nombre, costo} ->
        recolectar_cotizaciones(pendientes - 1, [{nombre, costo} | acumulador])
    after
      10000 ->
        IO.puts("Tiempo de espera agotado para recibir todas las cotizaciones.")
        acumulador
    end
  end

  # Identifica e imprime cuál fue la opción más barata
  defp mostrar_resultado_final([]) do
    IO.puts("\nNo se recibieron cotizaciones.")
  end
  defp mostrar_resultado_final(cotizaciones) do
    IO.puts("\nRESUMEN DE COTIZACIONES")
    Enum.each(cotizaciones, fn {nombre, costo} ->
      IO.puts("Transportadora #{nombre}: $#{costo}")
    end)

    {mejor_nombre, mejor_costo} = Enum.min_by(cotizaciones, fn {_nombre, costo} -> costo end)
    IO.puts("\nLa mejor opción de envío es con #{mejor_nombre} por un valor total de $#{mejor_costo}")
  end
end
Simulador.main()
