DROP TABLE IF EXISTS beach_equipment;
DROP TABLE IF EXISTS employee_qualifications;
DROP TABLE IF EXISTS lifeguards;
DROP TABLE IF EXISTS beaches;
DROP TABLE IF EXISTS qualifications;
DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS equipment;

-------------------------------------------
/* Creating Tables and Inserting Values  */
-------------------------------------------

CREATE TABLE beaches (
	beach_id int PRIMARY KEY auto_increment,
	beach_name varchar(255) NOT NULL,
    number_of_stations INT
);

INSERT INTO beaches (beach_name, number_of_stations)
VALUES 
    ('Loughshinny', 1),
    ('Balcarrick', 2),
    ('Rush North', 0),
    ('Malahide', 1),
    ('Rush South', 1),
    ('The Brook', 1),
    ('Tower Bay', 0),
    ('Velvet Strand', 3),
    ('Balbriggan', 1),
    ('Claremont', 1),
    ('Skerries South', 1),
    ('Burrow', 1),
    ('Skerries North', 1);

    
CREATE TABLE qualifications (
	qualification_id int PRIMARY KEY auto_increment,
    type varchar(255) NOT NULL,
    duration_yrs int NOT NULL,
    company varchar(255)
);

INSERT INTO qualifications (type, duration_yrs, company)
VALUES 
    ('AED Training', 2, 'RLSS'),
    ('Poolguard', 2, 'IWS'),
    ('Beach Guard', 2, 'RLSS'),
    ('Quad Training', 10, 'FTS'),
    ('Powerboat', 10, 'DLPS'),
    ('Safety boat', 10, 'DLPS');
    
CREATE TABLE managers (
	pay_no INT PRIMARY KEY,
	name varchar(255)  NOT NULL,
    hrly_pay DECIMAL(7,2) NOT NULL
);

INSERT INTO managers (name, pay_no, hrly_pay)
VALUES 
    ('Sheila Smith', 18324, 15.31),
    ('Pat Corrigan', 15356, 25.42),
    ('Dave O Reilly', 17568, 15.31),
    ('Mike Murphy', 18267, 15.31);
    

CREATE TABLE equipment (
	equipment_type varchar(255) PRIMARY KEY,
	company varchar(255) NOT NULL,
    quality_check date NOT NULL,
    cost double NOT NULL
);

INSERT INTO equipment (equipment_type, company, quality_check, cost)
VALUES 
    ('First Aid Kit', 'sports.ie', '2022-01-01', 37.95),
    ('AED', 'Philips', '2021-06-01', 1500.00),
    ('Rescue Board', 'Ishka Sports', '2022-01-01', 1199.00),
    ('Quad Bike', 'The Visor Shop', '2021-09-01', 3962.78),
    ('Power Boat', 'Boats.ie', '2021-09-01', 7500.50);


CREATE TABLE lifeguards (
	pay_no INT PRIMARY KEY,
	name varchar(255) NOT NULL, 
    beach_id INT, 
    hrly_pay DECIMAL(7,2) NOT NULL,
    manager INT, 
    email varchar(255) NOT NULL,
    FOREIGN KEY (beach_id) REFERENCES beaches (beach_id),
    FOREIGN KEY (manager) REFERENCES managers (pay_no)
);

INSERT INTO lifeguards (pay_no, name, beach_id, hrly_pay, manager, email)
VALUES 
    (18324, 'Sheila Smith', 8, 15.31, 15356, 'smiths@gmail.com'),
    (17568, 'Dave O Reilly', 2, 15.31, 15356, 'daveor@gmail.com'),
    (18267, 'Mike Murphy', 8, 15.31, 15356, 'mike.murphy@gmail.com'),
    (21783, 'Roisin Ni Bhriain', 2, 13.21, 17568, 'roisinnib@gmail.com'),
    (21456, 'Aisling Carroll', 1, 13.21, 17568, 'aisc@gmail.com'),
    (20987, 'Oisin McEvoy', 8, 13.21, 18324, 'mcevoyo@gmail.com'),
    (21726, 'Niall Finnegan', 12, 13.21, 18324, 'niallfin@gmail.com'),
    (20867, 'Oisin Rosney', 4, 13.21, 18324, 'rosney@gmail.com'),
    (19567, 'Gearoid Fallon', 5, 13.21, 17568, 'gearoid@gmail.com'),
    (19362, 'Kevin Lamp', 6, 13.21, 18267, 'lampk@gmail.com'),
    (22980, 'Grace McGoldrick', 9, 13.21, 18267, 'gracemcg@gmail.com'),
    (21337, 'Meabh Quinn', 10, 13.21, 18267, 'meabh.quinn@gmail.com'),
    (22972, 'Tom Connors', 11, 13.21, 18267, 'connorst@gmail.com'), 
    (20828, 'Emer O Grady', 13, 13.21, 18324, 'emerog@gmail.com')
    ;

CREATE TABLE employee_qualifications (
	pay_no INT NOT NULL,
    qualification_id INT NOT NULL,
    FOREIGN KEY (pay_no) REFERENCES lifeguards (pay_no),
    FOREIGN KEY (qualification_id) REFERENCES qualifications (qualification_id)
    
);

INSERT INTO employee_qualifications (pay_no, qualification_id)
VALUES 
    (17568, 1),
    (17568, 3),
    (17568, 4),
    (17568, 6),
    (18267, 1),
    (18267, 3),
    (18267, 4),
    (18267, 6),
    (18324, 1),
    (18324, 3),
    (18324, 4),
    (18324, 6),
    (19362, 3),
    (19567, 3),
    (19567, 2),
    (20828, 3),
    (20828, 5),
    (20867, 3),
    (20867, 5),
    (20867, 2),
    (20987, 3),
    (21337, 2),
    (21337, 3),
    (21456, 1),
    (21456, 3),
    (21456, 5),
	(21726, 3),
    (21726, 4),
    (21726, 5),
    (21783, 3),
    (21783, 4),
	(21783, 5),
    (22972, 3),
    (22980, 3),
    (22980, 2)
;

CREATE TABLE beach_equipment (
	beach_id INT NOT NULL,
    equipment_type varchar(255) NOT NULL,
    quantity int NOT NULL,
    FOREIGN KEY (beach_id) REFERENCES beaches (beach_id),
    FOREIGN KEY (equipment_type) REFERENCES equipment (equipment_type)
);

INSERT INTO beach_equipment (beach_id, equipment_type, quantity)
VALUES 
	(2, 'Quad Bike', 2),
    (2, 'First Aid Kit', 2),
    (2, 'AED', 2),
    (2, 'Rescue Board', 3),
    (1, 'First Aid Kit', 1),
    (1, 'AED', 1),
    (3, 'AED', 1),
    (1, 'Rescue Board', 1),
    (4, 'Power Boat', 1),
    (4, 'First Aid Kit', 1),
    (4, 'AED', 1),
    (5, 'AED', 1),
    (5, 'First Aid kit', 1),
    (6, 'AED', 1),
    (6, 'First Aid Kit', 1),
    (6, 'Rescue Board', 1),
    (7, 'AED', 1),
    (8, 'AED', 4),
    (8, 'First Aid Kit', 3),
    (8, 'Rescue Board', 4),
    (9, 'AED', 1),
    (9, 'First Aid Kit', 2),
    (9, 'Power Boat', 1),
    (10, 'AED', 1),
    (10, 'First Aid Kit', 1),
    (10, 'Rescue Board', 2),
    (11, 'AED', 1),
    (11, 'First Aid Kit', 2),
    (11, 'Rescue Board', 1),
    (12, 'AED', 2),
    (12, 'First Aid Kit', 2),
    (12, 'Rescue Board', 3),
    (13, 'AED', 2),
    (13, 'First Aid Kit', 2),
    (13, 'Power Boat', 1)
    ;
    
--------------------------------------
/*			Table Altering			*/
--------------------------------------

-- this adds a column date_started to the lifeguards table --
ALTER TABLE lifeguards
ADD date_started DATE;

-- this adds a column phone_no to the managers table and ensures it is 10 digits --
ALTER TABLE managers
ADD phone_no INT CHECK(length(phone_no) = 10);
    
---------------------------------------
/*			 Triggers				 */
---------------------------------------    
    
DELIMITER $$
CREATE TRIGGER update_pay AFTER INSERT ON employee_qualifications 
	FOR EACH ROW BEGIN
	UPDATE lifeguards SET lifeguards.hrly_pay = lifeguards.hrly_pay + 0.20 WHERE pay_no = new.pay_no;
    UPDATE managers SET managers.hrly_pay = managers.hrly_pay + 0.20 WHERE pay_no = new.pay_no;
	END$$

DELIMITER $$   
CREATE TRIGGER update_equipment BEFORE DELETE ON equipment 
	FOR EACH ROW BEGIN
	DELETE FROM beach_equipment WHERE equipment_type = old.equipment_type;
    END$$
    
    
---------------------------------------
/*				VIEWS				 */
---------------------------------------
    
DROP VIEW IF EXISTS boat_beaches;

CREATE VIEW boat_beaches AS
SELECT beach_name, number_of_stations, quantity
FROM beach_equipment, beaches
WHERE beach_equipment.equipment_type = 'Power Boat' AND beach_equipment.beach_id = beaches.beach_id 
;

DROP VIEW IF EXISTS manager_qualifications;

CREATE VIEW manager_qualifications AS
SELECT lifeguards.name, qualifications.type, email, duration_yrs
FROM managers, qualifications, lifeguards, employee_qualifications
WHERE managers.pay_no = lifeguards.pay_no AND lifeguards.pay_no = employee_qualifications.pay_no AND employee_qualifications.qualification_id = qualifications.qualification_id
;

DROP VIEW IF EXISTS out_of_date_checks;

CREATE VIEW out_of_date_checks AS
SELECT beach_name, equipment.equipment_type, equipment.quality_check
FROM beaches, beach_equipment, equipment
WHERE beaches.beach_id = beach_equipment.beach_id AND equipment.equipment_type = beach_equipment.equipment_type AND equipment.quality_check < '2022-01-01'
ORDER BY beach_name
;


/*		JOINS		*/

-- gets the email of each lifeguard that is also a manager as well as their name --
SELECT lifeguards.name, lifeguards.email
FROM managers
INNER JOIN lifeguards ON managers.pay_no = lifeguards.pay_no
;

-- this shows all the information on the beaches and the lifeguards who work on them --
SELECT *
FROM beaches
LEFT JOIN lifeguards ON lifeguards.beach_id = beaches.beach_id
;

/*		ROLES		*/

DROP ROLE IF EXISTS 'manager';
CREATE ROLE 'manager';

GRANT ALL PRIVILEGES
ON council
TO 'manager'
;

DROP ROLE IF EXISTS 'lifeguard';
CREATE ROLE 'lifeguard';

GRANT SELECT
ON council.beaches 
TO 'lifeguard'
;

GRANT SELECT
ON council.equipment
TO 'lifeguard'
;

GRANT SELECT
ON council.qualifications
TO 'lifeguard'
;