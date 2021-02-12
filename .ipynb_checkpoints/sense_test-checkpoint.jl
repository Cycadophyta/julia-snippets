using SenseHat
using ColorTypes

const LED = led_matrix()

LED[:] = SenseHat.JULIA_LOGO

t = temperature()
h = humidity()
p = pressure()

println("Temperature = $t")
println("Humidity = $h")
println("Pressure = $p")
sleep(5)
led_clear()
