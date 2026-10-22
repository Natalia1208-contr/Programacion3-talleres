defmodule Ventas do
  def main do
    ventas=cargar_datos()



  end

  def cargar_datos do
    [
      %{producto: "Café", categoria: "Bebidas", cantidad: 3},
      %{producto: "Té", categoria: "Bebidas", cantidad: 1},
      %{producto: "Jugo", categoria: "Bebidas", cantidad: 6},
      %{producto: "Pan", categoria: "Panadería", cantidad: 5},
      %{producto: "Croissant", categoria: "Panadería", cantidad: 2},
      %{producto: "Torta", categoria: "Panadería", cantidad: 1},
      %{producto: "Galleta", categoria: "Panadería", cantidad: 3}
    ]

    obtener_categoria(ventas,"Panadería")
    |>IO.inspect(label: "productos de panaderia")

    obtener_categorias_vendidas(ventas)
    |>IO.inspect(label: "categorias vendidas: ")


  end

  defp obtener_categoria(ventas,categoria) do
    ventas
    |>Enum.filter(fn %{categoria: cat}->cat == categoria end)
  end

  defp obtener_nombres(ventas) do
    ventas
    |>Enum.map(&(&1.producto))
  end

  defp obtener_categorias_vendidas(ventas) do
  ventas
  |> Enum.map(& &1.categoria)
  |> Enum.uniq()
end

  defp productos_por_categoria(ventas) do
  ventas
  |> Enum.group_by(& &1.categoria)
  |> Map.new(fn {categoria, elementos} ->
    productos = Enum.map(elementos, & &1.producto)
    total_ventas = Enum.reduce(elementos, 0, fn venta, acc -> acc + venta.cantidad end)
    {categoria, %{productos: productos, total_ventas: total_ventas}}
  end)
end

  defp ventas_por_categoria(ventas) do
    Enum.group_by(ventas, fn venta -> venta.categoria end, fn venta -> venta.cantidad end)
    |> Enum.map(fn {categoria, cantidades} -> {categoria, Enum.sum(cantidades)} end)
  end

  defp sumar_unidades_categoria(ventas) do
    ventas
  |> Enum.group_by(& &1.categoria)
  |> Map.new(fn {categoria, elementos} ->
     total=Enum.reduce(elementos, 0, fn venta, acc -> acc + venta.cantidad end)
     {categoria, total}
    end)
  end
end
Ventas.main()
