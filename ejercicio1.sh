#!/bin/bash

# Bucle infinito para mantener ejecutado el programa
while true
do
        # Limpieza previa y menú
        clear
        echo "Piedra, papel o tijera"
        echo "1.Piedra"
        echo "2.Papel"
        echo "3.Tijera"
        
        # Leer valor de usuario con un mensaje
        read -p "Seleccione una opción: " jugador
        
        # Genera 1 2 3 aleatoriamente
        maquina=$((RANDOM%3+1))
        
        # Estructura case para opción de jugador
        case $jugador in
                1)j="Piedra" ;;
                2)j="Papel" ;;
                3)j="Tijera" ;;
                *)echo "Opción no válida"; continue;;
        esac
        
        # Estructura case para opción de máquina
        case $maquina in
                1)m="Piedra" ;;
                2)m="Papel" ;;
                3)m="Tijera" ;;
        esac
        
        # Muestra opción de ambos
        echo "Jugador: $j"
        echo "Máquina: $m"
        
        # Comprobación de quién ganó
        if [ "$jugador" -eq "$maquina" ]
        then
                echo "Empate"
                
        elif [ "$jugador" -eq 1 -a "$maquina" -eq 3 ] || \
             [ "$jugador" -eq 2 -a "$maquina" -eq 1 ] || \
             [ "$jugador" -eq 3 -a "$maquina" -eq 2 ]
        then
                echo "Jugador ganó"
                
        else
                echo "Máquina ganó"
        fi
        
        # Espera de 5 minutos
        sleep 300
done
