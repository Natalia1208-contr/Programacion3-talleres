defmodule Notas do
  def main do
    lista = [
      %{nombre: "juan", nota: 4.0},
      %{nombre: "maria", nota: 4.5},
      %{nombre: "nata", nota: 5.0},
      %{nombre: "pipe", nota: 2.7}
    ]

    IO.inspect(calcular_promedio(lista), label: "Promedio del curso")
    IO.inspect(contar_estudiantes(lista), label: "{Nota mínima, Nota máxima}")
  end

  defp calcular_promedio(lista) do
    # Extraemos solo las notas y las sumamos directamente con Enum.sum/1
    suma_total =
      lista
      |> Enum.map(fn est -> est.nota end)
      |> Enum.sum()

    suma_total / length(lista)
  end

  defp contar_estudiantes(lista) do
    lista
    |> Enum.map(fn est -> est.nota end)
    |> Enum.min_max()
  end
end

Notas.main()
