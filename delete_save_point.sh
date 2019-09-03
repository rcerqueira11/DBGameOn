
SQLS_PATH="$HOME/path/to/folder/sqls/"

PARAMETER=$1
NUMB=${PARAMETER:-1}
SQL_NAME=$(ls $SQLS_PATH -t | head -n$NUMB | tail -n 1)
SQL_PATH_NAME="$SQLS_PATH$SQL_NAME"

read -r -p "Are you sure -> $SQL_NAME ? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        rm $SQL_PATH_NAME && echo "Deleted $SQL_NAME"
        ;;
    *)
        echo "CANCELED"
        ;;
esac

#autor @rcerqueira
