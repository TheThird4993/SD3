onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fila_tb/dequeue
add wave -noupdate /fila_tb/enqueue
add wave -noupdate /fila_tb/f_data_out
add wave -noupdate /fila_tb/f_data_in
add wave -noupdate /fila_tb/f_len_out
add wave -noupdate /fila_tb/clk
add wave -noupdate /fila_tb/rst
add wave -noupdate -divider fila
add wave -noupdate /fila_tb/Fila/data_out
add wave -noupdate /fila_tb/Fila/len_out
add wave -noupdate /fila_tb/Fila/dequeue_in
add wave -noupdate /fila_tb/Fila/enqueue_in
add wave -noupdate /fila_tb/Fila/data_in
add wave -noupdate /fila_tb/Fila/clk_10kHz
add wave -noupdate /fila_tb/Fila/rst
add wave -noupdate /fila_tb/Fila/is_full
add wave -noupdate /fila_tb/Fila/is_empty
add wave -noupdate /fila_tb/Fila/dequeue
add wave -noupdate -expand /fila_tb/Fila/vetores
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9999999999149 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {9999999999050 ps} {10000000000050 ps}
run 10000 ms
