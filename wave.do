onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -label dequeue /tb/dequeue
add wave -noupdate -label enqueue /tb/enqueue
add wave -noupdate -label bit_in /tb/bit_in
add wave -noupdate -label clk /tb/clk_tb
add wave -noupdate -divider Top
add wave -noupdate -label dequeue /tb/Top/dequeue
add wave -noupdate -label enqueue /tb/Top/enqueue
add wave -noupdate -label bit_in /tb/Top/bit_in
add wave -noupdate -label clk /tb/Top/clk_tb
add wave -noupdate -label data_out /tb/Top/f_data_out
add wave -noupdate -label data_in /tb/Top/f_data_in
add wave -noupdate -label f_clk /tb/Top/f_clk
add wave -noupdate -label len_out /tb/Top/f_len_out
add wave -noupdate -label data_out /tb/Top/d_data_out
add wave -noupdate -label data_in /tb/Top/d_data_in
add wave -noupdate -label ack_in /tb/Top/d_ack_in
add wave -noupdate -label d_clk /tb/Top/d_clk
add wave -noupdate -label d_write_in /tb/Top/d_write_in
add wave -noupdate -label d_status_out /tb/Top/d_status_out
add wave -noupdate -label d_data_ready /tb/Top/d_data_ready
add wave -noupdate -label d_full /tb/Top/d_full
add wave -noupdate -label d_lixo /tb/Top/lixo
add wave -noupdate -label d_temp /tb/Top/temp
add wave -noupdate -label t_data_in /tb/Top/t_data_in
add wave -noupdate -divider Deserializador
add wave -noupdate -label status_out /tb/Top/Deserializador/status_out
add wave -noupdate -label data_out /tb/Top/Deserializador/data_out
add wave -noupdate -label data_ready /tb/Top/Deserializador/data_ready
add wave -noupdate -label ack_in /tb/Top/Deserializador/ack_in
add wave -noupdate -label write_in /tb/Top/Deserializador/write_in
add wave -noupdate -label data_in /tb/Top/Deserializador/data_in
add wave -noupdate -label clk /tb/Top/Deserializador/clk_100kHz
add wave -noupdate -label rst /tb/Top/Deserializador/rst
add wave -noupdate -label full /tb/Top/Deserializador/full
add wave -noupdate -label data_temp /tb/Top/Deserializador/data_temp
add wave -noupdate -divider Fila
add wave -noupdate -label data_out /tb/Top/Fila/data_out
add wave -noupdate -label len_out /tb/Top/Fila/len_out
add wave -noupdate -label dequeue_in /tb/Top/Fila/dequeue_in
add wave -noupdate -label enqueue_in /tb/Top/Fila/enqueue_in
add wave -noupdate -label data_in /tb/Top/Fila/data_in
add wave -noupdate -label clk /tb/Top/Fila/clk_10kHz
add wave -noupdate -label rst /tb/Top/Fila/rst
add wave -noupdate -label is_full /tb/Top/Fila/is_full
add wave -noupdate -label is_empty /tb/Top/Fila/is_empty
add wave -noupdate -label dequeue_pos_clk /tb/Top/Fila/dequeue
add wave -noupdate -label vetores /tb/Top/Fila/vetores
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {60952381 ps} 0}
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
configure wave -timelineunits ns
update
WaveRestoreZoom {9875481600 ns} {10006553600 ns}
