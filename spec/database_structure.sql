CREATE EXTENSION IF NOT EXISTS hstore;

DROP TABLE IF EXISTS hstore_records;

CREATE TABLE hstore_records(
  id serial PRIMARY KEY,
  properties hstore
);



DROP TABLE IF EXISTS text_array_records;

CREATE TABLE text_array_records(
  id serial PRIMARY KEY,
  texts text[]
);


DROP TABLE IF EXISTS varchar_array_records;

CREATE TABLE varchar_array_records(
  id serial PRIMARY KEY,
  varchars varchar[]
);


DROP TABLE IF EXISTS integer_array_records;

CREATE TABLE integer_array_records(
  id serial PRIMARY KEY,
  integers integer[]
);



DROP TABLE IF EXISTS float_array_records;

CREATE TABLE float_array_records(
  id serial PRIMARY KEY,
  floats float[]
);



DROP TABLE IF EXISTS decimal_array_records;

CREATE TABLE decimal_array_records(
  id serial PRIMARY KEY,
  decimals decimal[]
);



DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users(
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  email varchar NOT NULL
);



DROP TABLE IF EXISTS bios CASCADE;

CREATE TABLE bios(
  id serial PRIMARY KEY,
  body text NOT NULL,
  website_url varchar NOT NULL,
  author_id integer NOT NULL REFERENCES users
);



DROP TABLE IF EXISTS avatars CASCADE;

CREATE TABLE avatars(
  id serial PRIMARY KEY,
  url varchar NOT NULL,
  author_id integer NOT NULL REFERENCES users
);



DROP TABLE IF EXISTS forums CASCADE;

CREATE TABLE forums(
  id serial PRIMARY KEY,
  name varchar NOT NULL
);



DROP TABLE IF EXISTS posts CASCADE;

CREATE TABLE posts(
  id serial PRIMARY KEY,
  forum_id integer NOT NULL REFERENCES forums,
  author_id integer NOT NULL REFERENCES users,
  subject varchar NOT NULL,
  body varchar NOT NULL
);



DROP TABLE IF EXISTS tags CASCADE;

CREATE TABLE tags(
  id serial PRIMARY KEY,
  name varchar NOT NULL UNIQUE
);



DROP TABLE IF EXISTS posts_tags CASCADE;

CREATE TABLE posts_tags(
  post_id integer NOT NULL REFERENCES posts,
  tag_id integer NOT NULL REFERENCES tags,
  PRIMARY KEY (post_id, tag_id)
);



DROP TABLE IF EXISTS comments CASCADE;

CREATE TABLE comments(
  id serial PRIMARY KEY,
  post_id integer NOT NULL REFERENCES posts,
  name varchar NOT NULL,
  body varchar NOT NULL
);



DROP TABLE IF EXISTS medias CASCADE;

CREATE TABLE medias(
  id serial PRIMARY KEY,
  url varchar NOT NULL
);



DROP TABLE IF EXISTS post_medias CASCADE;

CREATE TABLE post_medias(
  id serial PRIMARY KEY,
  post_id integer NOT NULL REFERENCES posts,
  media_id integer NOT NULL REFERENCES medias
);
