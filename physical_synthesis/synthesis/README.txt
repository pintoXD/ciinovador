# Script Run First

Este script é usado para gerenciar e executar várias tarefas relacionadas à síntese e simulação do design `multiplier32FP`. Ele fornece opções para limpar diretórios de trabalho, criar arquivos de teste e executar simulações usando o XCELIUM.

## Uso

```sh
./run_first.sh <arg1>
```

### Argumentos

- `-xrun_raw`: Executa a simulação HDL bruta usando o XCELIUM.
- `-xrun_compiled`: Executa a simulação do netlist compilado usando o XCELIUM.
- `-xrun_sdf`: Executa a simulação com anotação SDF usando o XCELIUM.
- `-genus`: Executa a ferramenta de síntese Genus.
- `-innovus`: Executa a ferramenta de colocação e roteamento Innovus.
- `-clear_work`: Limpa os diretórios de trabalho.
- `-touch_work`: Cria arquivos de teste nos diretórios de trabalho.

## Variáveis de Ambiente

- `DESIGNS`: O nome do design atual (padrão: `multiplier32FP`).
- `USER`: O nome do usuário nesta máquina.
- `PROJECT_DIR`: O diretório de trabalho atual.
- `BACKEND_DIR`: O diretório de backend (`${PROJECT_DIR}/backend`).
- `FRONTEND_DIR`: O diretório de frontend (`${PROJECT_DIR}/frontend`).
- `TECH_DIR`: O diretório de tecnologia (padrão: `/home/tools/cadence/gpdk`).
- `HDL_NAME`: O nome HDL (padrão: `${DESIGNS}`).
- `VLOG_LIST`: A lista de arquivos Verilog para o design.
- `LIB_DIR`: O diretório da biblioteca para arquivos de temporização.
- `LIB_VERILOG_FILES`: O diretório da biblioteca para arquivos Verilog.

## Detalhes do Script

### Limpando Diretórios de Trabalho

```sh
if [ $1 == "-clear_work" ]; then
    rm -r ${PROJECT_DIR}/backend/synthesis/work/*
    rm -r ${PROJECT_DIR}/backend/layout/work/*
fi
```

### Criando Arquivos de Teste

```sh
if [ $1 == "-touch_work" ]; then
    touch ${PROJECT_DIR}/frontend/work/teste.txt
    touch ${PROJECT_DIR}/backend/synthesis/work/teste.txt
    touch ${PROJECT_DIR}/backend/layout/work/teste.txt
fi
```

### Executando Simulação HDL Bruta

```sh
if [ $1 == "-xrun_raw" ]; then
    cd ${PROJECT_DIR}/frontend/work
    xrun -timescale 1ns/10ps -64bit ${FRONTEND_DIR}/${DESIGNS}.sv ${FRONTEND_DIR}/${DESIGNS}_tb.sv -top ${DESIGNS}_tb -access +rwc
fi
```

### Executando Simulação do Netlist Compilado

```sh
if [ $1 == "-xrun_compiled" ]; then
    cd ${PROJECT_DIR}/frontend/work
    # Adicione seu comando de simulação do netlist compilado aqui
fi
```

### Executando Simulação com Anotação SDF

```sh
if [ $1 == "-xrun_sdf" ]; então
    cd ${PROJECT_DIR}/frontend/work
    # Adicione seu comando de simulação com anotação SDF aqui
fi
```

### Executando Síntese com Genus

```sh
if [ $1 == "-genus" ]; então
    cd ${PROJECT_DIR}/backend/synthesis/work
    # Adicione seu comando de síntese com Genus aqui
fi
```

### Executando Colocação e Roteamento com Innovus

```sh
if [ $1 == "-innovus" ]; então
    cd ${PROJECT_DIR}/backend/layout/work
    # Adicione seu comando de colocação e roteamento com Innovus aqui
fi
```

## Notas

- Certifique-se de que as ferramentas necessárias (XCELIUM, Genus, Innovus) estejam instaladas e acessíveis no seu ambiente.
- Modifique o script conforme necessário para atender aos requisitos específicos do seu projeto.


Este arquivo `README.md` fornece uma descrição detalhada do script `run_first.sh`, incluindo seu uso, variáveis de ambiente e a funcionalidade de cada argumento.
Este arquivo `README.md` fornece uma descrição detalhada do script `run_first.sh`, incluindo seu uso, variáveis de ambiente e a funcionalidade de cada argumento.
