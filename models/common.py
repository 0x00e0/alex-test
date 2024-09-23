from pydantic import BaseModel

class RequestContent(BaseModel):
    url: str
    data: str