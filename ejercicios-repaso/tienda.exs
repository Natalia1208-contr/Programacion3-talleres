defmodule Tienda do
       @moduledoc """
         modulo que representa el calculo del precio de un producto con funciones anónimas
         -version 1.0
         -Autor:Natalia Contreras
         -Fecha: 2026-09-13
         """

        @doc """
         Función principal que inicia la aplicacion
         """

  def main do
    precio_prod="Ingrese el precio del producto: "
    |>Util.ingresar(:real)

    descuento_estudiante= crear_descuento(20)
    descuento_empleado= crear_descuento(35)

    descuento_estudiante.(precio_prod)
    |>generar_mensaje()
    |>Util.mostrar_mensaje()

    descuento_empleado.(precio_prod)
    |>generar_mensaje()
    |>Util.mostrar_mensaje()
  end

  defp crear_descuento(porcentaje) do
    fn x -> x-x*(porcentaje/100)
  end
 end

 defp generar_mensaje (valor) do
   "El precio del producto es: #{valor} "
 end

end
Tienda.main()
