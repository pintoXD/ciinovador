irun -access +r -uvm +uvm_set_config_int="*",recording_detail,1 +define+BVM_ASSERT_BEGIN_TR=void\' +incdir+../bvm ../bvm/*.sv *.sv +UVM_VERBOSITY=LOW

sleep 1

simvision -NOCOPYRIGHT -input simvision.svcf

sleep 1

imc -load cov_work/scope/test
