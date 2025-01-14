#!/bin/bash

echo "
Embora tenha sido possível sintetizar os códigos do codificador e do decodificador,
não foi possível executar uma simulação com os dois módulos sintetizados ao mesmo tempo com sucesso. 
Atualmente, na seguinte simulação somente somente o codificador está sendo executado com sucesso,
mas o decodificador não executa como deveria. Para executar simulação somente com o decodificador
sintetizado, consultar o conteúdo deste script para maiores instruções.
"

sleep 5

echo "Executando sínteses e simulações..."
# Embora tenha sido possível sintetizar os códigos do codificador e do decodificador,
# não foi possível executar uma simulação com os dois módulos sintetizados ao mesmo tempo com sucesso. 
# Atualmente, na seguinte simulação somente somente o codificador está sendo executado com sucesso,
# mas o decodificador não executa como deveria.
./run_encoder.sh genus
./run_decoder.sh genus
./run_decoder.sh xrun_synth_all

# Para executar a simulação com somente o decodificador sintetizado e o codificador apenas simulado,
# basta descomentar a linha abaixo e comentar o comando ./run_decoder.sh xrun_synth_all (provavelmente presente na linha 20.)
# ./run_decoder.sh xrun_synth