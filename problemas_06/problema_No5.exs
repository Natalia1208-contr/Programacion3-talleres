defmodule Fabrica do
  def main do
    cedula="Ingrese su numero de cedula: "
    |> Util.ingresar(:entero)
    compra="Ingrese el valor de la compra: "
    |> Util.ingresar(:entero)
    generar_mensaje(cedula,compra)
    |> Util.mostrar_mensaje()
  end

  defp es_multiplo1991(cedula) do
   if rem(cedula, 1991) == 0 do
     true
    else
      false
    end
  end
  defp aplicar_descuento(valor) do
    valor*0.5
  end

  defp generar_mensaje(cedula,valor)do
    if es_multiplo1991(cedula)==true do
      preciofin=aplicar_descuento(valor)
      "Se aplico el descuento a su compra, debe pagar tan solo #{preciofin}"
    else
      "No se aplico descuento a su compra, debe pagar #{valor}"
    end
  end
end
Fabrica.main()
