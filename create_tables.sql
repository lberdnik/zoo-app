-- Создание таблицы 'food'
CREATE TABLE food (
    id SERIAL PRIMARY KEY NOT NULL,
    food VARCHAR(128) NOT NULL
);

-- Создание таблицы 'complex'
CREATE TABLE complex (
    id SERIAL PRIMARY KEY NOT NULL,
    complex_name VARCHAR(128) NOT NULL
);

-- Создание таблицы 'placement'
CREATE TABLE placement (
    id SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(128) DEFAULT '',
    number INTEGER NOT NULL,
    reservoir BOOLEAN DEFAULT FALSE,
    heating BOOLEAN DEFAULT FALSE,
    complex_area_id INTEGER REFERENCES complex(id) ON DELETE CASCADE
);

-- Создание таблицы 'country'
CREATE TABLE country (
    id SERIAL PRIMARY KEY NOT NULL,
    country VARCHAR(64) UNIQUE NOT NULL
);

-- Создание таблицы 'class'
CREATE TABLE "class" (
    id SERIAL PRIMARY KEY NOT NULL,
    class_name VARCHAR(128) UNIQUE NOT NULL
);

-- Создание таблицы 'kind'
CREATE TABLE kind (
    id SERIAL PRIMARY KEY NOT NULL,
    kind VARCHAR(128) UNIQUE NOT NULL,
    class_name_id INTEGER REFERENCES class(id) ON DELETE CASCADE
);

-- Создание таблицы 'animal'
CREATE TABLE animal (
    id SERIAL PRIMARY KEY NOT NULL,
    age INTEGER,
    description TEXT,
    gender VARCHAR(1) CHECK (gender IN ('M', 'F')),
    arrival_date DATE NOT NULL DEFAULT CURRENT_DATE,
    placement_id INTEGER REFERENCES placement(id) ON DELETE SET NULL,
    country_id INTEGER REFERENCES country(id) ON DELETE SET NULL,
    kind_id INTEGER REFERENCES kind(id) ON DELETE SET NULL
);

-- Создание таблицы 'job'
CREATE TABLE job (
    id SERIAL PRIMARY KEY NOT NULL,
    job_title VARCHAR(128) NOT NULL
);

-- Создание таблицы 'employee'
CREATE TABLE employee (
    id SERIAL PRIMARY KEY NOT NULL,
    firstname VARCHAR(64) NOT NULL,
    lastname VARCHAR(64) NOT NULL,
    patronymic VARCHAR(64),
    phone_number CHAR(13) UNIQUE NOT NULL,
    job_id INTEGER REFERENCES job(id) ON DELETE SET NULL,
	CONSTRAINT proper_phone CHECK (phone_number ~* '\+375[0-9]{9}')
);

-- Создание таблицы 'user'
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY NOT NULL,
    username VARCHAR(128) UNIQUE NOT NULL,
    password VARCHAR(128) NOT NULL,
    employee_id INTEGER REFERENCES employee(id) ON DELETE CASCADE
);

-- Создание таблицы 'admin'
CREATE TABLE "admin" (
    id SERIAL PRIMARY KEY NOT NULL,
    address VARCHAR(100),
    phone_number CHAR(13) UNIQUE NOT NULL,
    username VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(128) NOT NULL,
	CONSTRAINT proper_phone CHECK (phone_number ~* '\+375[0-9]{9}')
);

-- Создание таблицы 'animal_food'
CREATE TABLE animal_food (
    id SERIAL PRIMARY KEY NOT NULL,
    animal_id INTEGER REFERENCES animal(id) ON DELETE CASCADE,
    food_id INTEGER REFERENCES food(id) ON DELETE CASCADE
);
