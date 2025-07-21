from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from database import Base, engine
from users import router as users_router

Base.metadata.create_all(bind=engine)

app = FastAPI()

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