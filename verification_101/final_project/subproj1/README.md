Neste arquivo estão compactados o módulo ALU fornecido para verificação, juntamente com os testbenchs
solicitados para realização do subprojeto número 1.

Os arquivos presentes são os que seguem:

* `alu.sv`: Design de ALU fornecida
* `alu_simple_tb.sv`: Testbench simples sem verificações automatizadas
* `alu_auto_tb.sv`: Testbench com verificações automatizadas sem utilização de vetores de teste
* `alu_testvectors_tb.sv`: Testbench com verificações automatizadas e com utilização de vetores de teste. 
Depende do arquivo `data2.tv` presente no mesmo diretório desse arquivo para execução correta dos testes;
* `data2.tv`: Vetores de teste utilizados para verificação no testbench `alu_testvectors_tb.sv`. 