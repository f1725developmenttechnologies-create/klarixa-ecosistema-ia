import os
from google import genai
from google.genai import types
from config import settings

class KlarixaAgentCore:
    def __init__(self):
        # Inicialización del cliente nativo de Google GenAI
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
