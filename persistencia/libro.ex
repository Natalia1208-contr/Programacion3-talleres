defmodule Libro do
  defstruct id: "", titulo: "", autor: "", precio: 0.0

  def crear_libro(id, titulo, autor, precio) do
    %Libro{id: id, titulo: titulo, autor: autor, precio: precio}
  end

  def ingresar_libro(mensaje) do
    mensaje |> Util.mostrar_mensaje()
    id = "Ingrese ID del libro: " |> Util.ingresar(:texto)
    titulo = "Ingrese título: " |> Util.ingresar(:texto)
    autor = "Ingrese autor: " |> Util.ingresar(:texto)
    precio = "Ingrese precio: " |> Util.ingresar(:real)

    crear_libro(id, titulo, autor, precio)
  end

  def ingresar_libro(mensaje, :libros) do
    ingresar_libro(mensaje, [], :libros)
  end

  defp ingresar_libro(mensaje, lista, :libros) do
    libro = ingresar_libro(mensaje)
    nueva_lista = lista ++ [libro]

    mas_libros = "\n¿Ingresar más libros? (si/no): " |> Util.ingresar(:boolean)

    case mas_libros do
      true -> ingresar_libro(mensaje, nueva_lista, :libros)
      false -> nueva_lista
    end
  end

#transforma una línea de texto plano leída desde un archivo físico en una estructura u objeto %Libro{}
  def convertir_cadena_libro(cadena) do
    [id, titulo, autor, precio] =
      cadena
      |> String.split(",")
      |> Enum.map(&String.trim/1)

    crear_libro(id, titulo, autor, String.to_float(precio))
  end

  def convertir_libro_linea_csv(libro) do
    "#{libro.id}, #{libro.titulo}, #{libro.autor}, #{libro.precio}"
  end

 def generar_mensaje_libros(lista_libros) do
    lista_libros
    |> Enum.map(convertir_libro_linea_csv/1)
    |> Enum.join("\n")
  end
end
