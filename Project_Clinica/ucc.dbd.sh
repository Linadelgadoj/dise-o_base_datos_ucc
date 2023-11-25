docker run --name oracle \
	-p 1522:1521 \
	-e ORACLE_PASSWORD=oracle \
	-e APP_USER=banco \
	-e APP_USER_PASSWORD=oracle \
	-d gvenzl/oracle-xe