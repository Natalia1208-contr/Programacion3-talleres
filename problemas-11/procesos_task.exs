defmodule Procesos do
  def main do
    task1 = Task.async(fn -> sumar_numeros(12,4) end)
    task2= Task.async(fn -> multiplicar_numeros(4,7)end)
    task3 = Task.async(fn -> es_palindromo?("oso") end)

    result1 = Task.await(task1)
    result2 = Task.await(task2)
    result3 = Task.await(task3)

    IO.puts("Resultado de la suma: #{result1}")
    IO.puts("Resultado de la multiplicacion: #{result2}")
    IO.puts("Resultado de la verificacion palindrome: #{result3}")
  end
  def sumar_numeros(a,b) do
     a+b
  end

  def multiplicar_numeros(a,b) do
    a*b
  end

   defp es_palindromo?(palabra) do
    palindrome = palabra==String.reverse(palabra)
  end
end
