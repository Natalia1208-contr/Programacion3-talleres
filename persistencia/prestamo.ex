defmodule Prestamo do
  defstruct id: "", id_cliente: "", id_libro: "", fecha: ""

  def crear(id, id_cliente, id_libro, fecha) do
    %Prestamo{id: id, id_cliente: id_cliente, id_libro: id_libro, fecha: fecha}
  end

  def convertir_cadena_prestamo(cadena) do
    [id, id_cliente, id_libro, fecha] =
      cadena
      |> String.split(",")
      |> Enum.map(&String.trim/1)

    crear(id, id_cliente, id_libro, fecha)
  end

  def convertir_prestamo_linea_csv(prestamo) do
    "#{prestamo.id}, #{prestamo.id_cliente}, #{prestamo.id_libro}, #{prestamo.fecha}"
  end
end
