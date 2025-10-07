FROM python:3.11
WORKDIR /server
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY ./inventory_server.py ./
ENTRYPOINT ["python", "/server/inventory_server.py"]