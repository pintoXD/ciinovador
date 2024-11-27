## Arquivos enviados

O conteúdo dos arquivos enviados são os que seguem:

* `register8.sv`: Módulo que implementa um registrador de 8-bits;
* `register8_bank.sv`: Módulo que implementa um banco de registradores de 8-bits;
* `muxULAsrc.sv`: Módulo que implementa um multiplexador para duas entradas de 8-bits;
* `muxULAsrc_tb.sv`: Testbench do módulo multiplexador citado anteriormente;
* `custom_ula.sv`: Módulo que implementa uma ULA capaz de realizar operações de adição, subtração, AND bit a bit, OR bit a bit e comparação de Menor que.
* `custom_ula_tb.sv`: Testbench que implementa a ULA desenvolvida e citada anteriormente;
* `datapath101.sv`: Módulo que implementa um datapah à partir da junção dos módulos `register8_bank`, `muxULAsrc.sv` e `custom_ula`;
* `datapath101_tb.sv`: Testbench do módulo datapath citado anteriormente. 
* `datapath101_tb.vcd`: Arquivo de formas de onda do módulo `datapath101`. 

## Funcionamento do módulo  `datapath101`

O módulo `datapath101` implementa um datapath ao unir o banco de registradores de 8 bits, a ULA personalizada criada e o multiplexador de duas palavras de 8 bits. 

O módulo `datapath101` é então composto de módulos menores presentes no projeto. 

Os módulos mux, ULA foram testados individualmente a fim de garantir o correto funcionamento do módulo `datapath` após a integração desses módulos com o módulo do banco de registradores de 8-bits. 


Dessa forma, o módulo `datapath101` é capaz de armazenar 8 conjuntos de palavras de 8 bits, cada palavra em um registrador único e que pode ser acessado a partir de um endereço específico definido anteriormente. Além disso, por meio das entradas de controle desse módulo, é possível realizar as operações matemáticas de adição e subtração, as operações lógicas de AND e OR bit a bit e a operação de comparação Menor Que, com os valores presentes nos registradores.


Esse módulo possui as seguintes entradas:
* `we3`: Habilita a escrita de dados nos registradores;
* `wa3`: Endereço do registrador em que deve ser escrito algo. Os enderços disponíveis são:
  * `000`: Registrador X0 (Disponível somente para **leitura**) 
  * `001`: Registrador X1 (Disponível para leitura e escrita) 
  * `010`: Registrador X2 (Disponível para leitura e escrita)
  * `011`: Registrador X3 (Disponível para leitura e escrita) 
  * `100`: Registrador X4 (Disponível para leitura e escrita) 
  * `101`: Registrador X5 (Disponível para leitura e escrita)
  * `110`: Registrador X6 (Disponível para leitura e escrita)
  * `111`: Registrador X7 (Disponível para leitura e escrita) 
* `wd3`: Palavra de 8 bits que deve escrita no registrador escolhido;
* `ra1` e `ra2`: Define o endereço dos registradores que devem ser utilizados para as operações matetmáticas, lógicas ou de comparação. `ra1` representa o primeiro operando e `ra2` representa o segundo operando.
* `constante`: Valor constante de 8-bits que pode ser fornecido para realizar uma operação matemática. Esse valor substitui o valor do operando `ra2` quando selecionado, fazendo com que a operação escolhida seja feita entre `ra1` e `constante`;
* `ULAControl`: Valor de 3 bits que seleciona o tipo de operação matemática, lógica ou de comparação a ser realizada. As seguintes combinações são possíveis:
  * `000`: Adição de `ra1` e `ra2` ou adição de `ra1` e `constante`.
  * `001`: Subtração de `ra1` e `ra2` ou Subtração de `ra1` e `constante`.
  * `010`: AND de `ra1` e `ra2` ou AND de `ra1` e `constante`.
  * `011`: OR de `ra1` e `ra2` ou OR de `ra1` e `constante`.
  * `101`: SLT de `ra1` e `ra2` ou SLT de `ra1` e `constante`.
* `select_src`: Bit que selecionado qual será o segundo operando nas para as operações matemáticas. Se `1`, o valor presente em constante será utilizado. Se `0`, o valor presente em `ra2` será usado.
* `clk` : Recebe o clock para sincronizar a operação dos registradores;
* `rst`: Bit de reset de todos os registradores. 

Esse módulo possui as seguintes saídas:
* `ULAResult`: Valor em 8-bits que representa o resultado da operação matemática, lógica ou de comparação escolhida;
* `FlagZ`: Flag de 1-bit que informa se o valor presente em `ULAResult` é composto totalmente de 0's ou 1's. Se a palavra for totalmente composta de `0s`, `FlagZ` será `1`. Do contrário, `FlagZ` será `0`.

## Testbench

O testebench criado para o banco de registradores está dividido em seis conjuntos de testes e cobre todas as funcionalidades implementadas do módulo criado.


