SQLS_PATH="$HOME/path/to/folder/sqls/"

#BD CREDENTIALS
DB_NAME="db_name"
DB_PASSWORD='db_password'
DB_USER='db_user'
DB_HOST='localhost'
DB_PORT='5432'

#SQL FILE SEARCH
PARAMETER=$1
NUMB=${PARAMETER:-1}
SQL_NAME=$(ls $SQLS_PATH -t | head -n$NUMB | tail -n 1)
SQL_PATH_NAME="$SQLS_PATH$SQL_NAME"


echo "Restoring -> $SQL_NAME"

if PGPASSWORD=$DB_PASSWORD psql -lqt -h $DB_HOST -p $DB_PORT -U $DB_USER | cut -d \| -f 1 | grep -qw "$DB_NAME"; then
	echo "Delete db $DB_NAME because already exists"
	PGPASSWORD=$DB_PASSWORD dropdb -h $DB_HOST -p $DB_PORT -U $DB_USER "$DB_NAME"
fi

echo "Creating db"
PGPASSWORD=$DB_PASSWORD createdb -h $DB_HOST -p $DB_PORT -U $DB_USER "$DB_NAME"

echo "Restoring dump.sql in db"
PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -p $DB_PORT -U $DB_USER "$DB_NAME" < "$SQL_PATH_NAME"


#author @rcerqueira




