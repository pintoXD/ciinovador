## Arquivos enviados

O conteúdo dos arquivos enviados são os que seguem:

* `register32.sv`: Módulo que implementa um registrador de 32-bits;
* `register32_bank.sv`: Módulo que implementa um banco de registradores de 32-bits;
* `register32_bank_tb.sv`: Testbench do módulo banco de registradores de 32-bits;
* `register32_bank_tb.vcd`: Formas de onda do testbench do módulo banco de registradores;
* `ula32.sv`: Módulo que implementa uma ULA capaz de realizar operações de adição, subtração, AND bit a bit, OR bit a bit, XOR bit a bit, comparação de Menor que, deslocamento lógico para direita e esquerda e deslocamento aritmético para a direita;
* `ula32_tb.sv`: Testbench que implementa a ULA desenvolvida e citada anteriormente;
* `sign_extend_16to32.sv`: Módulo que realiza a extensão de uma palavra com sinal de 16-bits para uma palavra com sinal de 32-bits;
* `sign_extend_16to32_tb.sv`:Tesbench do módulo de extensão de palavras 16-bit para 32-bit;

### Compilação

  A fim de compilar e testar os módulos, os seguintes comandos devem ser executados individualmente:
  ```bash
    xrun -64bit register32_bank_tb.sv register32_bank.sv
    xrun -64bit ula32_tb.sv ula32.sv
    xrun -64bit sign_extend_16to32_tb.sv sign_extend_16to32.sv
  ```


## Funcionamento dos módulos construídos

### Banco de registradores de 32 bits

O módulo `register32_bank` implementa um banco de 32 registradores de 32 bits. Assim, é possível armazenar até 32 palavras de 32 bits.
Contudo, o primeiro endereço deste banco está bloqueado para escrita, deixando assim possível de se armazenar até 31 palavras de 32 bits.

Esse módulo possui as seguintes entradas:

* `we5`: Palavra de 1-bit que habilita a escrita de dados nos registradores;
* `wa5`: Palavra de 5-bits que representa o endereço do registrador em que deve ser escrito algo. Os enderços disponíveis são:
  * `5'h0`: Endereço disponível somente para leitura
  * `5'h1` a `5'h1F`: Endereço dos demais 31 registradores. Disponíveis para leitura e escrita. 
* `ra1` e `ra2`: Define o endereço dos registradores que devem ser exibidios em `rd1` e `rd2`, respectivamente.
* `wd32`: Palavra de 32 bits que deve escrita no registrador escolhido;
* `clk` : Recebe o clock para controlar as leituras e escritas nos registradores;
* `rst`: Bit de reset de todos os registradores. 

Esse módulo possui as seguintes saídas:
* `rd1` e `rd2`: Exibe o conteúdo dos registradores cujos endereços foram definidos em `ra1` e `ra2`, respectivamente. 


### Unidade Lógico-Aritmética de 32 bits
 
O módulo `ula32.sv` implementa uma unidade lógico-aritmética de 32 bits capaz de executar as operações de adição, subtração, AND, OR e XOR lógicos, deslocamentos lógicos para esquerda e direita e deslocamento arimético par a direita. Suas entradas são as apresentadas abaixo:

* `SrcA`: Palavra de 32 bits utilizada como o primeiro operando de uma operação;
* `SrcB`: Palavra de 32 bits utilizada como o segundo operando de uma operação;
* `ALUControl`: Valor de 4 bits que seleciona o tipo de operação matemática, lógica ou de comparação a ser realizada. As seguintes combinações são possíveis:
  * `0000`: Adição de `SrcA` e `SrcB`.
  * `0001`: Subtração de `SrcA` e `SrcB`.
  * `0010`: AND de `SrcA` e `SrcB`.
  * `0011`: OR de `SrcA` e `SrcB`.
  * `0100`: XOR de `SrcA` e `SrcB`.
  * `0101`: Comparação de menor que entre `SrcA` e `SrcB`. Se `SrcA` < `SrcB`, a saída da ULA é configurada para 32'bFFFFFFFF.
  * `0110`: Deslocamente Lógico a Esquerda de `SrcA` em `SrcB` posições.
  * `0111`: Deslocamento Artimético a Direita de `SrcA` em `SrcB` posições.
  * `1000`: Deslocamente Lógico a Direita de `SrcA` em `SrcB` posições.

As saídas desse módulo são:

* `ALUResult`: Valor de 32 bits resultado da operação realizada entre as palavras `SrcA` e `SrcB`;
* `FlagZ`: Valor de 1 bit. Se `ALUResult` for igual a `32'b00`, `FlagZ` é igual a 1. Do contrário, `FlagZ` é igual a 0;

### Extensor de palavras de 16 para 32 bits

O módulo `sign_extend_16to32.sv` implementa a funcionalidade de tranformar uma palavra com sinal de 16 bits, para uma palavra com sinal de 32 bits. 
Possui como `in_word` como entrada única e recebe uma palavra de 16 bits como entrada. 
Possui uma única saída `out_word` de 32 bits. 

Dessa forma, o sinal da palavra de 16 bits dada na entrada é preservado na transformação para uma palavra de 32 bits.

## Testbenchs

Cada um dos módulos previamente apresentados possui um testbench único para cada módulo, como descrito no início deste README.

