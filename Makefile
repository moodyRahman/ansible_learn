
inventory_server:
	docker build -t moody/inventory_server:latest -f inventory_api_image/Dockerfile .;
	docker compose up -d

control_server:
	docker build -t moody/cmoon:latest -f ./control_node_image/Dockerfile .
	docker compose up -d

stop:
	docker compose down --timeout 0

start: 
	docker compose up -d

restart:
	docker compose down --timeout 0
	docker compose up -d

login: start	
	docker exec -it cmoon bash