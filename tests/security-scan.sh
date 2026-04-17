#!/bin/bash

echo "-------------------------------------------------------"
echo "🛡️  INICIANDO ESCANEO DE SEGURIDAD OPERATIVA 🛡️"
echo "-------------------------------------------------------"

# 1. Auditoría de dependencias de Node.js
echo "🔍 Revisando vulnerabilidades en librerías (NPM Audit)..."
cd api && npm audit --audit-level=high
if [ $? -eq 0 ]; then
    echo "✅ Librerías seguras."
else
    echo "⚠️ Se encontraron vulnerabilidades críticas en las librerías."
fi
cd ..

echo "-------------------------------------------------------"

# 2. Análisis estático del Dockerfile (Hadolint)
echo "🔍 Analizando Dockerfile (Hadolint)..."
# Usamos docker para correr el linter sin instalar nada extra
docker run --rm -i hadolint/hadolint < api/Dockerfile
if [ $? -eq 0 ]; then
    echo "✅ Dockerfile sigue las mejores prácticas."
else
    echo "❌ El Dockerfile tiene fallos de seguridad o eficiencia."
fi

echo "-------------------------------------------------------"
echo "🚀 Escaneo finalizado."