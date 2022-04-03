#!/bin/bash

# Variables
opcion=
ASMTOCPP=./ensamblador/asm_to_binary.cpp

# Funciones
usage()
{
  echo usage
}

compilation()
{
  iverilog -o cpu_base cpu_tb.v alu.v cd.v componentes.v cpu.v memprog.v uc.v pila.v transceiver.v
  vvp cpu_base
}

gtkwave()
{
  gtkwave cpu_tb.vcd
}

assembly_toCPP()
{
  g++ $ASMTOCPP -o ./bin/asm_to_binary
}



while [ "$1" != "" ]; do
  case $1 in
    -h | --help )
      usage
      echo
      exit 0
    ;;
    -c | --comp )
      compilation
    ;;
    -g | --gtkwave )
      gtkwave
    ;;
    -ac | --assToCpp )
      assembly_toCPP
    ;;
    *)
      error_exit "${TEXT_BOLD}${TEXT_RED}La opción introducida no está disponible${TEXT_RESET}"
  esac
  shift
done