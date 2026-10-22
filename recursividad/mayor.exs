defmodule Mayor do
  def main do
    lista = [1,2,3,4,5]
    mayor=encontrar_mayor(lista)
    IO.puts(mayor)
  end

  def encontrar_mayor([]) do
    {:error, "lista vacia"}
  end

  def encontrar_mayor([head|tail]) do
      encontrar_mayor(tail,head)
  end

  def encontrar_mayor([head|tail], mayor) when head>mayor do
    encontrar_mayor(head,tail)
  end

   def encontrar_mayor([head|tail], mayor) do
    encontrar_mayor(head,tail)
  end
end
