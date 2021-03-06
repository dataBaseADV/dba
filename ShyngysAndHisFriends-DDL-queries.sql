
CREATE TABLE Vusers
(
IDnum int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255) NOT NULL,
Rating varchar(255) NOT NULL
);

CREATE TABLE Recipes (
    Title varchar(255) NOT NULL,
    Vtime int NOT NULL,
    Servings varchar(255) NOT NULL,
    Ingredients varchar(255) NOT NULL,
    Instructions varchar(255) NOT NULL,
    Image varchar(255) NOT NULL
);