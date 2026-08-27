from fastapi import FastAPI, HTTPException, Header
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
