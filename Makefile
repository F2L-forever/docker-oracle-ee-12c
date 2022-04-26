build:
	docker build -t ashimjk/oracle-ee-12c .

run:
	docker run -d -p 1521:1521 --name oracle-ee ashimjk/oracle-ee-12c

exec:
	docker run -it -p 1521:1521 --name oracle-ee ashimjk/oracle-ee-12c bash

logs:
	docker logs -f oracle-ee
