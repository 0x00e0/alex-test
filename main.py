from fastapi import FastAPI
import uvicorn
import os
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

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=80)
