VCS = vcs -full64 -sverilog -timescale=1ns/1ns \
		+v2k \
		-debug_access+all -kdb -lca\
		-f file.f\
		-fsdb +define+FSDB\
		pthread_yield_wrapper.c
comp:
	$(VCS) 

verdi:
	verdi -ssf rtl.fsdb
clean:
	rm -rf csrc simv* *.lib *.lib++ nLint*
	rm -rf *.log *.vpd *.fsdb* *.key *log rtl.fsdb*



