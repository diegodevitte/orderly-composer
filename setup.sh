#!/bin/bash

set -e

echo "🧼 Limpiando contenedores, imágenes, volúmenes y redes de Orderly..."

# Eliminar contenedores relacionados con Orderly
docker ps -a --filter "name=orderly" --format "{{.ID}}" | xargs -r docker rm -f

# Eliminar imágenes relacionadas con Orderly
docker images --format "{{.Repository}}:{{.Tag}} {{.ID}}" | grep "orderly" | awk '{print $2}' | xargs -r docker rmi -f

# Eliminar volúmenes huérfanos
docker volume prune -f

# Eliminar redes que contienen "orderly"
docker network ls --format "{{.ID}} {{.Name}}" | grep "orderly" | awk '{print $1}' | xargs -r docker network rm

echo "✅ Limpieza completada."

# Si se pasa la opción --clean-only, salimos
if [[ "$1" == "--clean-only" ]]; then
  echo "🛑 Modo limpieza solamente. Finalizando setup aquí."
  exit 0
fi

echo "🔁 Inicializando submódulos..."
git submodule update --init --recursive

echo "📦 Instalando dependencias Node.js en submódulos..."

for dir in */ ; do
  if [ -f "$dir/package.json" ]; then
    echo "📁 Instalando en $dir"
    (cd "$dir" && npm install)
  fi
done

echo "🐳 Construyendo contenedores Docker..."
docker compose build

echo "🚀 Levantando plataforma Orderly..."
docker compose up
