# 🧠 Ecosistema KLARIXA IA (Multi-Agent Architecture)

**Klarixa IA** es un ecosistema de agentes inteligentes desacoplados diseñados para operar de forma asíncrona, combinando inferencia de modelos de lenguaje (LLMs), validación criptográfica y consultas a redes de capa 2 (Base Network).

---

## 🛠️ Arquitectura de Cerebros

El sistema se divide en tres módulos independientes alojados en sus respectivos cuadernos de ejecución:

| Cuaderno | Módulo | Descripción |
| :--- | :--- | :--- |
| **`Klarixa ecosistema ia 🧠 1`** | **Cerebro 1: Decisor** | Orquestador central encargado de evaluar contextos y tomar decisiones operativas. |
| **`Klarixa ecosistema ia 🧠 2`** | **Cerebro 2: Security & Key Management** | Gestión de claves API (`Groq`), firma criptográfica e inferencia rápida con LLMs (`openai/gpt-oss-120b`). |
| **`Klarixa ecosistema ia 🧠 3`** | **Cerebro 3: Crawler & Network Ingestor** | Ingesta de datos de red e integración mediante RPC asíncrono con **Base Mainnet** (`Chain ID 8453`). |

---

## 🚀 Tecnologías Utilizadas

* **Lenguaje:** Python 3.10+
* **Motor Asíncrono:** `asyncio` / `httpx`
* **Modelo de Datos:** `pydantic`
* **Proveedor LLM:** Groq API (`openai/gpt-oss-120b`)
* **Red Objetivo:** Base Network Mainnet (JSON-RPC)

---

## ⚡ Verificación del Módulo 3 (Base Crawler)

El Módulo 3 consulta directamente el estado del libro mayor en tiempo real:

```json
{
  "module": "CEREBRO_3_CRAWLER",
  "network": "Base Mainnet",
  "latest_block": 50703363,
  "status": "ONLINE"
}
