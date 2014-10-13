# docker rabbitmq

## usage

### run

```bash
$ docker build -t `whoami`/rabbitmq .
```

### build

ports

port  | use
------|------------
5672  | tcp interface
15672 | web UI

env

var               | default value | use
------------------|---------------|-------
RABBITMQ_USERNAME | admin         | default rabbit user
RABBITMQ_PASSWORD | password      | default rabbit password

```bash
$ docker run -ti --rm \
  -p 5672:5672 \
  -p 15672:15672 \
  -e RABBITMQ_USERNAME=admin \
  -e RABBITMQ_PASSWORD=secret \
  `whoami`/rabbitmq
```

Doug Tangren (softprops) 2014
