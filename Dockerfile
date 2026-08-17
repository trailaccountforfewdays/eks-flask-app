FROM python:3.11-slim

WORKDIR /app


# The /usr/sbin/nologin appuser writes a line in the /etc/passwd which is the path of nologin
# nologin ensures that noone can switch user or ssh into the container

RUN useradd --system --uid 10001 --no-create-home --shell /usr/sbin/nologin appuser

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

#COPY . . 

COPY --chown=appuser:appuser . .

EXPOSE 5000


#RUN useradd -m appuser

USER appuser


CMD ["python","app.py"]

