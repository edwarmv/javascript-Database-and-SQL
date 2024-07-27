# JavaScript: Database And SQL Homework

## ER Diagram

``` mermaid
---
title: Movie App DB
---
erDiagram
users {
    username varchar
    first_name varchar
    last_name varchar
    email varchar
    password varchar
    created_at timestamp
    updated_at timestamp
    avatar_id integer
}

users ||--o| files : "has an avatar"
users }|--|{ movies : "has favorite movies"

files {
    file_name varchar
    mime_type varchar
    key varchar
    url varchar
    created_at timestamp
    updated_at timestamp
    person_id integer
}

movies {
    title varchar
    description text
    budget numeric
    release_date date
    duration smallint
    created_at timestamp
    updated_at timestamp
    director_id integer
    poster_id integer
    country_id integer
}

movies }|--|| persons : "has a director"
movies ||--|| files : "has a poster"
movies ||--|| countries : "is produced in a country"
movies }|--|{ genres : "is produced in a country"
movies }|--|{ characters : "have characters"

countries {
    name varchar
    created_at timestamp
    updated_at timestamp
}

genres {
    name varchar
    created_at timestamp
    updated_at timestamp
}

characters {
    name varchar
    description text
    role enum
    created_at timestamp
    updated_at timestamp
    person_id integer
}

characters ||--o{ persons : "can be played by a person"

persons {
    first_name varchar
    last_name varchar
    biography text
    birth_date date
    gender varchar
    created_at timestamp
    updated_at timestamp
    home_country_id integer
    primary_image_id integer
}

persons ||--|| countries : "has a home country"
persons ||--|| files : "has a primary image"
persons ||--|{ files : "has photos"
```
