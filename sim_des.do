# sim.do

# Clear previous work library if exists
if {[file exists work]} {
    vdel -all -lib work
}
vlib work
vmap work work

# Compile all VHDL files
vcom -work work -2008 -explicit clk_divider.vhd
vcom -work work -2008 -explicit Fila.vhd
vcom -work work -2008 -explicit Deserializador.vhd
vcom -work work -2008 -explicit Top.vhd
vcom -work work -2008 -explicit tb.vhd
vcom -work work -2008 -explicit Deserializador_tb.vhd
vcom -work work -2008 -explicit Fila_tb.vhd

# Load the testbench
vsim work.des_tb

# Set warnings off quietly
quietly set StdArithNoWarnings 1
quietly set StdVitalGlitchNoWarnings 1

# Load waveform config if you have one, optional
do wave_des_tb.do

# Optionally quit after simulation finishes
# quit -f
