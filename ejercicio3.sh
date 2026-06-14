#!/bin/bash

# Funcion para crear directorio
crear_directorio() {
        #Leer ruta y nombre
        
        read -p "Ruta para crear el directorio: " ruta
        read -p "Nombre del directorio: " nombre
        
        # Valida ruta
        if [ -d "$ruta" ]; then
                mkdir -p "$ruta/$nombre"
                echo "Directorio '$nombre' creado en '$ruta'"
        else
                echo "Error, la ruta no existe"
        fi
}

# Funcion para crear archivo
crear_archivo() {
        read -p "Ruta para crear el archivo: " ruta
        read -p "Nombre del archivo: " nombre
        
        # Valida ruta
        if [ -d "$ruta" ]; then
                touch "$ruta/$nombre"
                echo "Archivo '$nombre' creado en '$ruta'"
        else
                echo "Error, la ruta no existe"
        fi
}

# Funcion para borrar archivo
borrar_archivo() {
        read -p "Ruta para borrar el archivo: " ruta
        read -p "Nombre del archivo que desea borrar: " nombre
        
        # Valida que el archivo existe
        if [ -f "$ruta/$nombre" ]; then
                rm "$ruta/$nombre"
                echo "Archivo '$nombre' eliminado correctamente"
        else
                echo "Error, el archivo no existe"
        fi
}

# Funcion para listar directorio
listar_directorio() {
        read -p "Directorio que desea listar: " ruta
        
        # Valida la ruta
        if [ -d "$ruta" ]; then
                echo "Contenido de '$ruta'"
                ls "$ruta"
        else
                echo "Error, el directorio no existe"
        fi
}

# Funcion para buscar archivo
buscar_archivo() {
        read -p "Ruta donde desea buscar: " ruta
        read -p "Nombre del archivo: " nombre
        
        # Valida ruta
        if [ -d "$ruta" ]; then
                echo "Buscando archivos"
                
                # Guarda la búsqueda en la variable
                resultado=$(find "$ruta" -type f -name "$nombre")
                # Verifica si la variable está vacía
                if [ -z "$resultado" ]; then
                        echo "No se encontró el archivo"
                else
                        echo "Archivo(s) encontrado(s):"
                        echo $resultado
                fi
        else
                echo "Error, la ruta no existe"
        fi
}

# Bucle infinito
while true
do
        # Mostrar menú
        echo "----Menú----"
        echo "1. Crear un directorio"
        echo "2. Crear un archivo"
        echo "3. Borrar un archivo"
        echo "4. Listar un directorio"
        echo "5. Buscar un archivo"
        echo "6. Limpiar pantalla"
        echo "7. Salir"
        
        # Leer la opcion
        read -p "Seleccione una opción: " opcion
        
        # Estructura case para ejecutar la función correspondiente
        case $opcion in
                1)
                        crear_directorio;;
                2)
                        crear_archivo;;
                3)
                        borrar_archivo;;
                4)
                        listar_directorio;;
                5)
                        buscar_archivo;;
                6)
                        clear
                        echo "Pantalla limpia";;
                7)
                        echo "Saliendo"
                        exit 0;;
                *)
                        echo "Opción no válida, intente de nuevo";;
        esac
        
        # Espera de 10 minutos
        sleep 600
done
