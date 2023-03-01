#!/bin/bash

opcion=

func_help()
{
    echo "Uso: ./compilation.sh [opciones]"
    echo "Opciones:"
    echo "  -d, --default    Compila y ejecuta el programa"
    echo "  -h, --help       Muestra esta ayuda"
    echo "  -r, --remove     Elimina los archivos cpu_base y cpu_tb.vcd"
    shift
}

func_default()
{
    iverilog -o cpu_base cpu_tb.v alu.v cd.v componentes.v cpu.v memprog.v uc.v
    vvp cpu_base

    echo
    echo
    echo -n "¿Quieres ejecutar el GTKWAVE? [Y/n]: "
    read opcion

    if [ "$opcion" == "y" ] || [ "$opcion" == "Y" ] ; then
        gtkwave cpu_tb.vcd &
    elif [ "$opcion" == "n" ] || [ "$opcion" == "N" ]; then
        echo
        echo "No se ha abierto el GTKWAVE"
    else
        exit 0
    fi
}

if [ "$1" == "" ]; then
    func_default
else 
    while [ "$1" != "" ]; do
        case $1 in
            -d | --default )
                func_default
                shift
                ;;
            -h | --help )
                func_help
                shift
                ;;
            -r | --remove )
                rm cpu_base cpu_tb.vcd
                shift
                ;;
            * )
                echo "Opción no válida"
                ;;
        esac
    done
fi