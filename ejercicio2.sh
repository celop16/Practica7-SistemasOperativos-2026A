#!/bin/bash

resultado=0

# Bucle infinito
while true
do
        echo "Resultado actual: $resultado"
        
        # Lectura de los dos números
        read -p "Primer número: "  num1
        read -p "Segundo número: "  num2
        
        # Mostrar menú
        echo "1.Suma"
        echo "2.Resta"
        echo "3.Multiplicación"
        echo "4.División"
        
        # Leer la opción
        read -p "Seleccione opción: "  opcion
        
        # Estructura case para ejecutar según la opción
        case $opcion in
                1)
                        resultado=$(echo "$num1 + $num2" | bc);;
                2)
                        resultado=$(echo "$num1 - $num2" | bc);;
                3)
                        resultado=$(echo "$num1 * $num2" | bc);;
                        
                # Validación de división por cero
                4)
                        if [ $num2 -eq 0 ]
                        then
                                echo "Error, división para 0"
                        else
                                resultado=$(echo "scale=3; $num1 / $num2" | bc)
                        fi
                        ;;
                *)
                        echo "Opcion inválida"
                        ;;
        esac
        
        # Mostrar resultado
        echo "Resultado: $resultado"
        
        # Esperar 0.5 minutos
        sleep 30
done
