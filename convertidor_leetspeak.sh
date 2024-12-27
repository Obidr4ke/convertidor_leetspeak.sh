#!/bin/bash

# Diccionario a formato 1337 - Script reutilizable para generar diccionarios en formato bÃ¡sico o extendido de Leetspeak
# Autor: [Tu Nombre]
# VersiÃ³n: 1.0

# Verificar que se haya proporcionado un archivo de entrada
if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <archivo_diccionario>"
  echo "Ejemplo: $0 diccionario.txt"
  exit 1
fi

# Archivos de entrada y salida
file_input="$1"
file_output="diccionario_1337.txt"
temp_file="temp_1337.txt"

# Verificar que el archivo de entrada exista y no estÃ© vacÃ­o
if [ ! -s "$file_input" ]; then
  echo "Error: El archivo de entrada '$file_input' no existe o estÃ¡ vacÃ­o."
  exit 1
fi

# FunciÃ³n: aplicar transformaciones bÃ¡sicas a formato 1337
apply_basic_leetspeak() {
  sed -e 's/a/4/g' \
      -e 's/e/3/g' \
      -e 's/i/1/g' \
      -e 's/l/1/g' \
      -e 's/o/0/g' \
      -e 's/s/5/g' \
      -e 's/t/7/g' \
      "$1"
}

# Transformar palabras al formato 1337 bÃ¡sico
apply_basic_leetspeak "$file_input" > "$temp_file"

# Combinar el archivo original y el archivo transformado, eliminando duplicados y normalizando
cat "$file_input" "$temp_file" | tr '[:upper:]' '[:lower:]' | sort | uniq > "$file_output"

# Limpiar archivo temporal
rm "$temp_file"

# Mostrar Ã©xito
echo "El diccionario en formato 1337 fue guardado en: $file_output"

# Sugerencias para futuras extensiones (descomentar para aÃ±adir funcionalidades):
# - AÃ±adir transformaciones extendidas (mÃ¡s reglas de leetspeak):
# sed -e 's/b/8/g' -e 's/z/2/g' -e 's/g/9/g'
# - Incluir nÃºmeros, caracteres especiales o reglas personalizadas.
# - Automatizar mÃºltiples niveles de leetspeak (bÃ¡sico, extendido, personalizado).
# - Permitir especificar el archivo de salida como argumento opcional.