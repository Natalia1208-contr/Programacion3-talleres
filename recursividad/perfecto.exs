defmodule Perfecto do
  def main do
    perfecto=es_perfecto?(496)
    IO.puts(perfecto)
  end

  def es_perfecto?(num) do
    es_perfecto?(num,1,[])
  end

  def es_perfecto?(num,i,acc) when i<num do
    if(rem(num,i)==0) do
      es_perfecto?(num,i+1,[i|acc])
    else
      es_perfecto?(num,i+1,acc)
    end
  end

  def es_perfecto?(num,i,acc) when i>=num do
    if(Enum.sum(acc)==num) do
      "El numero #{num} es perfecto"
    else
      "El numero #{num} no es perfecto"
    end
  end
end
Perfecto.main()
