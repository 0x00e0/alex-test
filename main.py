from models.common import  RequestContent
from fastapi import FastAPI, HTTPException
import os
import aiohttp
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
app = FastAPI()

@app.get("/health")
@app.get("/")
async def read_root():
    return {"Hello": "World"}


@app.get("/api/v1/error")
async def error_event():
    logger.error("{'level':'error', 'message': 'path /api/v1/error was triggered'}")
    return "path /api/v1/error was triggered"

@app.get("/api/v1/panic")
async def panic_event():
    logger.error({"level": "panic", "message": "path /api/v1/panic was triggered"})
    os._exit(1)

@app.post("/api/v1/post")
async def post_request(request_content: RequestContent):
    headers = {
    'Content-Type': 'application/json'
    }
    async with aiohttp.ClientSession() as session:
        async with session.post(url=request_content.url, data= request_content.data, headers=headers) as response:
            try:
                data = await response.json()
                return f"response content is: \n{data}"
            except aiohttp.ContentTypeError:
                raise HTTPException(status_code=500, detail="Invalid response content type")

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=80)
