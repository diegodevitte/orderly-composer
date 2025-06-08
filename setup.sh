#!/bin/bash

echo "🔁 Actualizando submódulos..."
git submodule update --init --recursive

echo "📦 Instalando dependencias en submódulos..."

for dir in orderly-*; do
  if [ -f "$dir/package.json" ]; then
    echo "📦 Instalando en $dir..."
    cd $dir
    npm install
    cd ..
  fi
done

echo "🐳 Construyendo y levantando contenedores con Docker..."
docker compose up --build
