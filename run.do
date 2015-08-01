
vlog -novopt -sv ./src/upf_demo.sv
vlog -novopt -sv ./src/tb.sv

vopt upf_demo \
    -pa_upf ./src/upf_demo.upf \
    -pa_prefix "/tb/" \
    -pa_replacetop "dut" \
    -pa_enable=highlight \
    -pa_checks=i+r+p+cp+s+uml \
    -pa_enable=nonoptimizedflow \
    -o discard_opt

vsim tb \
    -novopt \
    +nowarnTSCALE \
    +nowarnTFMPC \
    -L mtiPA \
    -pa \
    -l rtl.log \
    -wlf rtl.wlf \
    -assertdebug \
    +notimingchecks \
    -pa_highlight \
    -do ./wave.do

run 1400
