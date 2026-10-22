defmodule Notas do
  def main do
    lista = [
      %{nombre: "juan", nota: 4.0},
      %{nombre: "maria", nota: 4.5},
      %{nombre: "nata", nota: 5.0},
      %{nombre: "pipe", nota: 2.7}
    ]

    IO.inspect(calcular_promedio(lista), label: "Promedio del curso")

    {min, max} = nota_min_max(lista)
    IO.puts("Nota mínima: #{min} | Nota máxima: #{max}")

    IO.puts("\nestudiantes reprobados")
    IO.inspect(aprobados(lista), label: "Listado de aprobados")
    IO.puts("Total aprobados: #{cantidad_aprobados(lista)}")

    IO.puts("\nestudiantes reprobados")
    IO.inspect(reprobados(lista), label: "Listado de reprobados")
    IO.puts("Total reprobados: #{cantidad_reprobados(lista)}")
  end

  defp calcular_promedio(lista) do
    suma_total =
      lista
      |> Enum.map(fn est -> est.nota end)
      |> Enum.sum()

    suma_total / length(lista)
  end

  defp nota_min_max(lista) do
    lista
    |> Enum.map(fn est -> est.nota end)
    |> Enum.min_max()
  end

  # Retorna la lista de mapas de los estudiantes aprobados
  defp aprobados(lista) do
    Enum.filter(lista, fn est -> est.nota >= 3.0 end)
  end

  # Retorna la cantidad total de aprobados
  defp cantidad_aprobados(lista) do
    lista
    |> aprobados()
    |> length()
  end

  # Retorna la lista de mapas de los estudiantes reprobados
  defp reprobados(lista) do
    Enum.filter(lista, fn est -> est.nota < 3.0 end)
  end

  # Retorna la cantidad total de reprobados
  defp cantidad_reprobados(lista) do
    lista
    |> reprobados()
    |> length()
  end
end

Notas.main()
