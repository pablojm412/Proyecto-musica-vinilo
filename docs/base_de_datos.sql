-- =============================================
-- Proyecto Música Vinilo
-- Base de datos completa
-- =============================================

-- TABLA: generos
CREATE TABLE generos (
    id        SERIAL PRIMARY KEY,
    nombre    VARCHAR(50) NOT NULL,
    subgenero VARCHAR(50)
);

INSERT INTO generos (id, nombre, subgenero) VALUES
    (1, 'Rock',        'Metal'),
    (3, 'Hip-Hop',     'Trap'),
    (4, 'Jazz',        NULL),
    (5, 'Pop',         NULL),
    (7, 'Electrónica', NULL);

-- TABLA: vinilos
CREATE TABLE vinilos (
    id        SERIAL PRIMARY KEY,
    titulo    VARCHAR(150) NOT NULL,
    artista   VARCHAR(100) NOT NULL,
    anio      INTEGER,
    precio    DECIMAL(10,2) NOT NULL,
    stock     INTEGER DEFAULT 0,
    genero_id INTEGER REFERENCES generos(id)
);

INSERT INTO vinilos (titulo, artista, anio, precio, stock, genero_id) VALUES
    ('The Wall',               'Pink Floyd',      1979, 5200.00, 10, 1),
    ('Dark Side of the Moon',  'Pink Floyd',      1973, 5800.00,  8, 1),
    ('Kind of Blue',           'Miles Davis',     1959, 6000.00,  5, 4),
    ('Thriller',               'Michael Jackson', 1982, 4200.00, 20, 5),
    ('Random Access Memories', 'Daft Punk',       2013, 5500.00, 12, 7);

-- TABLA: usuarios
CREATE TABLE usuarios (
    id             SERIAL PRIMARY KEY,
    nombre         VARCHAR(100) NOT NULL,
    email          VARCHAR(150) NOT NULL UNIQUE,
    contrasena     VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nombre, email, contrasena) VALUES
    ('Pablo Maldonado', 'pablo@email.com',  'clave123'),
    ('Samir Llano',     'samir@email.com',  'clave456'),
    ('Daniel Zarate',   'daniel@email.com', 'clave789');

-- TABLA: pedidos
CREATE TABLE pedidos (
    id           SERIAL PRIMARY KEY,
    usuario_id   INTEGER REFERENCES usuarios(id),
    vinilo_id    INTEGER REFERENCES vinilos(id),
    cantidad     INTEGER NOT NULL DEFAULT 1,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total        DECIMAL(10,2)
);

INSERT INTO pedidos (usuario_id, vinilo_id, cantidad, total) VALUES
    (1, 1, 1, 5200.00),
    (1, 3, 1, 6000.00),
    (2, 4, 2, 8400.00),
    (3, 5, 1, 5500.00);