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

