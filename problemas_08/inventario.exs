defmodule Inventario do
  def main do
  productos= cargar_datos()

  buscar_barato_caro(productos)
  |>IO.inspect()
  end

  def cargar_datos do
    [
  %{id: 1, nombre: "Teclado mecánico", precio: 180000, stock: 12, categoria: "Periféricos"},
  %{id: 2, nombre: "Mouse inalámbrico", precio: 75000, stock: 0, categoria: "Periféricos"},
  %{id: 3, nombre: "Monitor 24\"", precio: 620000, stock: 5, categoria: "Pantallas"},
  %{id: 4, nombre: "Cable HDMI", precio: 25000, stock: 40, categoria: "Accesorios"},
  %{id: 5, nombre: "Base para portátil", precio: 90000, stock: 0, categoria: "Accesorios"},
  %{id: 6, nombre: "Audífonos", precio: 150000, stock: 8, categoria: "Accesorios"},
  %{id: 7, nombre: "Monitor 27\"", precio: 950000, stock: 3, categoria: "Pantallas"}
]
  end

  defp calcular_valortotal(productos) do
    Enum.reduce(productos,0, fn prod,acc-> acc + (prod.precio*prod.stock) end )
  end

  defp obtener_sinstock(productos) do
    productos
    |>Enum.filter(fn p->p.stock==0 end)
    |>Enum.map(fn p->p.nombre end)
  end

  defp accesorios_ordenados(productos) do
    productos
    |>Enum.filter(fn p->p.categoria=="Accesorios"end)
    |>Enum.sort_by(fn p->p.precio end)
  end

  defp buscar_barato_caro(productos) do
    barato = Enum.min_by(productos, & &1.precio)
    caro = Enum.max_by(productos, & &1.precio)
  [
    {:mas_barato, barato.nombre, barato.precio},
    {:mas_caro, caro.nombre, caro.precio}
  ]
  end

  defp agrupar_categoria(productos) do
    productos
    |>Enum.group_by(& &1.categoria)
  end
end
Inventario.main()
