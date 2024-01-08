# DATA MODELS AND DATABASE MANAGEMENT SYSTEMS
## Topic: Zoo App
Berdnik Lyubov 153502

## Functional requirements
* User authorization
* The role system (roles: USER, ADMIN)
* CRUD for all entities (ADMIN)
* Info for all entities (USER)
* Buy ticket and get cashback (USER)

## Use cases
* Non-authorized user
  * See animals list
  * See zoo complexes list
  * See zoo placements list
  * See zoo kinds list
  * See zoo classes list
  * See zoo countries list
  * See zoo food list
  * See zoo employees list
  * See zoo jobs list
  * Authorize
* Authorized user
  * User
    * See animals list
    * See zoo complexes list
    * See zoo placements list
    * See zoo kinds list
    * See zoo classes list
    * See zoo countries list
    * See zoo food list
    * See zoo employees list
    * See zoo jobs list
    * Logout
    * Buy ticket
    * Get cashback
  * Admin
    * CRUD all entities data

## Entities
1. `food`
   * id SERIAL PRIMARY KEY NOT NULL,
   * food VARCHAR(256) NOT NULL
2. `complex`
   * id SERIAL PRIMARY KEY NOT NULL,
   * complex_name VARCHAR(128) NOT NULL
3. `placement`
   * id SERIAL PRIMARY KEY NOT NULL,
   * name VARCHAR(128) DEFAULT '',
   * number INTEGER NOT NULL,
   * reservoir BOOLEAN,
   * heating BOOLEAN,
   * complex_area_id INTEGER REFERENCES complex(id) ON DELETE CASCADE
4. `country`
   * id SERIAL PRIMARY KEY NOT NULL,
   * country VARCHAR(64) UNIQUE NOT NULL
5. `class`
   * id SERIAL PRIMARY KEY NOT NULL,
   * class_name VARCHAR(128) UNIQUE NOT NULL
6. `kind`
   * id SERIAL PRIMARY KEY NOT NULL,
   * kind VARCHAR(128) UNIQUE NOT NULL,
   * class_name_id INTEGER REFERENCES class(id) ON DELETE CASCADE
7. `animal`
   * id SERIAL PRIMARY KEY NOT NULL,
   * age INTEGER,
   * description TEXT,
   * gender VARCHAR(1) CHECK (gender IN ('M', 'F')),
   * arrival_date DATE NOT NULL,
   * img VARCHAR,
   * placement_id INTEGER REFERENCES placement(id) ON DELETE SET NULL,
   * country_id INTEGER REFERENCES country(id) ON DELETE SET NULL,
   * kind_id INTEGER REFERENCES kind(id) ON DELETE SET NULL
8. `job`
   * id SERIAL PRIMARY KEY NOT NULL,
   * job_title VARCHAR(128) NOT NULL
9. `employee`
   * id SERIAL PRIMARY KEY NOT NULL,
   * firstname VARCHAR(128) NOT NULL,
   * lastname VARCHAR(128) NOT NULL,
   * patronymic VARCHAR(128),
   * phone VARCHAR(32) UNIQUE,
   * job_id INTEGER REFERENCES job(id) ON DELETE SET NULL
10. `user`
    * id SERIAL PRIMARY KEY NOT NULL,
    * username VARCHAR(150) UNIQUE NOT NULL,
    * password VARCHAR(128) NOT NULL,
    * employee_id INTEGER REFERENCES employee(id) ON DELETE CASCADE
11. `admin`
    * id SERIAL PRIMARY KEY NOT NULL,
    * address VARCHAR(100),
    * phone_number VARCHAR(20) CHECK (phone_number ~ E'^\\+375 \\(\\d{2}\\) \\d{3}-\\d{2}-\\d{2}$'),
    * username VARCHAR(150) UNIQUE NOT NULL,
    * password_hash VARCHAR(128) NOT NULL
12. `animal_food`
    * id SERIAL PRIMARY KEY NOT NULL,
    * animal_id INTEGER REFERENCES animal(id) ON DELETE CASCADE,
    * food_id INTEGER REFERENCES food(id) ON DELETE CASCADE
13. `orders`
    * id SERIAL PRIMARY KEY NOT NULL,
    * user_id INTEGER REFERENCES user(id) ON DELETE CASCADE,
    * complex_id INTEGER REFERENCES complex(id) ON DELETE CASCADE
14. `cashback`
    * id SERIAL PRIMARY KEY NOT NULL,
    * user_id INTEGER REFERENCES user(id) ON DELETE CASCADE,
    * cashback INTEGER NOT NULL
## Block-scheme
![Entity diagram](https://github.com/lberdnik/zoo-app/blob/main/диаграмма.png)
