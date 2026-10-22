defmodule Potencia do
 def main do
   potencia=es_potencia?(16,2)
   IO.puts(potencia)
 end

 def es_potencia?(1,_b) do
   true
 end

 def es_potencia?(n,b) when n<1 or b<=1 do
   false
 end

  def es_potencia?(n,b) do
   if rem(n,b) == 0 do
     es_potencia?(div(n,b),b)
   else
    false
   end
 end

end
Potencia.main()
