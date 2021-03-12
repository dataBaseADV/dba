#9
select director, count(director) from netflix_titles group by director order by count(director)