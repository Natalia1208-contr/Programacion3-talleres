defmodule Bolsas do
  def main do
    "Ingrese el numero del tipo de bolsa que utiliza:\n1.Plastica\n2.Biodegradable\n3.Reutilizable\n4.Otra: "
    |>Util.ingresar(:entero)
    |>determinar_descuento()
    |>Util.mostrar_mensaje()
  end

  defp determinar_descuento(numero) do
    case numero do
      1->"Recibes un descuento del 2% en tu compra"
      2->"Recibes un descuento del 12% en tu compra"
      3->"Recibes un descuento del 17% en tu compra"
      4->"No tienes descuento"
      _->"No tienes descuento"
    end
  end
end
Bolsas.main()
