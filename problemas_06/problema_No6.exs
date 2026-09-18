defmodule Tienda do
  def main do
    "Ingrese los anios de antiguedad que tiene con la empresa: "
    |>Util.ingresar(:entero)
    |>determinar_descuento()
    |>Util.mostrar_mensaje()

  end

  defp determinar_descuento(anios) do
    cond do
      anios>=1 and anios <=2 -> "Se aplicara un descuento del 10%"
      anios>=3 and anios<=6 -> "Se aplicara una desuento del 14%"
      anios>6 -> "Se aplicara una desuento del 17%"
      true -> "No se aplicara descuento"
    end
  end
end
Tienda.main()
