defmodule Biblioteca do
  # Indexa los libros vinculados a un cliente específico
  def consultar_libros_de_cliente(id_cliente, lista_prestamos, lista_libros) do
    ids_libros_prestados =
      lista_prestamos
      |> Enum.filter(fn prestamo -> prestamo.id_cliente == id_cliente end)
      |> Enum.map(fn prestamo -> prestamo.id_libro end)

    lista_libros
    |> Enum.filter(fn libro -> Enum.member?(ids_libros_prestados, libro.id) end)
  end

  # Construye la salida formateada con el listado de libros del cliente
  def generar_reporte_cliente(cliente, lista_prestamos, lista_libros) do
    libros = consultar_libros_de_cliente(cliente.id, lista_prestamos, lista_libros)

    encabezado =
      "\n==================================================\n" <>
      " REGISTRO DE LIBROS DE: #{cliente.nombre} (ID: #{cliente.id})\n" <>
      "==================================================\n"

    cuerpo =
      if Enum.empty?(libros) do
        "  [Sin libros asignados actualmente]\n"
      else
        libros
        |> Enum.map(fn libro -> "  • [#{libro.id}] \"#{libro.titulo}\" - #{libro.autor} ($#{libro.precio})" end)
        |> Enum.join("\n") <> "\n"
      end

    encabezado <> cuerpo
  end
end
