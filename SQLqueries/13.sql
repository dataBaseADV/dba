#13
SELECT rating, count(rating) 
FROM netflix_titles 
GROUP BY rating 
ORDER BY count(rating)