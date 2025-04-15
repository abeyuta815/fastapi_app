from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

import uvicorn

# fastapiインスタンス作成
app = FastAPI()

templates = Jinja2Templates(directory="templates")


@app.get("/", response_class=HTMLResponse)
async def root(request: Request):
    context = {"request": request}
    return templates.TemplateResponse("HomePage.html", context)


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
