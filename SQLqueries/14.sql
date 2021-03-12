#14
SELECT released_year,MAX (mycount) 
FROM (SELECT released_year,COUNT(released_year) mycount 
FROM netflix_titles
GROUP BY released_year);