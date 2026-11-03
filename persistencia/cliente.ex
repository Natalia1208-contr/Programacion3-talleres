defmodule Cliente do
  defstruct id: "", nombre: "", edad: 0

  def crear(id, nombre, edad) do
    %Cliente{id: id, nombre: nombre, edad: edad}
  end

  def ingresar(mensaje) do
    mensaje |> Util.mostrar_mensaje()
    id = "Ingrese ID del cliente: " |> Util.ingresar(:texto)
    nombre = "Ingrese nombre: " |> Util.ingresar(:texto)
    edad = "Ingrese edad: " |> Util.ingresar(:entero)

    crear(id, nombre, edad)
  end

  def ingresar(mensaje, :clientes) do
    ingresar(mensaje, [], :clientes)
  end

  defp ingresar(mensaje, lista, :clientes) do
    cliente = ingresar(mensaje)
    nueva_lista = lista ++ [cliente]

    mas_clientes = "\n¿Ingresar más clientes? (s/n): " |> Util.ingresar(:boolean)

    case mas_clientes do
      true -> ingresar(mensaje, nueva_lista, :clientes)
      false -> nueva_lista
    end
  end

  def convertir_cadena_cliente(cadena) do
    [id, nombre, edad] =
      cadena
      |> String.split(",")
      |> Enum.map(&String.trim/1)

    crear(id, nombre, String.to_integer(edad))
  end

  def convertir_cliente_linea_csv(cliente) do
    "#{cliente.id}, #{cliente.nombre}, #{cliente.edad}"
  end
end
