defmodule Reversible do
  def main do
    IO.puts(es_reversible?(36))
  end

  # Función principal con validación
  def es_reversible?(num) when is_integer(num) and num > 0 do
    if rem(num, 10) == 0 do
      false
    else
      reverso = invertir(num, 0)
      suma = num + reverso
      todos_impares?(suma)
    end
  end

  # Captura de cualquier entrada inválida
  def es_reversible?(_num), do: false

  # Invertir el número
  defp invertir(0, acc), do: acc

  defp invertir(n, acc) do
    ultimo_digito = rem(n, 10)
    invertir(div(n, 10), acc * 10 + ultimo_digito)
  end

  #Verificar que todos los dígitos sean impares
  defp todos_impares?(0), do: true

  defp todos_impares?(n) do
    digito = rem(n, 10)

    # Si el dígito es impar, evaluamos el resto del número
    if rem(digito, 2) != 0 do
      todos_impares?(div(n, 10))
    else
      false
    end
  end
end
Reversible.main()
