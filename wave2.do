onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/clk
add wave -noupdate /tb/rst
add wave -noupdate /tb/bit_in
add wave -noupdate -radix binary /tb/fila_len
add wave -noupdate -divider Top
add wave -noupdate /tb/top_inst/clk
add wave -noupdate /tb/top_inst/rst
add wave -noupdate /tb/top_inst/bit_in
add wave -noupdate -radix binary /tb/top_inst/fila_len
add wave -noupdate -radix binary /tb/top_inst/byte_from_des
add wave -noupdate /tb/top_inst/data_ready
add wave -noupdate /tb/top_inst/fila_enqueue
add wave -noupdate -radix binary /tb/top_inst/fila_data_in
add wave -noupdate -radix binary /tb/top_inst/fila_len_s
add wave -noupdate -divider Deserializador
add wave -noupdate /tb/top_inst/Deserializador_inst/status_out
add wave -noupdate -radix binary /tb/top_inst/Deserializador_inst/data_out
add wave -noupdate /tb/top_inst/Deserializador_inst/data_ready
add wave -noupdate /tb/top_inst/Deserializador_inst/ack_in
add wave -noupdate /tb/top_inst/Deserializador_inst/write_in
add wave -noupdate /tb/top_inst/Deserializador_inst/data_in
add wave -noupdate /tb/top_inst/Deserializador_inst/clk_100kHz
add wave -noupdate /tb/top_inst/Deserializador_inst/rst
add wave -noupdate /tb/top_inst/Deserializador_inst/full
add wave -noupdate -radix binary /tb/top_inst/Deserializador_inst/data_temp
add wave -noupdate -divider Fila
add wave -noupdate -radix binary /tb/top_inst/Fila_inst/data_out
add wave -noupdate -radix binary /tb/top_inst/Fila_inst/len_out
add wave -noupdate /tb/top_inst/Fila_inst/dequeue_in
add wave -noupdate /tb/top_inst/Fila_inst/enqueue_in
add wave -noupdate -radix binary /tb/top_inst/Fila_inst/data_in
add wave -noupdate /tb/top_inst/Fila_inst/clk_10kHz
add wave -noupdate /tb/top_inst/Fila_inst/rst
add wave -noupdate /tb/top_inst/Fila_inst/is_full
add wave -noupdate /tb/top_inst/Fila_inst/is_empty
add wave -noupdate /tb/top_inst/Fila_inst/dequeue
add wave -noupdate -radix binary -childformat {{/tb/top_inst/Fila_inst/vetores(0) -radix binary} {/tb/top_inst/Fila_inst/vetores(1) -radix binary} {/tb/top_inst/Fila_inst/vetores(2) -radix binary} {/tb/top_inst/Fila_inst/vetores(3) -radix binary} {/tb/top_inst/Fila_inst/vetores(4) -radix binary} {/tb/top_inst/Fila_inst/vetores(5) -radix binary} {/tb/top_inst/Fila_inst/vetores(6) -radix binary} {/tb/top_inst/Fila_inst/vetores(7) -radix binary}} -expand -subitemconfig {/tb/top_inst/Fila_inst/vetores(0) {-radix binary} /tb/top_inst/Fila_inst/vetores(1) {-radix binary} /tb/top_inst/Fila_inst/vetores(2) {-radix binary} /tb/top_inst/Fila_inst/vetores(3) {-radix binary} /tb/top_inst/Fila_inst/vetores(4) {-radix binary} /tb/top_inst/Fila_inst/vetores(5) {-radix binary} /tb/top_inst/Fila_inst/vetores(6) {-radix binary} /tb/top_inst/Fila_inst/vetores(7) {-radix binary}} /tb/top_inst/Fila_inst/vetores
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {573222 ns} 0}
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
WaveRestoreZoom {513600 ns} {1025600 ns}
