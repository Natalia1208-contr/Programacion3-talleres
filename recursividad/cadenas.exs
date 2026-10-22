defmodule Cadenas do
  def main do
    palabras = ["silla", "mesa", "palindromo"]
    mas_larga = cadena_larga(palabras)
    IO.puts(mas_larga)
  end

  def cadena_larga([]) do
    {:error, "lista vacia"}
  end

  def cadena_larga([head|tail]) do
     cadena_larga([head|tail],head)
  end

  def cadena_larga([head|tail],mayor) do
    if( String.length(head)>String.length(mayor)) do
    cadena_larga(tail,head)
    else
    cadena_larga(tail,mayor)
    end
  end

  def cadena_larga([], mayor) do
    mayor
  end

end
Cadenas.main()
