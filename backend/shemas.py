from pydantic import BaseModel
from datetime import datetime

class UserCreate(BaseModel):
    username: str
    name: str
    password: str

class UserLogin(BaseModel):
    username: str
    password: str

class MessageCreate(BaseModel):
    chat_id: int
    sender_id: int
    text: str

class MessageOut(BaseModel):
    id: int
    chat_id: int
    sender_id: int
    text: str
    created_at: datetime

    class Config:
        orm_mode = True

class UserOut(BaseModel):
    id: int
    username: str
    name: str

    class Config:
        orm_mode = True
