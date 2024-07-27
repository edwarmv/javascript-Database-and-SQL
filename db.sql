CREATE TABLE countries (
  id INT PRIMARY KEY,
  name VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE files (
  id INT PRIMARY KEY,
  file_name VARCHAR,
  mime_type VARCHAR,
  key VARCHAR,
  url VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE users (
  id INT PRIMARY KEY,
  username VARCHAR,
  first_name VARCHAR,
  last_name VARCHAR,
  email VARCHAR,
  password VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  avatar_id INT REFERENCES files (id)
);

CREATE TABLE persons (
  id INT PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR,
  biography TEXT,
  birth_date DATE,
  gender VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  home_country_id INT REFERENCES countries (id),
  primary_image_id INT REFERENCES files (id)
);

CREATE TABLE person_photos (
  PRIMARY KEY (person_id, file_id),
  person_id INT REFERENCES persons (id),
  file_id INT REFERENCES files (id)
);

CREATE TABLE movies (
  id INT PRIMARY KEY,
  title VARCHAR,
  description TEXT,
  budget NUMERIC,
  release_date DATE,
  duration SMALLINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  director_id INT REFERENCES persons (id),
  poster_id INT REFERENCES files (id),
  country_id INT REFERENCES countries (id)
);

CREATE TABLE genres (
  id INT PRIMARY KEY,
  name VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  movie_id INT REFERENCES movies (id)
);

CREATE TABLE favorite_movies (
  PRIMARY KEY (user_id, movie_id),
  user_id INT REFERENCES users (id),
  movie_id INT REFERENCES movies (id)
);

CREATE TYPE role AS ENUM ('leading', 'supporting', 'background');

CREATE TABLE characters (
  id INT PRIMARY KEY,
  name VARCHAR,
  description TEXT,
  role ROLE,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  person_id INT REFERENCES persons (id),
  movie_id INT REFERENCES movies (id)
);
