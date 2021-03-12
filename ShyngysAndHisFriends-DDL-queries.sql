CREATE TABLE netflix_titles (
  show_id varchar(25) n,
  vtype varchar(25) NOT NULL,
  title varchar(255) NOT NULL,
  director varchar(255) not null,
  vcast varchar(2555) not null,
  vcountry varchar(255) not null,
  vDate date not null,
  vrelease_year int not null,
  vrating varchar(25) not null,
  vduration varchar(25) not null
);

CREATE TABLE netflıx_user (
  firstname varchar(25) not null,
  lastname varchar(25) not null,
  login varchar(25) not null,
  vpassword varchar(25) not null,
  userid int not null
);

CREATE TABLE favourites (
  userid int not null,
  showid varchar(25) not null
);