# create_save_point
Guarda un dump de la db en el estado actual para poder restaurarla luego

## Uso
`sh create_save_point.sh`

## Sugerencia

Agregarlo al .bashrc con el alias csp

```bash
alias csp="sh ${ROUTE_TO_SCRIPT}/create_save_point.sh"
```


# restore_save_point
Restaura el ultimo dump o en su defecto el que le pases por numero.

## uso

- Restaurar el ultimo save point
  `sh restore_save_point.sh`

- Restaurar el penúltimo, acepta un parámetro de numérico
  `sh restore_save_point.sh 2`

Al querer restaurar un dump se debe detener el acceso a la db en este caso postgres, esto no es siempre necesario, pero en caso de que diga que hay usuarios accediendo a la db se puede reiniciar el servicio (en linux) con el comando `sudo service postgresql restart`

## Sugerencia

Agregarlo al .bashrc

```bash
alias restart_postgres="sudo service postgresql restart"
alias restore_save_point="sh ${ROUTE_TO_SCRIPT}/restore_save_point.sh"
alias rsp="restart_postgres && restore_save_point"
```

# delete_save_point

Elimina el ultimo save_point creado, te muestra cual fue el ultimo dump y pregunta si quieres eliminarlo o no.

## uso

`sh delete_save_point.sh`

## Sugerencia

Agregarlos al .bashrc

```bash
alias dsp="sh ${ROUTE_TO_SCRIPT}/delete_save_point.sh"
```

## Notas

- Dentro del archivo encontraran variables para setear los datos de acceso a su db los cuales tienen que cambiar.
- `SQLS_PATH`: Es la ruta donde se guardaran los dumps generados, esta ruta tienen que actualizarla en cada archivo para setearla por defecto.
  `SQLS_PATH="$HOME/path/to/folder/sqls/"`

> Al agregar algo algo al .bashrc se tiene que reiniciar la consola en su defecto cerrar y abrir una nueva o correr `source .bashrc` lo cual recarga el archivo `.bashrc` pero solo en la terminal donde fue corrido el comentario.

