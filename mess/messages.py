from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from database import get_db
from models import Message
from shemas import MessageCreate, MessageOut

router = APIRouter()

@router.post("/messages", response_model=MessageOut)
def send_message(message: MessageCreate, db: Session = Depends(get_db)):
    new_message = Message(
        chat_id=message.chat_id,
        sender_id=message.sender_id,
        text=message.text
    )
    db.add(new_message)
    db.commit()
    db.refresh(new_message)
    return new_message

@router.get("/messages/{chat_id}", response_model=list[MessageOut])
def get_messages(chat_id: int, db: Session = Depends(get_db)):
    messages = db.query(Message).filter(Message.chat_id == chat_id).order_by(Message.created_at).all()
    return messages
