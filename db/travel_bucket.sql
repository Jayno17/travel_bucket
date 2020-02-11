DROP TABLE cities;
DROP TABLE countries;
DROP TABLE continents;

CREATE TABLE continents(
  id SERIAL primary key,
  name VARCHAR(255) not null
);

CREATE TABLE countries(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) not null,
  continent_id INT references continents(id)
);

CREATE TABLE cities(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  country_id INT references countries(id) ON DELETE CASCADE
  -- visited BOOLEAN
);
