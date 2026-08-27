#!/bin/bash

# 1. Definir variables (Reemplaza con los datos de tu repositorio)
REPO_URL="https://github.com/f1725developmenttechnologies-create/klarixa-ecosistema-ia
COMMIT_MSG="Initial commit: KLARIXA Multi-Agent Backend"

echo "🚀 Iniciando la creación del proyecto KLARIXA..."

# 2. Crear requirements.txt
cat << 'EOF' > requirements.txt
fastapi==0.110.0
uvicorn==0.28.0
google-genai==0.1.1
pydantic==2.6.4
python-dotenv==1.0.1
httpx==0.27.0
EOF
echo "✔ requirements.txt creado"

# 3. Crear config.py
cat << 'EOF' > config.py
import os
from dotenv import load_dotenv

load_dotenv()

class Settings:
    GEMINI_API_KEY: str = os.getenv("GEMINI_API_KEY", "")
    DEFAULT_MODEL: str = "gemini-2.5-flash"
    PRO_MODEL: str = "gemini-2.5-pro"

settings = Settings()
EOF
echo "✔ config.py creado"

# 4. Crear agent_core.py
cat << 'EOF' > agent_core.py
import os
from google import genai
from google.genai import types
from config import settings

class KlarixaAgentCore:
    def __init__(self):
        api_key = settings.GEMINI_API_KEY or os.environ.get("GEMINI_API_KEY")
        self.client = genai.Client(api_key=api_key)

    async def execute_task(self, prompt: str, system_instruction: str = None, use_pro: bool = False) -> str:
        model_name = settings.PRO_MODEL if use_pro else settings.DEFAULT_MODEL
        
        config = types.GenerateContentConfig(
            temperature=0.2,
            system_instruction=system_instruction or "Eres el núcleo de orquestación del ecosistema KLARIXA."
        )
        
        response = self.client.models.generate_content(
            model=model_name,
            contents=prompt,
            config=config
        )
        return response.text

agent_orchestrator = KlarixaAgentCore()
EOF
echo "✔ agent_core.py creado"

# 5. Crear main.py
cat << 'EOF' > main.py
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Optional
from agent_core import agent_orchestrator

app = FastAPI(
    title="KLARIXA Core API",
    description="Orquestador multi-agente para el ecosistema KLARIXA",
    version="1.0.0"
)

class AgentRequest(BaseModel):
    prompt: str
    system_instruction: Optional[str] = None
    use_pro_model: bool = False

class AgentResponse(BaseModel):
    status: str
    result: str

@app.get("/")
def health_check():
    return {"status": "online", "system": "KLARIXA Enterprise Fleet"}

@app.post("/api/v1/orchestrate", response_model=AgentResponse)
async def orchestrate(request: AgentRequest):
    try:
        execution = await agent_orchestrator.execute_task(
            prompt=request.prompt,
            system_instruction=request.system_instruction,
            use_pro=request.use_pro_model
        )
        return AgentResponse(status="success", result=execution)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
EOF
echo "✔ main.py creado"

# 6. Crear Dockerfile
cat << 'EOF' > Dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
EOF
echo "✔ Dockerfile creado"

# 7. Crear .gitignore
cat << 'EOF' > .gitignore
.env
__pycache__/
*.pyc
.pytest_cache/
EOF
echo "✔ .gitignore creado"

# 8. Inicializar Git y subir los cambios a GitHub
echo "📦 Configurando repositorio Git..."
git init
git add .
git commit -m "$COMMIT_MSG"
git branch -M main
git remote add origin "$REPO_URL" 2>/dev/null || git remote set-url origin "$REPO_URL"

echo "📤 Subiendo código a GitHub..."
git push -u origin main

echo "🎉 ¡Despliegue a GitHub completado con éxito!"
