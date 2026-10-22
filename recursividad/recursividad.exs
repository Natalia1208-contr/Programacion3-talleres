defmodule Suma do
  def main do
    suma=sumar(5)
    IO.puts(suma)
  end

  def sumar(n) do
    sumar(n,0)
  end

  def sumar(0,acc) do
   acc
  end

  def sumar(n,acc) when(n>0) do
    sumar(n-1,acc+n)
  end

end
Suma.main()
