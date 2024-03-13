--No 1

CREATE TABLE Sailor (
    S_id INT NOT NULL, 
    S_name VARCHAR(10),
    S_ratting int,
    S_age  DECIMAL(4,1),
    PRIMARY KEY (S_id)
);

CREATE TABLE Boats (
    B_id INT NOT NULL,
    B_name VARCHAR(10),
    B_color VARCHAR(10),
    PRIMARY KEY(B_id)
);

CREATE TABLE Reserves(
    S_id INT NOT NULL,
    B_id INT NOT NULL,
    R_date DATE,
    FOREIGN KEY(S_id) REFERENCES Sailor(S_id),
    FOREIGN KEY(B_id) REFERENCES Boats(B_id)
);



-- No 2
INSERT INTO Sailor (S_id,S_name,S_ratting,S_age) VALUES (22,"DUstin",7,45.0);
INSERT INTO Sailor (S_id,S_name,S_ratting,S_age) VALUES (29,"Brutus",1,33.0);
INSERT INTO Sailor (S_id,S_name,S_ratting,S_age) VALUES (31,"Lubber",8,55.5);
INSERT INTO Sailor (S_id,S_name,S_ratting,S_age) VALUES (32,"Andy",8,25.5);
INSERT INTO Sailor (S_id,S_name,S_ratting,S_age) VALUES (58,"Rusty",10,35.0);
INSERT INTO Sailor (S_id,S_name,S_ratting,S_age) VALUES (64,"Horatio",7,35.0);
INSERT INTO Sailor (S_id,S_name,S_ratting,S_age) VALUES (71,"Zorba",10,16.0);
INSERT INTO Sailor (S_id,S_name,S_ratting,S_age) VALUES (74,"Horatio",9,35.0);
INSERT INTO Sailor (S_id,S_name,S_ratting,S_age) VALUES (85,"Art",3,25.5);
INSERT INTO Sailor (S_id,S_name,S_ratting,S_age) VALUES (95,"Bob",3,63.5);

INSERT INTO Boats (B_id,B_name,B_color) VALUES (101,"Interlake","Blue");
INSERT INTO Boats (B_id,B_name,B_color) VALUES (102,"Interlake","Red");
INSERT INTO Boats (B_id,B_name,B_color) VALUES (103,"Clipper","Green");
INSERT INTO Boats (B_id,B_name,B_color) VALUES (104,"Marine","Red");

INSERT INTO Reserves (S_id,B_id,R_date) VALUES (22,101,'1998-10-10');
INSERT INTO Reserves (S_id,B_id,R_date) VALUES (22,102,'1998-10-10');
INSERT INTO Reserves (S_id,B_id,R_date) VALUES (22,103,'1998-10-8');
INSERT INTO Reserves (S_id,B_id,R_date) VALUES (22,104,'1998-10-7');
INSERT INTO Reserves (S_id,B_id,R_date) VALUES (31,102,'1998-11-10');
INSERT INTO Reserves (S_id,B_id,R_date) VALUES (31,103,'1998-11-6');
INSERT INTO Reserves (S_id,B_id,R_date) VALUES (31,104,'1998-11-12');
INSERT INTO Reserves (S_id,B_id,R_date) VALUES (64,101,'1998-9-5');
INSERT INTO Reserves (S_id,B_id,R_date) VALUES (64,102,'1998-9-8');
INSERT INTO Reserves (S_id,B_id,R_date) VALUES (74,103,'1998-9-8');

-- No 3 

SELECT S_name, S_id
FROM Sailor
WHERE S_age = 35;

-- No 4

SELECT S_name
FROM Sailor
WHERE S_rating > 5;

-- NO 5

SELECT S_id, B_id, R_date
FROM Reserves
WHERE MONTH(R_date) = 10;

-- NO 6

SELECT DISTINCT Sailor.S_name
FROM Sailor
JOIN Reserves ON Sailor.S_id = Reserves.S_id
JOIN Boats ON Reserves.B_id = Boats.B_id
WHERE Boats.B_color IN ('Red', 'Green');

-- NO 7

SELECT DISTINCT Sailor.S_name
FROM Sailor
JOIN Reserves ON Sailor.S_id = Reserves.S_id
JOIN Boats ON Reserves.B_id = Boats.B_id
WHERE Boats.B_color = 'Red' OR Boats.B_color = 'Green';

-- N0 8

SELECT DISTINCT Sailor.S_name
FROM Sailor
JOIN Reserves ON Sailor.S_id = Reserves.S_id
JOIN Boat ON Reserves.B_id = Boat.B_id
WHERE Boat.B_color = 'Red'
AND Sailor.S_name NOT IN (
    SELECT DISTINCT Sailor.S_name
    FROM Sailor
    JOIN Reserves ON Sailor.S_id = Reserves.S_id
    JOIN Boat ON Reserves.B_id = Boat.B_id
    WHERE Boat.B_color = 'Green'
);
