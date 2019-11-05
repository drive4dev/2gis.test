CREATE TABLE IF NOT EXISTS building (
  id serial PRIMARY KEY,
  address varchar(255),
  latitude numeric(7,5),
  longitude numeric(8,5)
);

CREATE INDEX building_lat_lon_idx on building(latitude, longitude);

CREATE TABLE IF NOT EXISTS category (
  id serial PRIMARY KEY,
  name varchar(255) NOT NULL,
  level integer NOT NULL,
  lft integer NOT NULL,
  rgt integer NOT NULL
);

CREATE INDEX category_lft_idx ON category (lft, rgt, level);

CREATE TABLE IF NOT EXISTS company (
 id serial PRIMARY KEY,
 name VARCHAR(255) NOT NULL,
 phones varchar(255),
 building_id integer NOT NULL,
 FOREIGN KEY (building_id) REFERENCES building(id)
);

CREATE TABLE IF NOT EXISTS company_category (
  id serial PRIMARY KEY,
  company_id integer NOT NULL,
  category_id integer NOT NULL,
  FOREIGN KEY (company_id) REFERENCES company(id),
  FOREIGN KEY (category_id) REFERENCES category(id)
);