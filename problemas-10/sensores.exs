defmodule Sensores do
  def main  do
    IO.puts("Iniciando programa de sensores... proceso principal: #{inspect(self())}")
    #identificador del proceso que se va a crear
    pid1 = spawn(fn ->  leer_sensor("Temperatura") end)
    pid2 = spawn(fn ->  leer_sensor("Humedad") end)

    IO.puts("Sensores iniciados, esperando que terminen...")
    IO.puts(pid1)
    IO.puts(pid2)

    Process.sleep(2000)
  end

  def leer_sensor(nombre) do
     IO.puts("Proceso hijo:  #{inspect(self())}")
    #identificador del proceso que se va a crear
    Process.sleep(2000)
    IO.puts("leyendo sensor: #{nombre}")
  end
end
Sensores.main()
