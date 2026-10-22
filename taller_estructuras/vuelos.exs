defmodule Vuelos do
  def main do
    vuelos = [
  %{
    codigo: "AV201",
    aerolinea: "Avianca",
    origen: "BOG",
    destino: "MDE",
    duracion: 45,
    precio: 180_000,
    pasajeros: 120,
    disponible: true
  },
  %{
    codigo: "LA305",
    aerolinea: "Latam",
    origen: "BOG",
    destino: "CLO",
    duracion: 55,
    precio: 210_000,
    pasajeros: 98,
    disponible: true
  },
  %{
    codigo: "AV410",
    aerolinea: "Avianca",
    origen: "MDE",
    destino: "CTG",
    duracion: 75,
    precio: 320_000,
    pasajeros: 134,
    disponible: false
  },
  %{
    codigo: "VV102",
    aerolinea: "Viva Air",
    origen: "BOG",
    destino: "BAQ",
    duracion: 90,
    precio: 145_000,
    pasajeros: 180,
    disponible: true
  },
  %{
    codigo: "LA512",
    aerolinea: "Latam",
    origen: "CLO",
    destino: "CTG",
    duracion: 110,
    precio: 480_000,
    pasajeros: 76,
    disponible: false
  },
  %{
    codigo: "AV330",
    aerolinea: "Avianca",
    origen: "BOG",
    destino: "CTG",
    duracion: 135,
    precio: 520_000,
    pasajeros: 155,
    disponible: true
  },
  %{
    codigo: "VV215",
    aerolinea: "Viva Air",
    origen: "MDE",
    destino: "BOG",
    duracion: 50,
    precio: 130_000,
    pasajeros: 190,
    disponible: true
  },
  %{
    codigo: "LA620",
    aerolinea: "Latam",
    origen: "BOG",
    destino: "MDE",
    duracion: 145,
    precio: 390_000,
    pasajeros: 112,
    disponible: true
  },
  %{
    codigo: "AV505",
    aerolinea: "Avianca",
    origen: "CTG",
    destino: "BOG",
    duracion: 120,
    precio: 440_000,
    pasajeros: 143,
    disponible: false
  },
  %{
    codigo: "VV340",
    aerolinea: "Viva Air",
    origen: "BAQ",
    destino: "BOG",
    duracion: 85,
    precio: 160_000,
    pasajeros: 175,
    disponible: true
  }
]


    vuelos_disponibles(vuelos)
   # |>IO.inspect()

    pasajeros_por_aerolinea(vuelos)
   # |>IO.inspect()

    #descuento_vuelos(vuelos)
    #|>IO.inspect()

    formatear_duracion(vuelos)
    #|>IO.inspect()

    clasificar_duracion(vuelos)
    |>IO.inspect()

    rutas_rentables(vuelos)
    #|>IO.inspect()


  end

 def vuelos_disponibles(vuelos) do
     vuelos
     |> Enum.filter(fn %{disponible: disponible} -> disponible == true end)
     |> Enum.map(fn %{codigo: codigo} -> codigo end)
     |> Enum.sort()
  end

  def pasajeros_por_aerolinea(vuelos) do
  vuelos
  |> Enum.group_by(& &1.aerolinea)
  |> Map.new(fn {aerolinea, lista_vuelos} ->
    total = Enum.sum(for v <- lista_vuelos, do: v.pasajeros)
    {aerolinea, total}
  end)
  end

  def formatear_duracion(vuelos) do
    Enum.map(vuelos, fn %{codigo: codigo, origen: origen, destino: destino, duracion: duracion} ->
      horas = div(duracion, 60)
      minutos = rem(duracion, 60)
      minutos_str = String.pad_leading("#{minutos}", 2, "0")
      "#{codigo} — #{origen} → #{destino}: #{horas}h #{minutos_str}m "
    end)
  end

  def descuento_vuelos(vuelos) do
    precio_max="Ingrese el precio maximo de compra para su vuelo: "
    |>Util.ingresar(:entero)

    vuelos_cumplen=Enum.filter(vuelos,fn %{precio: precio} -> precio < precio_max end)
    if(Enum.empty?(vuelos_cumplen)) do
      "No se encuentran vuelos con precio menor al estipulado "
    else
    Enum.map(vuelos_cumplen,fn %{codigo: codigo, origen: origen, destino: destino, precio: precio} ->
      precio_final = precio * 0.90
      {codigo, "#{origen}-#{destino}", precio_final}
    end)
    |> Enum.sort_by(fn {_codigo, _destino, precio_final} -> precio_final end)
  end
  end

  # 3. Aerolíneas con al menos un vuelo de cada categoría (:corto, :medio, :largo)
  def clasificar_duracion(vuelos) do
    vuelos
    |> Enum.group_by(& &1.aerolinea)
    |> Enum.filter(fn {_aerolinea, lista_vuelos} ->
      categorias = Enum.map(lista_vuelos, fn %{duracion: d} ->
          cond do
            d < 60 -> :corto
            d <= 120 -> :medio
            true -> :largo
          end
        end)

      Enum.member?(categorias, :corto) and Enum.member?(categorias, :medio) and Enum.member?(categorias, :largo)
    end)
    |> Enum.map(fn {aerolinea, _vuelos} -> aerolinea end)
  end

  def rutas_rentables(vuelos) do
    vuelos
    |> Enum.filter(& &1.disponible)
    |> Enum.map(fn v -> {"#{v.origen} → #{v.destino}", v.precio * v.pasajeros} end)
    |> Enum.sort_by(fn {_ruta, ingreso} -> ingreso end, :desc)
    |> Enum.take(3)
  end


end
Vuelos.main()
