defmodule Correo do
    @moduledoc """
         modulo que representa un generador de correos
         -version 1
         -Autor:Natalia Contreras
         -Fecha: 2026-09-10
         """

        @doc """
         Función principal que inicia la aplicacion
         """

  def main do
    nombre = "Ingrese su nombre: "
    |>Util.ingresar(:texto)
    |>String.trim()
    |>String.downcase()

    apellido = "Ingrese su primer apellido: "
    |>Util.ingresar(:texto)
    |>String.trim()
    |>String.downcase()

    generar_mensaje(nombre,apellido)
    |>Util.mostrar_mensaje()
  end

  defp generar_mensaje(nombre,apellido) do
    "Su correo es: #{nombre}.#{apellido}@uniquindio.edu.co"
  end

end

Correo.main()
