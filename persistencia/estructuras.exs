defmodule Estructuras do
  def main do
    titulos = "id, titulo, autor, precio\n"

    # 1. Capturar libros por consola y guardarlos en CSV
    "\nRegistro de Libros"
    |> Libro.ingresar(:libros)
    |> CSV.escribir_csv("libros.csv", titulos, &Libro.convertir_libro_linea_csv/1)


    "libros.csv"
    |> CSV.leer_csv(&Libro.convertir_cadena_libro/1)
    |> CSV.generar_mensaje_csv(&generar_mensaje/1)
    |> Util.mostrar_mensaje()
  end

  defp generar_mensaje(libro) do
    "Libro: #{libro.titulo} | Autor: #{libro.autor} | Precio: $#{libro.precio}"
  end
end
Estructuras.main()
