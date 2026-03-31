# 🖼️ Hosting de Imágenes — GRATIS con GitHub + jsDelivr

## La solución (igual que WildWorld)

WildWorld usa exactamente esto:
```
https://cdn.jsdelivr.net/gh/ShandaAI/wildworld-project@0.1.0/static/images/teaser.png
```

Tú usarás:
```
https://cdn.jsdelivr.net/gh/vibecodingchile/swm-scl-project@v0.1.0/static/images/teaser.png
```

**jsDelivr** es un CDN open-source gratuito que sirve archivos desde GitHub repos públicos.
- Ilimitado en bandwidth para repos open-source
- Global CDN (~100 PoPs)
- Cero costo, sin cuenta, sin tarjeta

---

## Estructura del repo

```
vibecodingchile/swm-scl-project/          ← GitHub repo (nuevo)
├── index.html                            ← La página que construimos
├── demo/
│   └── index.html                        ← Tu demo interactiva existente
└── static/
    └── images/
        ├── teaser.png                    ← Pipeline overview (1200×630px)
        ├── framework.png                 ← Architecture diagram
        ├── benchmark_overview.png        ← Mapa 5 zonas con waypoints
        ├── quantitative_results.png      ← Gráficos de métricas
        └── qualitative_comparison.png    ← Comparación side-by-side
    └── videos/
        ├── barrio_republica.mp4
        ├── alameda.mp4
        ├── terremoto.mp4
        └── inundacion.mp4
```

---

## Paso a paso

### 1. Crear el repo en GitHub

```bash
# En GitHub: New repo → vibecodingchile/swm-scl-project → Public → Create
git clone https://github.com/vibecodingchile/swm-scl-project.git
cd swm-scl-project
mkdir -p static/images static/videos demo
```

### 2. Subir imágenes

```bash
# Pon tus imágenes en static/images/
cp teaser.png static/images/
cp framework.png static/images/
# etc.

git add static/
git commit -m "feat: add static assets"
git push
```

### 3. Crear un tag de versión (CRÍTICO para jsDelivr)

```bash
git tag v0.1.0
git push origin v0.1.0
```

> ⚠️ jsDelivr cachea por tag/versión. Sin tag la URL no funciona bien.

### 4. Activar GitHub Pages

- Settings → Pages → Source: Deploy from branch → Branch: main → / (root)
- URL: `https://vibecodingchile.github.io/swm-scl-project/`

### 5. Reemplazar placeholders en index.html

Busca todos los `img-placeholder` y reemplaza por:
```html
<img src="https://cdn.jsdelivr.net/gh/vibecodingchile/swm-scl-project@v0.1.0/static/images/teaser.png"
     alt="SWM-SCL Pipeline Overview" />
```

---

## URLs de cada imagen

```
# Teaser (hero image)
https://cdn.jsdelivr.net/gh/vibecodingchile/swm-scl-project@v0.1.0/static/images/teaser.png

# Framework diagram
https://cdn.jsdelivr.net/gh/vibecodingchile/swm-scl-project@v0.1.0/static/images/framework.png

# Benchmark map
https://cdn.jsdelivr.net/gh/vibecodingchile/swm-scl-project@v0.1.0/static/images/benchmark_overview.png

# Quantitative results
https://cdn.jsdelivr.net/gh/vibecodingchile/swm-scl-project@v0.1.0/static/images/quantitative_results.png

# Qualitative comparison
https://cdn.jsdelivr.net/gh/vibecodingchile/swm-scl-project@v0.1.0/static/images/qualitative_comparison.png
```

---

## Alternativa: Hugging Face (para videos)

Para archivos grandes como .mp4 (>25MB), GitHub rechaza el push.
Usa HuggingFace Datasets (gratis, ilimitado para repos públicos):

```bash
pip install huggingface_hub
huggingface-cli login  # tu token HF

# Crear dataset repo en hf.co/vibecodingchile/swm-scl-videos
python -c "
from huggingface_hub import HfApi
api = HfApi()
api.create_repo('swm-scl-videos', repo_type='dataset', private=False)
api.upload_file(
    path_or_fileobj='barrio_republica.mp4',
    path_in_repo='barrio_republica.mp4',
    repo_id='vibecodingchile/swm-scl-videos',
    repo_type='dataset'
)
"
```

URL del video:
```
https://huggingface.co/datasets/vibecodingchile/swm-scl-videos/resolve/main/barrio_republica.mp4
```

---

## Resumen rápido

| Asset | Hosting | Costo |
|-------|---------|-------|
| Imágenes PNG/JPG | GitHub + jsDelivr | $0 |
| Videos MP4 (<25MB) | GitHub + jsDelivr | $0 |
| Videos MP4 (>25MB) | HuggingFace Datasets | $0 |
| HTML page | GitHub Pages | $0 |
| Dominio custom | Tu Vercel actual | $0 (ya tienes) |

**Total: $0/mes**
