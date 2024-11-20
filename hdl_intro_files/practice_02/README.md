## Arquivos enviados

O conteúdo dos arquivos enviados são os que seguem:

* `shift_reg_op.sv`: Módulo registrador de deslocamento com entradas e saídas seriais e paralelas
* `shift_reg_op_tb.sv`: Testbench do módulo registrador de deslocamento, com 15 casos de teste.
* `shiftreg_op_tb_out.txt`: Saída em modo texto do testbench do módulo registrador de deslocamento para cada um dos casos de teste elaborados.
* `shiftreg_dump.vcd`: Arquivo VCD contendo as formas de onda resultantes da execução do testbench do módulo registrador de deslocamento.
* `shift_reg_op_waveforms.png`: Captura de tela das formas de onda resultantes da execução da simulação.

## Funcionamento do módulo  `shift_reg_op`

O módulo projetado funciona seguindo os critérios de comando estabelecidos na atividade. 

O módulo possui carregamento paralelo de uma palavra e realiza deslocamentos serial e paralelo simultaneamente. 

Quando a palavra é carregada e o comando OP de deslocamento é recebido, a saída do módulo realiza o deslocamento da palavra
recebida a cada pulso de clock na entrada `enable` do módulo. Se for escolhido o deslocamento para a esquerda, tem-se as duas saídas mudando de estado: A saída 
em paralelo do módulo e a saída em série do módulo.

O módulo possui um tipo de saída paralela e dois tipos de saída serial. A saída paralela `q` exibe os bits em paralelo da palavra carregada estando eles deslocados ou não.
Já as saídas em série se dividem no seguinte:
* `shift_out_left` : Saída serial quando do deslocamento para a esquerda. Esta deve ser ignorada durante o deslocamento para a direita.
* `shift_out_right` : Saída serial quando do deslocamento para a direita. Esta deve ser ignorada durante o deslocamento para a esquerda.


De acordo com o solicitado, o módulo foi projetado para suportar os seguints comandos `OP`:
* `00`: Não faz nada;
* `01`: Deslocamento serial e paralelo para a esquerda
* `10`: Deslocamento serial e paralelo para a direita
* `11`: Carrega uma nova palavra de maneira paralela