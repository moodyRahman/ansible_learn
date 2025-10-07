
inventory_server: ./inventory_api_image/Dockerfile
	docker build -t moody/inventory_server:latest -f inventory_api_image/Dockerfile .;
	docker compose up -d

control_server: ./control_node_image/Dockerfile
	docker build -t moody/cmoon:latest -f ./control_node_image/Dockerfile .
	docker compose up -d

managed_server: ./managed_node_image/Dockerfile
	docker build -t moody/managed_server:latest -f managed_node_image/Dockerfile .

stop:
	docker compose down --timeout 0

start: 
	docker compose up -d

restart: stop start

login: 	
	docker exec -it cmoon bash

all: inventory_server control_server managed_server restart login