# sim.do

# Clear previous work library if exists
if {[file exists work]} {
    vdel -all -lib work
}
vlib work
vmap work work

# Compile all VHDL files
vcom -work work -2008 -explicit Fila.vhd
vcom -work work -2008 -explicit Deserializador.vhd
vcom -work work -2008 -explicit Top.vhd
vcom -work work -2008 -explicit tb.vhd
# Load the testbench
vsim work.tb

# Set warnings off quietly
quietly set StdArithNoWarnings 1
quietly set StdVitalGlitchNoWarnings 1

# Load waveform config if you have one, optional
do wave.do

run 2000 ms

# Optionally quit after simulation finishes
# quit -f
