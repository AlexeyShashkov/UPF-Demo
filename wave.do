onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Power
add wave -noupdate -label gnd_n /mspa_top/mspa_upf_top/mspaScope1_upf_demo/gnd_n
add wave -noupdate -label vdd_1_n /mspa_top/mspa_upf_top/mspaScope1_upf_demo/vdd_1_n
add wave -noupdate -label vdd_2_n /mspa_top/mspa_upf_top/mspaScope1_upf_demo/vdd_2_n
add wave -noupdate -label sw_vdd_2_n /mspa_top/mspa_upf_top/mspaScope1_upf_demo/sw_vdd_2_n
add wave -noupdate -divider Logic
add wave -noupdate -expand -group upf_demo:dut -divider {Test Interface}
add wave -noupdate -expand -group upf_demo:dut /tb/dut/clk
add wave -noupdate -expand -group upf_demo:dut /tb/dut/reset_n
add wave -noupdate -expand -group upf_demo:dut -radix unsigned /tb/dut/in
add wave -noupdate -expand -group upf_demo:dut /tb/dut/en
add wave -noupdate -expand -group upf_demo:dut /tb/dut/mode
add wave -noupdate -expand -group upf_demo:dut /tb/dut/mode_req
add wave -noupdate -expand -group upf_demo:dut /tb/dut/mode_ack
add wave -noupdate -expand -group upf_demo:dut -divider {Power Control Logic Outputs}
add wave -noupdate -expand -group upf_demo:dut /tb/dut/w_iso_en
add wave -noupdate -expand -group upf_demo:dut /tb/dut/w_ret_save
add wave -noupdate -expand -group upf_demo:dut /tb/dut/w_ret_restore
add wave -noupdate -expand -group upf_demo:dut /tb/dut/w_d1_sw_disable
add wave -noupdate -expand -group upf_demo:dut -divider Outputs
add wave -noupdate -expand -group upf_demo:dut /tb/dut/w_gated_clk
add wave -noupdate -expand -group upf_demo:dut -radix unsigned /tb/dut/w_out_0
add wave -noupdate -expand -group upf_demo:dut /tb/dut/w_en_delay
add wave -noupdate -expand -group upf_demo:dut /tb/dut/en_1
add wave -noupdate -expand -group upf_demo:dut -radix unsigned /tb/dut/w_out_1
add wave -noupdate -expand -group upf_demo:dut -radix unsigned /tb/dut/out
add wave -noupdate -expand -group sum_acc_1 /tb/dut/sum_acc_1/clk
add wave -noupdate -expand -group sum_acc_1 /tb/dut/sum_acc_1/reset_n
add wave -noupdate -expand -group sum_acc_1 /tb/dut/sum_acc_1/reset_n_UPF_ISO
add wave -noupdate -expand -group sum_acc_1 -radix unsigned /tb/dut/sum_acc_1/in
add wave -noupdate -expand -group sum_acc_1 -radix unsigned /tb/dut/sum_acc_1/in_UPF_ISO
add wave -noupdate -expand -group sum_acc_1 /tb/dut/sum_acc_1/en
add wave -noupdate -expand -group sum_acc_1 /tb/dut/sum_acc_1/en_UPF_ISO
add wave -noupdate -expand -group sum_acc_1 /tb/dut/sum_acc_1/en_d
add wave -noupdate -expand -group sum_acc_1 /tb/dut/sum_acc_1/en_delay
add wave -noupdate -expand -group sum_acc_1 -radix unsigned /tb/dut/sum_acc_1/acc
add wave -noupdate -expand -group sum_acc_1 -radix unsigned /tb/dut/sum_acc_1/out
add wave -noupdate -group sum_acc_0 /tb/dut/sum_acc_0/clk
add wave -noupdate -group sum_acc_0 /tb/dut/sum_acc_0/reset_n
add wave -noupdate -group sum_acc_0 /tb/dut/sum_acc_0/in
add wave -noupdate -group sum_acc_0 /tb/dut/sum_acc_0/en
add wave -noupdate -group sum_acc_0 /tb/dut/sum_acc_0/en_delay
add wave -noupdate -group sum_acc_0 /tb/dut/sum_acc_0/out
add wave -noupdate -group sum_acc_0 /tb/dut/sum_acc_0/acc
add wave -noupdate -group sum_acc_0 /tb/dut/sum_acc_0/en_d
add wave -noupdate -group mux_0 /tb/dut/mux_0/in_0
add wave -noupdate -group mux_0 /tb/dut/mux_0/in_1
add wave -noupdate -group mux_0 /tb/dut/mux_0/sel
add wave -noupdate -group mux_0 /tb/dut/mux_0/out
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/clk
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/reset_n
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/mode
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/mode_req
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/iso_en
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/ret_save
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/ret_restore
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/mode_ack
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/d1_sw_disable
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/present_state
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/next_state
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/w_iso_en
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/w_ret_save
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/w_ret_restore
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/w_mode_ack
add wave -noupdate -group power_control_0 /tb/dut/power_control_0/w_d1_sw_disable
add wave -noupdate -group clk_gate_o /tb/dut/clk_gate_0/clk_in
add wave -noupdate -group clk_gate_o /tb/dut/clk_gate_0/en_n
add wave -noupdate -group clk_gate_o /tb/dut/clk_gate_0/en_clk
add wave -noupdate -group clk_gate_o /tb/dut/clk_gate_0/clk_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {933 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 247
configure wave -valuecolwidth 122
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 20
configure wave -gridperiod 40
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1470 ns}
