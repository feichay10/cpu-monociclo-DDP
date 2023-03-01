#!/bin/bash

opcion=

iverilog -o cpu_base cpu_tb.v alu.v cd.v componentes.v cpu.v memprog.v uc.v
vvp cpu_base

echo
echo
echo -n "¿Quieres ejecutar el GTKWAVE? [Y/n]: "
read opcion

if [ "$opcion" == "y" ] || [ "$opcion" == "Y" ] ; then
    gtkwave cpu_tb.vcd
elif [ "$opcion" == "n" ] || [ "$opcion" == "N" ]; then
    echo
    echo "No se ha abierto el GTKWAVE"
else
    exit 0
fi