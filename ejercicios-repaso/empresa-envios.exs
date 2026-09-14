defmodule Envios do
      @moduledoc """
         modulo que representa un generador de mensaje para una empresa de envios
         -version 1.0
         -Autor:Natalia Contreras
         -Fecha: 2026-09-11
         """

        @doc """
         Función principal que inicia la aplicacion
         """
  def main do
    usuario= "Ingrese su nombre: "
    |>Util.ingresar(:texto)

    destinatario="Ingrese el nombre del destinatario: "
    |>Util.ingresar(:texto)

    direccion="Ingrese la dirección de entrega: "
    |>Util.ingresar(:texto)

    generar_mensaje(usuario, destinatario, direccion)
    |>Util.mostrar_mensaje()
  end

  defp generar_mensaje(usuario,destinatario,direccion) do
    "El paquete a nombre de #{usuario} quedó registrado para ser entregado a #{destinatario} en la dirección #{direccion}."
  end
end
Envios.main()
