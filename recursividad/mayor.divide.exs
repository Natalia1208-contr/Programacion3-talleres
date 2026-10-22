defmodule Mayor do
  def main do
    lista= [1,2,4,6,12]
    mayor=encontrar_mayor(lista)
    IO.puts(mayor)
  end

  #casos base: lista vacia y con un solo elemento
  def encontrar_mayor([]) do
    {:error, "lista vacia"}
  end

  def encontrar_mayor([elem]), do: elem

 #Divide y venceras
  def encontrar_mayor(lista) do
    medio = div(length(lista), 2)
    {izquierda, derecha} = Enum.split(lista, medio)

    max(encontrar_mayor(izquierda), encontrar_mayor(derecha))
  end

end
Mayor.main()
