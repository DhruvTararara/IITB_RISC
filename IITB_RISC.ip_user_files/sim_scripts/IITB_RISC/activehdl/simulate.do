onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+IITB_RISC -L xil_defaultlib -L xlconstant_v1_1_6 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.IITB_RISC xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {IITB_RISC.udo}

run -all

endsim

quit -force
