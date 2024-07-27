SELECT
  movies.id as "ID",
  movies.title as "Title",
  COUNT(persons.id) as "Actors count"
FROM
  movies
  LEFT JOIN "characters" ON "characters".movie_id = movies.id
  LEFT JOIN persons ON persons.id = characters.person_id
WHERE
  movies.release_date >= NOW () - INTERVAL '5 years'
GROUP BY
  movies.id;
