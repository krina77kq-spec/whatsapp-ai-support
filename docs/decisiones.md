#Decisiones técnicas

## Herramienta para ver la base de datos
Contexto: necesito inspeccionar tablas sin escribir SQL a mano todo el tiempo.
Alternativas: pgAdmin, DBeaver, Adminer.
Decisión: Adminer, como otro servicio en docker-compose.yml.
Tradeoff: menos funciones que pgAdmin/DBeaver, pero muy liviano en RAM,
que es una limitante real de mi máquina.