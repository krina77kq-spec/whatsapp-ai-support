#Decisiones técnicas

## Herramienta para ver la base de datos
Contexto: necesito inspeccionar tablas sin escribir SQL a mano todo el tiempo.
Alternativas: pgAdmin, DBeaver, Adminer.
Decisión: Adminer, como otro servicio en docker-compose.yml.
Tradeoff: menos funciones que pgAdmin/DBeaver, pero muy liviano en RAM,
que es una limitante real de mi máquina.

## Diseño de tablas: contactos, conversaciones y mensajes
Contexto: necesito guardar mensajes de WhatsApp de forma que se pueda
consultar el historial por cliente sin duplicar datos.
Alternativas: una sola tabla "messages" con el teléfono repetido en cada fila,
vs. separar en contacts / conversations / messages relacionadas.
Decisión: tres tablas relacionadas con FOREIGN KEY.
Tradeoff: más joins al consultar, pero datos normalizados, sin
duplicación del teléfono/nombre en cada mensaje, y conversations queda
lista para crecer con "status" en la Etapa 4 sin rediseñar nada.

## Normalización del payload de Meta
Contexto: el JSON de WhatsApp Cloud API es profundamente anidado y
mezcla mensajes nuevos con eventos de status en la misma estructura.
Decisión: un Code node normaliza a un formato propio simple
{phone, external_id, message_type, body, timestamp, raw_payload}
y filtra (return []) cualquier payload que no traiga "messages".
Tradeoff: si Meta cambia su formato, solo hay que tocar este nodo,
el resto del workflow no conoce la forma original de Meta.

## Prevención de inyección SQL
Contexto: las primeras versiones de los nodos Postgres concatenaban
directamente {{ $json.phone }} dentro del SQL.
Decisión: usar Query Parameters ($1, $2...) con un arreglo de JavaScript
en vez de una lista separada por comas.
Por qué un arreglo y no una lista separada por comas: el campo de n8n
separa valores por coma, lo cual rompe con texto libre de clientes que
contiene comas (ej. "Hola, quiero una cita").
Tradeoff: la expresión es más larga de escribir, pero es segura y
resistente a cualquier texto que escriba un cliente real.

## Mensajes no soportados (imagen, audio, sticker)
Contexto: el payload de un mensaje no-texto no tiene text.body, y sin
manejo explícito, se guarda silenciosamente con body = NULL.
Decisión: el nodo Code marca is_supported: true/false según el tipo
de mensaje. En la Etapa 2, los mensajes no soportados recibirán una
respuesta automática explicando la limitación, en vez de quedar sin
respuesta silenciosamente.
Alcance v1: solo se procesan mensajes de texto.