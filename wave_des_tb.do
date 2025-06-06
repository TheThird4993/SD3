onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix binary /des_tb/d_data_out
add wave -noupdate /des_tb/d_data_in
add wave -noupdate /des_tb/d_ack_in
add wave -noupdate /des_tb/d_write_in
add wave -noupdate /des_tb/d_status_out
add wave -noupdate /des_tb/d_data_ready
add wave -noupdate /des_tb/clk
add wave -noupdate /des_tb/rst
add wave -noupdate -divider deserializador
add wave -noupdate -label status_out /des_tb/Deserializador/status_out
add wave -noupdate -label data_out -radix binary /des_tb/Deserializador/data_out
add wave -noupdate -label data_ready /des_tb/Deserializador/data_ready
add wave -noupdate -label ack_in /des_tb/Deserializador/ack_in
add wave -noupdate -label write_in /des_tb/Deserializador/write_in
add wave -noupdate -label data_in /des_tb/Deserializador/data_in
add wave -noupdate -label clk /des_tb/Deserializador/clk_100kHz
add wave -noupdate -label rst /des_tb/Deserializador/rst
add wave -noupdate -label {is full} /des_tb/is_full
add wave -noupdate -radix binary -expand /des_tb/Deserializador/data_temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {34460244 ns} 0}
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
WaveRestoreZoom {1501926400 ns} {2026214400 ns}
