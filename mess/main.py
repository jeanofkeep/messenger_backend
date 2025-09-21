from fastapi import FastAPI, Response
from fastapi.middleware.cors import CORSMiddleware
from database import Base, engine
from users import router as users_router
from messages import router as messages_router
from prometheus_client import Counter, generate_latest, CONTENT_TYPE_LATEST

Base.metadata.create_all(bind=engine)

app = FastAPI()

app.include_router(messages_router,prefix="/messages", tags=["messages"])

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(users_router)

@app.get("/")
def root():
    return {"status": "ok"}

REQUEST_COUNT = Counter("app_requests_total", "Total number of requests")

@app.get("/metrics")
def metrics():
    return Response(generate_latest(), media_type=CONTENT_TYPE_LATEST)
"""
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Dict, Optional

app = FastAPI()

# Настройка CORS для связи с Flutter
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # В продакшене замени на конкретный домен
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Временное хранилище пользователей
fake_users_db: Dict[str, Dict[str, str]] = {
    "user1": {"username": "user1", "name": "User One", "password": "password123"},
    "user2": {"username": "user2", "name": "User Two", "password": "securepass"}
}

class User(BaseModel):
    username: str
    name: Optional[str] = None  # Сделали name необязательным
    password: str

class LoginRequest(BaseModel):
    username: str
    password: str

@app.post("/register")
async def register(user: User):
    if user.username in fake_users_db:
        raise HTTPException(status_code=400, detail="User already exists")
    fake_users_db[user.username] = {
        "username": user.username,
        "name": user.name if user.name else "Unnamed",  # Устанавливаем значение по умолчанию, если name отсутствует
        "password": user.password  # В продакшене используй хеширование (bcrypt)
    }
    return {"message": "Registration successful", "username": user.username}

@app.post("/login")
async def login(request: LoginRequest):
    user = fake_users_db.get(request.username)
    if not user or user["password"] != request.password:
        raise HTTPException(status_code=401, detail="Invalid credentials")
    return {"message": "Login successful", "username": request.username, "name": user["name"]}

"""

"""
from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import Dict, Optional

app = FastAPI()

# Настройка CORS для связи с Flutter
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # В продакшене замени на конкретный домен
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Временное хранилище пользователей
fake_users_db: Dict[str, Dict[str, str]] = {
    "user1": {"username": "user1", "name": "User One", "password": "password123"},
    "user2": {"username": "user2", "name": "User Two", "password": "securepass"}
}

class User(BaseModel):
    username: str
    name: Optional[str] = None  # Сделали name необязательным
    password: str

class LoginRequest(BaseModel):
    username: str
    password: str

@app.post("/register")
async def register(user: User):
    if user.username in fake_users_db:
        raise HTTPException(status_code=400, detail="User already exists")
    fake_users_db[user.username] = {
        "username": user.username,
        "name": user.name if user.name else "Unnamed",  # Устанавливаем значение по умолчанию, если name отсутствует
        "password": user.password  # В продакшене используй хеширование (bcrypt)
    }
    return {"message": "Registration successful", "username": user.username}

@app.post("/login")
async def login(request: LoginRequest):
    user = fake_users_db.get(request.username)
    if not user or user["password"] != request.password:
        raise HTTPException(status_code=401, detail="Invalid credentials")
    return {"message": "Login successful", "username": request.username, "name": user["name"]}

"""