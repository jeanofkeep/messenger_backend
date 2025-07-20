from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.database import SessionLocal
from app.models import User  # Это и есть DB-модель
from app.schemas import UserCreate, UserLogin

router = APIRouter()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@router.post("/register")
def register(user: UserCreate, db: Session = Depends(get_db)):
    existing_user = db.query(User).filter(User.username == user.username).first()
    if existing_user:
        raise HTTPException(status_code=400, detail="User already exists")
    db_user = User(username=user.username, name=user.name, password=user.password)
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return {"message": "User created", "username": db_user.username}

@router.post("/login")
def login(data: UserLogin, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == data.username).first()
    if not user or user.password != data.password:
        raise HTTPException(status_code=401, detail="Invalid credentials")
    return {"message": "Login successful", "username": user.username, "name": user.name}

