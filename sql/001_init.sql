-- Un cliente que ha escrito, identificado por su teléfono
CREATE TABLE contacts (
    id SERIAL PRIMARY KEY,
    phone TEXT UNIQUE NOT NULL,
    name TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Una "conversación" con ese contacto. Por ahora, una por contacto.
-- Más adelante (Etapa 4/5) esta tabla va a crecer con status y contexto.
CREATE TABLE conversations (
    id SERIAL PRIMARY KEY,
    contact_id INTEGER NOT NULL REFERENCES contacts(id),
    status TEXT NOT NULL DEFAULT 'bot',
    created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- Cada mensaje individual, entrante o saliente
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    conversation_id INTEGER NOT NULL REFERENCES conversations(id),
    external_id TEXT UNIQUE,
    direction TEXT NOT NULL CHECK (direction IN ('inbound', 'outbound')),
    message_type TEXT NOT NULL,
    body TEXT,
    raw_payload JSONB NOT NULL,
    received_at TIMESTAMPTZ NOT NULL DEFAULT now()
);