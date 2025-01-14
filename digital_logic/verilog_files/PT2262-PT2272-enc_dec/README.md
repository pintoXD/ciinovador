## Organização da árvore de arquivos deste projeto

* **encoder/**: Possui o código-fonte codificador_pt2262.sv relativo a implementação do codificador solicitado, em System Verilog. Nesta pasta há também o testbench para esse codificador;

* **decoder/**: Possui o código-fonte decodificador_pt2272.sv relativo a implementação do decodificador solicitado, em System Verilog. Nesta pasta há também o testbench para esse decodificador;

* **addr_interpreter/**: Contém um módulo que implementa o módulo de simulação comp_endereco.sv fornecido no projeto.
* **bidir_shift_register/**: Módulo que implementa um registrador de deslocamento bidirecional em que são armazenados os dados recebidos.
* **bit_gen/**: Módulo gerador de bits, que gera as formas de onda que são solicitadas. Esse módulo é usado pelo módulo codificador.
* **oscillator/**: Módulo que implementa o divisor de clock solicitado na descrição do projeto e utilizado nos módulos codificador e decodificador.
* **scripts/**: Possui os scripts tcl necessários para sintetização dos códigos do codificador e do decodificador. `encoder_synth.tcl` refere-se ao tcl sintetizador do codificador. `decoder_synth.tcl` refere-se ao sintetizador do decodificador. 
* **reports/**: Arquivos de relatório gerados durante a sintetização com Genus. Os arquivos no padrão `encoder_*.txt` representam os relatórios de síntese do codificador. Já os arquivos no padrão  `decoder_*.txt` representam os relatórios de síntese do decodificador.