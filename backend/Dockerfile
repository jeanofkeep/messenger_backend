FROM python:3.11

WORKDIR /app

COPY requirements.txt .

RUN echo "== requirements.txt ==" && cat requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY ./py_files /.

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]