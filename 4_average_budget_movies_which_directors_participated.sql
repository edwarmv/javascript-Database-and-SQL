SELECT
  persons.id as "Director ID",
  CONCAT (persons.first_name, ' ', persons.last_name) as "Director name",
  AVG(movies.budget) as "Average budget"
FROM
  persons
  INNER JOIN movies ON movies.director_id = persons.id
GROUP BY
  persons.id;
