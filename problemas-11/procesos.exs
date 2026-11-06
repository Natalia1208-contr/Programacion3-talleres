defmodule Procesos do
  def main do
    IO.puts("Iniciando el proceso principal")
    principal_pid = self()
    spawn(fn ->
      IO.puts("proceso hijo 1 iniciado")
      suma = sumar_numeros(25,4)
       send(principal_pid, {:listo, "La suma es #{suma}"})
      IO.puts("proceso hijo 1 finalizado")
    end)

    spawn(fn ->
      IO.puts("proceso hijo 2 iniciado")
      multip = multiplicar_numeros(5,4)
        send(principal_pid, {:listo, "Resultado de la multiplicacion #{multip}"})
      IO.puts("proceso hijo 2 finalizado")
    end)

    spawn(fn ->
      IO.puts("proceso hijo 3 iniciado")
      palind = es_palindromo?("oso")
      send(principal_pid, {:listo, "La palabra #{palind} es palindrome"})
      IO.puts("proceso hijo 3 finalizado")
    end)


    Process.sleep(3000)
    send(principal_pid, {:terminar})

    loop(principal_pid)


  end

  def loop(principal_pid) do
    receive do
      {:listo, mensaje} ->
      IO.puts(mensaje)
      loop(principal_pid)

      {:terminar}->
      IO.puts("proceso principal finalizado")
    end
  end

  def sumar_numeros(a,b) do
     a+b
  end

  def multiplicar_numeros(a,b) do
    a*b
  end

   defp es_palindromo?(palabra) do
    palindrome = palabra==String.reverse(palabra)
    if(palindrome) do
      "si"
    else
      "no"
    end
  end
end
Procesos.main()
