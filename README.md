# klarixa-eco Aquí tienes un README.md profesional, estructurado para impresionar a los jueces del All Things Agentic Hackathon y documentar limpiamente el repositorio KLARIXA Ecosystem.
Puedes copiar y pegar este bloque directamente en tu archivo README.md:
# 🛡️ KLARIXA Ecosystem — Nonacortex 5-3-1

> **Next-Generation Multi-Agent Enterprise Architecture powered by Google Gemini 2.5/3.5 & Google Cloud**

KLARIXA es una plataforma orquestadora de agentes de inteligencia artificial diseñada para entornos empresariales de alta disponibilidad. Basada en la arquitectura **Nonacortex (5-3-1)**, organiza y coordina dinámicamente hasta 48 módulos especializados (**KWorkers**) activados bajo demanda mediante microservicios serverless en Google Cloud Run.

---

## 🏗️ Arquitectura Nonacortex (5-3-1)

El motor central de KLARIXA redefine la orquestación multi-agente en tres niveles jerárquicos impulsados por los modelos **Google Gemini**:

1. **5 Ingestas Periféricas (Multimodal Input Layer):** Procesa texto, imágenes (OCR con Tesseract), audio y señales de telemetría en tiempo real.
2. **3 Selectores de Contexto (Context & Security Filters):** Filtran el riesgo (KShield), validan suscripciones/tokens (KLX) y priorizan la intención operativa.
3. **1 Árbitro Central (Master Decision Engine):** Instancia impulsada por Gemini 2.5 Pro / 3.5 que toma la decisión final y rutea la tarea al **KWorker** correspondiente.


[ 5 Ingestas Multimodales ]
│
[ 3 Selectores KShield ]
│
┌─────────────┴─────────────┐
│  1 Árbitro Central Gemini │
└─────────────┬─────────────┘
│
┌──────────────┼──────────────┐
▼              ▼              ▼
[KWorker 01]  [KWorker 02] ... [KWorker 48]

---

## ⚡ Tech Stack

* **Core Engine:** Google Gemini SDK (`google-genai`), Python 3.11+, FastAPI, Pydantic.
* **Orquestación Multi-Agente:** Arquitectura Nonacortex 5-3-1 (Microservicios ZIP/Docker On-Demand).
* **Infraestructura Cloud:** Google Cloud Run, Firebase Hosting, Artifact Registry.
* **Procesamiento Multimodal:** Tesseract OCR, Pillow, Twilio WhatsApp Gateway.
* **Monetización & Suscripciones:** RevenueCat, Whop Webhooks.

---

## 📂 Estructura del Proyecto

```text
klarixa-ecosistema/
├── app/
│   ├── __init__.py
│   ├── main.py                  # API principal con FastAPI y endpoints de ingesta
│   ├── core/
│   │   ├── nonacortex.py        # Orquestador 5-3-1 integrado con Gemini SDK
│   │   └── registry.py          # Registro dinámico de los 48 KWorkers
│   └── routers/
│       ├── agentic.py           # Enrutamiento autónomo de agentes
│       └── webhooks.py          # Integraciones WhatsApp / RevenueCat / Whop
├── Dockerfile                   # Contenedor optimizado para Google Cloud Run
├── requirements.txt             # Dependencias del sistema
└── README.md                    # Documentación oficial

🚀 Despliegue Local
1. Requisitos previos
 * Python 3.11+
 * Engine de Tesseract OCR instalado en el sistema (apt install tesseract-ocr o vía Brew/Installer).
2. Configuración del entorno
Clona el repositorio e instala las dependencias:
git clone [https://github.com/tu-usuario/klarixa-ecosistema.git](https://github.com/tu-usuario/klarixa-ecosistema.git)
cd klarixa-ecosistema

python -m venv venv
source venv/bin/activate  # En Windows: venv\Scripts\activate
pip install -r requirements.txt

3. Variables de Entorno
Crea un archivo .env en la raíz del proyecto:
GEMINI_API_KEY="tu_google_gemini_api_key"
PORT=8080

4. Ejecución del servidor
uvicorn app.main:app --host 0.0.0.0 --port 8080 --reload

Accede a la documentación interactiva en: http://localhost:8080/docs
☁️ Despliegue en Google Cloud Run
Para desplegar el contenedor de KLARIXA en Google Cloud utilizando Cloud Build y Cloud Run:
# 1. Compilar la imagen en Artifact Registry
gcloud builds submit --tag gcr.io/TU_PROJECT_ID/klarixa-core

# 2. Desplegar en Cloud Run
gcloud run deploy klarixa-core \
  --image gcr.io/TU_PROJECT_ID/klarixa-core \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated \
  --set-env-vars GEMINI_API_KEY="tu_google_gemini_api_key"

🛠️ Mapa de Módulos KWorkers (01 - 48)
 * mod_01_ocr: Extracción multimodal de datos estructurados sobre imágenes/documentos.
 * mod_02_whatsapp: Gateway de comunicación omnicanal asíncrona.
 * mod_03_stem_sim: Engine de simulación para cálculo avanzado KLARIXA STEM.
 * mod_04_48: Módulos de ejecución en la nube activados dinámicamente vía memoria comprimida (ZIP/RAM) en instancias GCP.
📜 Licencia & Créditos
Desarrollado por F1725 Development Technologies para el All Things Agentic Hackathon 2026.

---

¡Guárdalo en la raíz de tu proyecto como `README.md`, haz el `git add README.md`, `git commit` y sube los cambios al repo! 🚀🛡️

