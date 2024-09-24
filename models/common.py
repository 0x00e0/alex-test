from pydantic import BaseModel

class RequestContent(BaseModel):
    url: str = "https://my-json-server.typicode.com/typicode/demo/posts"
    data: str = '{"title": "Hello World"}'