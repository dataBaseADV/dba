#15
UPDATE netflix_titles
SET duration = REPLACE(duration, 'min', '')
WHERE number like '%min%'

select avg(duration) from netflix_titles;