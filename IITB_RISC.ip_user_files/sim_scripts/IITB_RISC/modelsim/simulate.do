onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xlconstant_v1_1_6 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.IITB_RISC xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {IITB_RISC.udo}

run -all

quit -force
