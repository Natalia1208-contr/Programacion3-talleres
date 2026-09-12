    defmodule Tienda do
        @moduledoc """
         modulo que representa una tienda
         -version
         -Autor:Natalia Contreras
         -Fecha: 2026-09-08
         """

        @doc """
         Función principal que inicia la aplicacion
         """
      def main do
        valor_total="¿Cual fue el valor de la factura?: "
        |>Util.ingresar(:entero)
        valor_pagado= "¿Cuánto pagó el clente?: "
        |>Util.ingresar(:entero)
        calcular_devuelta(valor_total,valor_pagado)
        |>generar_mensaje_devuelta()
        |>Util.mostrar_mensaje()
      end

      def calcular_devuelta(valor_total, valor_pagado) do
        valor_pagado-valor_total
      end

      def generar_mensaje_devuelta(devuelta) do
        "La devuelta es: #{devuelta}"
      end

    end
    Tienda.main()
