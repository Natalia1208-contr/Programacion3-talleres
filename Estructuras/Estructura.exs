defmodule Estructuras do

  def main do
    "Ingrese los datos del cliente: "
    |>Cliente.ingresar(:clientes)
    |>Cliente.escribir_csv("clientes.csv")
  end

  def generar_mensaje(cliente) do
    altura=cliente.altura |>Float.round(2)#permite redondear un valor a dos decimales.
    "Hola #{cliente.nombre}, tu edad es de #{cliente.edad} años y "<>
    "tienes unal altura de #{altura}\n"
  end

end
Estructuras.main()
