defmodule Validacion do

  def main do
  nombre= "Ingrese su nombre: "
  |>Util.ingresar(:texto)

  edad= "Ingrese su edad: "
  |>Util.ingresar(:entero)

  credenciales="Tiene credenciales validas (si o no): "
  |>Util.ingresar(:boolean)

  usuario=[nombre: nombre, edad: edad, credenciales: credenciales, intentosf: 3]

  validar_acceso(usuario)
  |>Util.mostrar_mensaje()

  end

  defp validar_credenciales(usuario) do
    if usuario && usuario[:credenciales]==true do
      :ok
    else
      {:error,"No es posible ingresar a la plataforma "}
    end
  end

  defp es_menor(usuario) do
    unless usuario[:edad]>=18  do
      {:error,"No puede ingresar a la plataforma, no cumple la mayoria de edad"}
    else
      :ok
    end
  end

  defp bloquear_cuenta(usuario) do
    if usuario[:intentosf]>=3 do
      {:error, "Su cuenta ha sido bloqueada"}
    else
      :ok
    end
  end

  defp validar_acceso(usuario) do
    if validar_credenciales(usuario)==:ok && es_menor(usuario)==:ok && validar_credenciales(usuario)== :ok do
     {:ok, "Bienvenido #{usuario[:nombre]}"}
    else
    { :error, "No puede acceder"}
    end
  end
end
Validacion.main()
