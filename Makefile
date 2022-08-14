server:
	docker run -p 27017:27017 -d --rm --name mongodb --network notes-net --env-file ./config/dev.env -v mongo-data:/data/db mongo
server1:
	docker run -p 5000:5000 -d --rm --name notes-backend --network notes-net -v C:\docker-mern-master\server\:/app -v /app/node_modules --env-file ./config/dev.env notes-backend-img
server2:
	docker run -p 5000:5000 --rm --name notes-backend --network notes-net -v C:\docker-mern-master\server\:/app -v /app/node_modules --env-file ./config/dev.env notes-backend-img
client:
	docker run -p 3000:3000 -d --rm --name notes-frontend --network notes-net -v C:\docker-mern-master\client\src\:/app/src notes-frontend
client2:
	docker run -p 3000:3000 --rm --name notes-frontend --network notes-net -e CHOKIDAR_USEPOLLING=true -v C:\docker-mern-master\client\src\:/app/src notes-frontend
dev:
	docker-compose -f docker-compose.yml up -d
stop:
	docker-compose down