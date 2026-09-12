defmodule Palindrome do
  def main do
    "Ingrese una palabra: "
    |>Util.ingresar(:texto)
    |>es_palindromo?()
    |>generar_mensaje()
    |>Util.mostrar_mensaje()
  end

  defp es_palindromo?(palabra) do
    palabra==String.reverse(palabra)
  end

  defp generar_mensaje (true) do
      "La palabra es palindroma"
  end

  defp generar_mensaje (false) do
      "La palabra es palindroma"
  end

end
Palindrome.main()
