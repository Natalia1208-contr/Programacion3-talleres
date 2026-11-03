Code.require_file("libro.ex")
Code.require_file("CVS.ex")

defmodule Persistencia do

  @nombre_archivo_csv "libros.csv"
  @titulos "id, titulo, autor, precio\n"

  def guardar_libros(libros, :csv) do
    CSV.escribir_csv(libros, @nombre_archivo_csv, @titulos, &Libro.convertir_libro_linea_csv/1 )
  end

  def cargar_libros(:csv) do
    CSV.leer_csv(@nombre_archivo_csv, &Libro.convertir_libro_linea_csv/1)
  end

end
