from fastapi import APIRouter, Depends, HTTPException, Query
from sqlalchemy.orm import Session
from sqlalchemy import or_
from database import SessionLocal
from models import User  # Это и есть DB-модель
from shemas import UserCreate, UserLogin

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

@router.get("/users/search")
async def search_users(
        q: str = Query(..., description="Search query"), 
        db: Session = Depends(get_db)
        ):
   users = db.query(User).filter(
       or_(
       User.name.ilike(f"%{q}%"),
       User.username.ilike(f"%{q}%")
       )
   ).limit(20).all()

   return [
       {
          "id": str(user.id),
          "username": user.username,
          "name": user.name,
          #"avatar": user.username,
          #"status": user.username,
          #"lastSeen": user.get_last_seen(user.id),
          #"email": user.email,
          #"bio": user.bio,
       }
       for user in users 
   ]
