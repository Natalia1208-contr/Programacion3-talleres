defmodule Vocales do
  def main do
    vocales=contar_vocales("natalia")
    IO.puts(vocales)
  end

  def contar_vocales(palabra) do
    contar_vocales(String.graphemes(palabra),0)
  end

  def contar_vocales([], contador) do
    contador
  end

  def contar_vocales([head|tail], contador) do
    if head in ["a","e","i","o","u"] do
      contar_vocales(tail, contador + 1)
    else
      contar_vocales(tail, contador)
    end
  end

end
Vocales.main()
