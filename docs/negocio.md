# Alvarado Salon — datos del negocio

- Ubicación: Rivas, Pérez Zeledón. Hay estacionamiento.
- Horario: lunes a sábado, 8:00–17:00 (confirmado)
- Zona horaria: America/Costa_Rica
- Atención: solo con cita previa, reservada por WhatsApp
- Pagos: SINPE Móvil y efectivo
- Capacidad: 2 personas atendidas al mismo tiempo
- Cancelar: el cliente puede cancelar el día antes.
  Cambiar de día: solo si hay espacio disponible.

## Servicios

| Servicio | Duración | Precio | Tipo de precio | Lo agenda el bot (v1) |
|---|---|---|---|---|
| Corte hombre (o niño) | 60 min | ₡3,500 | fijo | Sí |
| Corte mujer (o niña) | 120 min | ₡5,000 | fijo | Sí |
| Barba | 60 min | ₡1,500 | fijo | Sí |
| Barba y corte (hombre) | 120 min | ₡5,000 (CONFIRMAR) | fijo | Sí |
| Cejas | 30 min | ₡1,000 | fijo | Sí |
| Plancha y blower | 120 min | ₡8,000 | fijo | Sí |
| Tinte / coloración | según largo | desde ₡20,000 | mínimo | No: deriva a humano |
| Keratina | 300 min | desde ₡30,000 | mínimo | No: deriva a humano |
| Otros tratamientos | sin dato | sin dato | sin dato | No: deriva a humano |

Reglas:
- Niños y niñas: mismo precio y duración que adultos (niño = corte hombre, niña = corte mujer).
- Tinte y keratina: el bot informa el "desde" y aclara que el precio final depende
  del largo del cabello y lo confirma una persona.
- Una cita = un servicio (excepto "barba y corte", que es un servicio propio).

## FAQ (las respuestas salen de la base de datos, no de la IA)

1. ¿Qué servicios ofrecen? → corte hombre, mujer y niños, barba, cejas, plancha y blower, tintes, keratina y tratamientos.
2-3. Precios de corte → hombre ₡3,500, mujer ₡5,000.
4. ¿Cortes para niños? → Sí, mismo precio y duración que adultos.
5. ¿Cortes según foto? → Sí (sin garantizar resultado idéntico).
6. ¿Barba, perfilado y afeitado? → Sí. (Precio de barba: ₡1,500.)
7. ¿Coloración, tintes, decoloración? → Sí, desde ₡20,000 según largo.
8. ¿Tratamientos? → Sí. Keratina desde ₡30,000 según largo.
9. ¿Se necesita cita? → Solo con cita previa.
10. ¿Cómo reservo? → Por este WhatsApp.
11. ¿Cuánto dura cada servicio? → Según el servicio (tabla anterior).
12. ¿Horario? → Lunes a sábado, 8:00 a 17:00.
13. ¿Ubicación y parqueo? → Rivas, Pérez Zeledón; sí hay estacionamiento.
14. ¿Métodos de pago? → SINPE Móvil y efectivo.
15. ¿Cancelar o cambiar cita? → Se puede cancelar el día antes; el cambio de día depende de disponibilidad.

## Qué NO hace el bot

| Tema | Acción |
|---|---|
| Salud del cuero cabelludo (caída severa, infecciones, dermatitis, alergias) | Deriva a humano y sugiere consultar a un profesional de salud |
| Queja compleja, reclamo, devolución, compensación | Deriva a humano con prioridad |
| Precio, promoción, horario o servicio no registrado | Dice que no tiene ese dato y deriva. Nunca inventa |
| Garantía de resultado | Explica el servicio, no garantiza. Deriva si insiste |
| Tema ajeno a la barbería | Declina con cortesía. **No deriva** |
| Cambio de cita ya agendada | v1: informa la política y deriva a humano |