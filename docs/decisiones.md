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