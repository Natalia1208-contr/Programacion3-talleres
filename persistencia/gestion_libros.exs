Code.require_file("libro.ex")
Code.require_file("Util.ex")
defmodule GestionLibros do
  def main do
    "Ingrese los datos de los libros: "
    |>Libro.ingresar_libro(:libros)
    |>Libro.generar_mensaje_libros()
    |>Util.mostrar_mensaje()

  end

end
GestionLibros.main()
