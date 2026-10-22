defmodule DivideYVenceras do
  def sumar(a, b) when a == b do
    a
  end

  def sumar(a, b) do
    mitad = div(a + b, 2)

    parte_izquierda = sumar(a, mitad)
    parte_derecha = sumar(mitad + 1, b)

    parte_izquierda + parte_derecha
  end
end
