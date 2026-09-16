defmodule Empresa do
  def main do
    "ingrese el monto de su compra: "
    |>Util.ingresar(:real)
    |>aplicar_descuento()
    |>generar_mensaje()
    |>Util.mostrar_mensaje()

  end

  def aplicar_descuento (monto) do
    if monto>50000.0 && monto<=100000.0 do
      monto * 0.85
    else if monto>100000.0 && monto<=500000.0 do
        monto * 0.90
      else if monto>500000.0 do
          monto * 0.95
        else
          monto
        end
      end
    end
    end

  def generar_mensaje(valor) do
    "El valor de su compra con descuento es de: #{valor}"
  end
end
Empresa.main()
