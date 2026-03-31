#!/bin/bash
# Run this desde la carpeta del repo clonado
# git clone https://github.com/vibecodingchile/SantiagoWorldBench.git
# cd SantiagoWorldBench && bash PUSH.sh

set -e
echo "📦 Copiando assets al repo..."

# Copia las imágenes generadas (asume que están en la misma carpeta)
mkdir -p static/images static/videos

# Si corres esto desde donde bajaste los archivos:
# cp teaser.png framework.png benchmark_overview.png quantitative_results.png qualitative_comparison.png static/images/

git add .
git commit -m "feat: project page + static assets [SWM-SCL v0.1.0]"
git push origin main

echo "🏷️  Creando tag v0.1.0..."
git tag -f v0.1.0
git push origin v0.1.0 --force

echo ""
echo "✅ Listo. La página estará en:"
echo "   https://vibecodingchile.github.io/SantiagoWorldBench/"
echo ""
echo "⚙️  Activa GitHub Pages:"
echo "   Settings → Pages → Branch: main → / (root) → Save"
