# compile
test_cpu.out : cpu.v alu.v pc.v decoder.v data_selector.v register.v rom.v test_cpu.v
	iverilog -o $@ $^

# execute simulation
run : test_cpu.out
	vvp $<

gtk : test_cpu.vcd
	open -a /Applications/gtkwave.app $<

clean :
	rm -rf test_cpu.vcd

.PHONY : run clean gtk
