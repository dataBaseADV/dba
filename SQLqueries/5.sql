#5
declare
    vint int;
begin
   SELECT max(CONVERT(SUBSTRING_INDEX(select vduration from netflix_titles, " ", 1),int)) into vint; 
   dbms_output.put_line(vint);
end;