defmodule Filtro do
  def main do
    lista= [1,2,3,4,5,8]
    filtrada= filtrar(lista,3)
    IO.inspect(filtrada)
  end

  def filtrar([], _numero) do
    {:error, "lista vacia"}
  end

  def filtrar(lista) do
    {:error, "falta el numero"}
  end

  def filtrar([head|tail], numero) do
    filtrar([head|tail],numero, [])
  end

  def filtrar([head|tail],numero,acc) when head>numero do
    filtrar(tail,numero, [head|acc])
  end

  def filtrar([head|tail],numero,acc) when head>numero do
    filtrar(tail,numero, acc)
  end
end
Filtro.main()
