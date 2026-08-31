# 🧠 Ecosistema KLARIXA IA (Multi-Agent Architecture)

**KLARIXA IA** es un ecosistema de agentes inteligentes desacoplados diseñados para operar de forma asíncrona, combinando inferencia de modelos de lenguaje de gran escala (LLMs), validación criptográfica y procesamiento de datos en red.

---

## 🛠️ Arquitectura de Cerebros

El sistema se divide en módulos independientes alojados en sus respectivos cuadernos de ejecución en Jupyter:

| Cuaderno | Módulo | Descripción |
| :--- | :--- | :--- |
| `Klarixa_ecosistema_ia1.ipynb` | **Cerebro 1: Decisor** | Orquestador central encargado de evaluar contextos y tomar decisiones operativas. |
| `Klarixa_ecosistema_ia_2.ipynb` | **Cerebro 2: Security & Key Management** | Gestión de claves API (`Groq`), firma criptográfica e inferencia rápida con LLMs (`openai/gpt-oss-120b`). |
| `Klarixa_ecosistema_ia_3.ipynb` | **Cerebro 3: Network Ingestor** | Ingesta de datos de red e integración mediante RPC asíncrono. |

---

## 🚀 Tecnologías Utilizadas

* **Lenguaje:** Python 3.10+
* **Framework Web:** FastAPI & Uvicorn
* **Motor Asíncrono:** `asyncio` / `httpx` / `nest_asyncio`
* **Modelo de Datos:** `pydantic`
* **Proveedor LLM:** Groq API (`openai/gpt-oss-120b`)
* **Túnel de Red:** `pyngrok`

---

## 🔧 Instalación y Despliegue

### 1. Clonar el repositorio
```bash
git clone [https://github.com/f1725developmenttechnologies-create/klarixa-ecosistema-ia.git](https://github.com/f1725developmenttechnologies-create/klarixa-ecosistema-ia.git)
cd klarixa-ecosistema-ia

