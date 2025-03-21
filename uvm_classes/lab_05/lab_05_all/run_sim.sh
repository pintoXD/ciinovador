irun -access +r -uvm +uvm_set_config_int="*",recording_detail,1 -coverage all -covoverwrite -DSYSTEM_CLOCK_UNITS_PER_SECOND=100 ../bvm/system_clock.c +incdir+../bvm ../bvm/*.sv *.sv +UVM_VERBOSITY=LOW

sleep 1

simvision -NOCOPYRIGHT -input simvision.svcf

sleep 1

imc -load cov_work/scope/test
