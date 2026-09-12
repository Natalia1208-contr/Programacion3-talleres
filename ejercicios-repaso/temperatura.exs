defmodule Temperatura do
        @moduledoc """
         modulo que separa el calculo de conversión de temperatura
         de la impresión de un mensaje
         -version 1
         -Autor:Natalia Contreras
         -Fecha: 2026-09-11
         """

        @doc """
         Función principal que inicia la aplicacion
         """
  def main do
    celsius= "Ingrese los grados celsius que quiere convertir a Fahrenheit: "
    |>Util.ingresar(:real)

    resultado= convertir_celsius(celsius)
    |>generar_mensaje()
    |>Util.mostrar_mensaje()

  end

  defp convertir_celsius(celsius) do
     (celsius * 9 / 5) + 32
  end

  defp generar_mensaje(resultado) do
    "La temperatura en Fahrenheit es: #{resultado}"
  end
end
Temperatura.main()
