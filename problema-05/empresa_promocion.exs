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


  def aplicar_descuento_cond (monto) do
    cond do
    monto > 500000.0 -> monto * 0.85
    monto > 100000.0 -> monto * 0.90
    monto > 50000.0  -> monto * 0.95
    true -> monto
    end
    end

  defp calcular_precio(precio) when precio <= 50000 do
  precio
end
defp calcular_precio(precio) when precio <= 100000 do
  precio * 0.95
end
defp calcular_precio(precio) when precio < 500000 do
  precio * 0.90
end
defp calcular_precio(precio) when precio >= 500000 do
  precio * 0.85
end

  def generar_mensaje(valor) do
    "El valor de su compra con descuento es de: #{valor}"
  end
end
Empresa.main()
