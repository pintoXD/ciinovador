export DESIGNS="sequential";# put here the name of current design
export USER=$USER;# put here YOUR user name at this machine
#export PROJECT_DIR=/home/${USER}/projetos/${DESIGNS}
export BACKEND_DIR=${PROJECT_DIR}/backend
#export TECH_DIR=/home/tools/design_kits/cadence/GPDK045 ;# technology dependent
export TECH_DIR=/home/tools/cadence/gpdk/gsclib045_svt_v4.4/lan/flow/t1u1/reference_libs/GPDK045/;# technology dependent
export HDL_NAME=${DESIGNS}
#
#module add cdn/genus/genus211 		;# GENUS
#module add cdn/xcelium/xcelium2209 	;# XCELIUM
#module add cdn/innovus/innovus211 	;# INNOVUS
#module add cdn/ic/ic231 		;# VIRTUOSO
#module add cdn/assura/assura41 		;# ASSURA


# Para executar o GENUS
cd ${PROJECT_DIR}/backend/synthesis/work/
# apenas o programa
genus -abort_on_error -lic_startup Genus_Synthesis -lic_startup_options Genus_Physical_Opt -log genus -overwrite
# programar e carregar script para síntese automatizada
#genus -abort_on_error -lic_startup Genus_Synthesis -lic_startup_options Genus_Physical_Opt -log genus -overwrite -files ${PROJECT_DIR}/backend/synthesis/scripts/${DESIGNS}.tcl


