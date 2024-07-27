select
	movies.id as "ID",
	movies.title as "Title",
	movies.release_date as "Release date",
	movies.duration as "Duration(minutes)",
	movies.description as "Description",
	row_to_json(files) as "Poster",
	json_build_object('ID',
	persons.id,
	'First Name',
	persons.first_name,
	'Last Name',
	persons.last_name,
	'Photo',
	json_agg(director_photo)) as "Director",
	json_agg(json_build_object('ID',
	actors.id,
	'First Name',
	actors.first_name,
	'Last Name',
	actors.last_name,
	'Photo',
	row_to_json(actors_photos)
	)) as "Actors",
	json_build_object('ID',
	genres.id,
	'Name',
	genres."name")
from
	movies
left join files on
	files.id = movies.poster_id
left join persons on
	persons.id = movies.director_id
left join "characters" on
	"characters".movie_id = movies.id
left join persons actors on
	"characters".person_id = actors.id
left join files actors_photos on
	actors_photos.id = actors.primary_image_id
left join genres on
	genres.movie_id = movies.id
left join files director_photo on
	director_photo.id = persons.primary_image_id
where
	movies.country_id = 1
	and movies.release_date >= '2022-01-01'
	and movies.duration > extract(
    hour
from
	'02:15:00'::time
  ) * 60 + extract(
    minute
from
	'02:15:00'::time
  )
	and genres."name" in ('Action', 'Drama')
group by
	movies.id,
	persons.id,
	files.id,
	genres.id
;
