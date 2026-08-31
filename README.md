# 🧠 Ecosistema KLARIXA IA (Multi-Agent Architecture)

**KLARIXA IA** es un ecosistema distribuido de agentes inteligentes desacoplados, diseñado bajo principios de arquitectura asíncrona avanzada. El sistema integra módulos especializados que coordinan inferencia de LLMs, validación criptográfica e ingesta dinámica de datos.

---

## 🏛️ Visión y Arquitectura General

El ecosistema opera mediante una red de cerebros (nodos de cómputo independientes) expuestos a través de microservicios HTTP asíncronos con FastAPI y túneles `pyngrok`. Esta separación garantiza alta disponibilidad, modularidad y tolerancia a fallos en la orquestación multi-agente.

---

## 🛠️ Desglose de Módulos (Cerebros)

El sistema se divide en tres módulos independientes alojados en sus respectivos cuadernos de ejecución en Jupyter:

| Cuaderno | Módulo | Función Principal | Stack Técnico |
| :--- | :--- | :--- | :--- |
| `Klarixa_ecosistema_ia1.ipynb` | **Cerebro 1: Decisor** | Orquestador central encargado de evaluar contextos, priorizar tareas y tomar decisiones operativas de forma autónoma. | `FastAPI`, `Pydantic`, `asyncio` |
| `Klarixa_ecosistema_ia_2.ipynb` | **Cerebro 2: Security & Key Management** | Gestión segura de credenciales, inferencia rápida mediante LLMs (`openai/gpt-oss-120b`) y firma criptográfica de peticiones. | `Groq API`, `FastAPI`, `pyngrok` |
| `Klarixa_ecosistema_ia_3.ipynb` | **Cerebro 3: Network Ingestor** | Ingesta de datos de red, extracción de información web en tiempo real e integración RPC asíncrona. | `httpx`, `nest_asyncio`, `FastAPI` |

---

## 🚀 Tecnologías y Herramientas

* **Lenguaje Principal:** Python 3.10+
* **Framework API:** FastAPI / Uvicorn
* **Orquestación Asíncrona:** `asyncio`, `nest_asyncio`, `httpx`
* **Modelos de Lenguaje (LLM):** Groq API (`openai/gpt-oss-120b`)
* **Validación de Datos:** Pydantic v2
* **Túneles de Red:** pyngrok
* **Despliegue y Contenedores:** Docker, Google Colab, Termux

---

## 🔧 Instalación y Despliegue Local

### 1. Clonar el repositorio
```bash
git clone [https://github.com/f1725developmenttechnologies-create/klarixa-ecosistema-ia.git](https://github.com/f1725developmenttechnologies-create/klarixa-ecosistema-ia.git)
cd klarixa-ecosistema-ia

2. Configurar variables de entorno
Crea un archivo .env tomando como base .env.example:
cp .env.example .env

Define las variables necesarias:
GROQ_API_KEY=tu_api_key_de_groq
NGROK_AUTHTOKEN=tu_authtoken_de_ngrok
PORT=8001

3. Instalar dependencias y ejecutar
pip install -r requirements.txt
python main.py

🛡️ Estándares de Ciberseguridad
Este repositorio cumple de forma estricta con las políticas de GitHub Secret Scanning. Toda credencial de API, llave privada o token de acceso se gestiona dinámicamente desde variables de entorno (os.getenv), evitando la exposición involuntaria de secretos en el código o en el historial de commits.

**Instrucción rápida para móvil:**
1. Copia todo este bloque con la opción de copiar texto.
2. Toca el icono del **lápiz** en el `README.md` de GitHub.
3. Selecciona **todo el texto actual**, dale a **Pegar / Reemplazar** y presiona **Commit changes...**.

