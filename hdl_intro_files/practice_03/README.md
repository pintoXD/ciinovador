## Arquivos enviados

O conteúdo dos arquivos enviados são os que seguem:

* `register8.sv`: Módulo que implementa um registrador de 8-bits;
* `register8_tb.sv`: Testbench para o registrador de 8-bits;
* `register8_bank.sv`: Módulo que implementa um banco de registradores de 8-bits;
* `register8_bank_tb.sv`: Testbench do banco de registradores de 8-bits.

## Funcionamento do módulo  `register8_bank`

O módulo `register8_bank` implementa um conjunto de oito módulos `register8`, formando assim um conjunto de oito registradores de oito bits.
Cada um desses registradores possui um endereço específico definido nos requisitos da atividade.

Esse módulo possui as seguintes entradas:
* `we3`: Habilita a escrita de dados nos registradores;
* `wa3`: Endereço do registrador em que deve ser escrito algo;
* `wd3`: Palavra de 8 bits que deve escrita no registrador escolhido;
* `ra1` e `ra2`: Define o endereço dos registradores que devem ser exibidios em `rd1` e `rd2`, respectivamente.
* `clk` : Recebe o clock para controlar as leituras e escritas nos registradores;
* `rst`: Bit de reset de todos os registradores. 

Esse módulo possui as seguintes saídas:
* `rd1` e `rd2`: Exibe o conteúdo dos registradores cujos endereços foram definidos em `ra1` e `ra2`, respectivamente. 


Assim, quando uma palavra precisa ser armazenada, é preciso informar o endereço de algum dos sete registradores disponíveis, haja visto que o registrador X0 não está disponível para escrita seguindo a definição da atividade. Em seguida, deve ser fornecida a palavra a ser escrita. 

Para visualização da palavra escrita, é preciso fornecer o endereço de um determinado registrador para que seu conteúdo seja exibido em uma das duas saídas disponíveis no banco de registradores. 

## Testbench

O testebench criado para o banco de registradores está dividido em três conjuntos de testes e cobre todas as funcionalidades implementadas do módulo criado.


