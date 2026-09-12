defmodule Saludo do
def main do
  "ingrese el nombre del empleado: "
  |>Util.ingresar(:texto)
  |>generar_mensaje()
  |>Util.mostrar_mensaje()
end

defp generar_mensaje(nombre) do
  "Bienvenido, #{nombre} a la empresa Once Ltda"
end
end
Saludo.main()
