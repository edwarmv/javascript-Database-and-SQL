SELECT
  movies.id as "ID",
  movies.title as "Title",
  movies.release_date as "Release date",
  movies.duration as "Duration(minutes)",
  movies.description as "Description",
  json_agg(files) as "Poster",
  json_build_object('ID', persons.id,'First Name',persons.first_name,'Last Name', persons.last_name) as "Director"
FROM
  movies
LEFT JOIN files ON files.id = movies.poster_id
LEFT JOIN persons ON persons.id = movies.director_id
LEFT JOIN genres on genres.movie_id = movies.id
WHERE
  movies.country_id = 1
  AND movies.release_date >= '2022-01-01'
  AND movies.duration > EXTRACT(
    HOUR
    FROM
      '02:15:00'::time
  ) * 60 + EXTRACT(
    MINUTE
    FROM
      '02:15:00'::time
  )
AND genres."name" in ('Action','Drama')
GROUP BY movies.id, persons.id
;
