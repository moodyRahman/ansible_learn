
inventory_server: ./images/inventory_node.Dockerfile
	docker build -t moody/inventory_server:latest -f ./images/inventory_node.Dockerfile .;
	docker compose up -d

control_server: ./images/control_node.Dockerfile
	docker build -t moody/cmoon:latest -f ./images/control_node.Dockerfile .
	docker compose up -d

managed_server: ./images/managed_node.Dockerfile
	docker build -t moody/managed_server:latest -f ./images/managed_node.Dockerfile .

stop:
	docker compose down --timeout 0

start: 
	docker compose up -d

restart: stop start

login: 	
	docker exec -it cmoon bash

all: inventory_server control_server managed_server restart login