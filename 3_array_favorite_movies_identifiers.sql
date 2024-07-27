SELECT
  users.id as "ID",
  users.username as "Username",
  array_agg (favorite_movies.movie_id) as "Favorite movie IDs"
FROM
  users
  LEFT JOIN favorite_movies ON favorite_movies.user_id = users.id
GROUP BY
  users.id;
