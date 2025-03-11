FROM python:3.6-slim
WORKDIR /app
RUN echo "import time\nwhile True:\n    time.sleep(60)" > dummy.py
CMD ["python", "dummy.py"]
