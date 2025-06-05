onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/dequeue
add wave -noupdate /tb/enqueue
add wave -noupdate /tb/t_rst
add wave -noupdate /tb/clk_tb
add wave -noupdate -divider Top
add wave -noupdate /tb/Top/f_clk
add wave -noupdate /tb/Top/f_len_out
add wave -noupdate /tb/Top/d_ack_in
add wave -noupdate /tb/Top/d_clk
add wave -noupdate /tb/Top/d_write_in
add wave -noupdate /tb/Top/d_status_out
add wave -noupdate /tb/Top/d_data_ready
add wave -noupdate -divider Deserializador
add wave -noupdate /tb/Top/Deserializador/data_ready
add wave -noupdate -divider Fila
add wave -noupdate /tb/Top/Fila/len_out
add wave -noupdate /tb/Top/Fila/is_full
add wave -noupdate /tb/Top/Fila/is_empty
add wave -noupdate /tb/Top/Fila/dequeue
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1 us}
