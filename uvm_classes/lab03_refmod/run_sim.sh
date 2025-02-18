irun -access +r -uvm +uvm_set_config_int="*",recording_detail,1 +define+BVM_ASSERT_BEGIN_TR=void\' +incdir+./bvm ./bvm/*.sv *.sv +UVM_VERBOSITY=LOW

sleep 1

simvision -NOCOPYRIGHT -input simvision.svcf
