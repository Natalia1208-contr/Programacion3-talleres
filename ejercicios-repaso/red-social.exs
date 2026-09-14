defmodule ValidarNombres do
      @moduledoc """
         modulo que representa un validador de nomnbre de usuario
         -version 1.0
         -Autor:Natalia Contreras
         -Fecha: 2026-09-11
         """

        @doc """
         Función principal que inicia la aplicacion
         """

  def main do
    nombre= "Ingrese el nomnre de usuario que quiere poner: "
    |>Util.ingresar(:texto)
    |>String.trim()

    longitud= String.length(nombre)

    es_valido(longitud)
    |>Util.mostrar_mensaje()

  end

  defp es_valido(longitud) do
    if longitud >= 5 do
      "Nombre de usuario válido"
    else
      "Nombre de usuario muy corto, debe tener al menos 5 caracteres"
  end
 end
end
ValidarNombres.main()
