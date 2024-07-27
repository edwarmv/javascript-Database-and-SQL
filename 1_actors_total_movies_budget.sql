SELECT
  persons.id as "ID",
  persons.first_name as "First name",
  persons.last_name as "Last name",
  SUM(movies.budget) as "Total movies budget"
FROM
  persons
  INNER JOIN "characters" ON "characters".person_id = persons.id
  INNER JOIN movies ON movies.id = "characters".movie_id
GROUP BY
  persons.id;
