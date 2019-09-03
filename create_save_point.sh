
SQLS_PATH="$HOME/path/to/folder/sqls/"


#BD CREDENTIALS
DB_NAME="db_name"
DB_PASSWORD='db_password'
DB_USER='db_user'
DB_HOST='localhost'
DB_PORT='5432'

#DUMP DIR AND NAME
FECHA=$(date +%Y%m%d_%H%M%S)
[ -d $SQLS_PATH ] || mkdir $SQLS_PATH
DUMP_NAME='dump_'$DB_NAME'_'$FECHA'.sql'
DUMP_NAME_DIR=$SQLS_PATH$DUMP_NAME

echo "Getting dumb of $DB_NAME"
PGPASSWORD=$DB_PASSWORD pg_dump -h $DB_HOST -p 5432 -U $DB_USER "$DB_NAME" > $DUMP_NAME_DIR && echo "Created $DUMP_NAME"


#autor @rcerqueira
