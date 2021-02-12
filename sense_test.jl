using SenseHat
using ColorTypes

ccall(:jl_exit_on_sigint, Nothing, (Cint,), 0)

const LED = led_matrix()

function julia_logo()
    LED[:] = SenseHat.JULIA_LOGO
    sleep(3)
    led_clear()
end

function show_temperature()
    t = round(temperature(); sigdigits=3)
    show_message("T: $t C", 0.1, colorant"red")
end

function show_humidity()
    h = round(humidity(); sigdigits=3)
    show_message("H: $h %", 0.1, colorant"blue")
end

function show_pressure()
    p = round(pressure(); sigdigits=3)
    show_message("P: $p", 0.1, colorant"green")
end

function main()
    show_temperature()
    sleep(1)
    show_humidity()
    sleep(1)
    show_pressure()
    sleep(1)
    led_clear()
end

julia_logo()

try
    while true
        main()
    end
catch ex
    if isa(ex, InterruptException)
        println("\nProcess terminated")
        led_clear()
    end
end
