#2
declare
    vtype1 int; 
    vtype2 int;
    vtype3 int;
begin
   select count(*) into vtype3 from netflix_titles;
   select count(*) into vtype1 from netflix_titles where vtype='TV Show';
   select count(*) into vtype2 from netflix_titles where vtype='Movie';
   dbms_output.put_line('TV show '||vtype1/vtype3*100||'% Movie '||vtype2/vtype3*100||'%');
end;