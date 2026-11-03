Code.requiere_file("ruta.exs")
defmodule GestionRutas do
  def main do
    ruta1 =crear_ruta("Armenia-Salento", "Armenia", 21, true)
    IO.inspect("La ruta es: #{ruta1.nombre}")

    recorrido= %{ruta1 | recorrido: ruta1.recorrido+1}
    IO.inspect("El recorrido: #{recorrido.recorrrido}")

  end

  def crear_ruta(nombre, ciudad, distancia, favorita) do
    %Ruta{nombre: nombre, ciudad: ciudad, distancia: distancia, favorita: favorita}
  end

end
