defmodule Tienda do
   @moduledoc """
         modulo que representa una tienda de celulares
         -version 1
         -Autor:Natalia Contreras
         -Fecha: 2026-09-10
         """

        @doc """
         Función principal que inicia la aplicacion
         """

  def main do
    valor_producto= "ingrese el valor del producto: "
    |>Util.ingresar(:float)
    descuento="ingrese el porcentaje de descuento del producto (entre 0 y 1): "
    |>Util.ingresar(:float)
    valor_descuento= calcular_valor_descuento(valor_producto,descuento)
    valor_fin=calcular_valorfin(valor_producto, valor_descuento)
    generar_mensaje_descuento(valor_fin)
    |>Util.mostrar_mensaje()
  end

  defp calcular_valor_descuento(valor_producto, descuento) do
    valor_producto * descuento
  end

  defp calcular_valorfin(valor_producto, valor_descuento) do
    valor_producto-valor_descuento
  end

  def generar_mensaje_descuento(valor_fin) do
        "El valor del producto con descuento aplicado es: #{valor_fin}"
      end
end
Tienda.main()
