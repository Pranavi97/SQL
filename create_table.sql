-- create table using ddl commands
create TABLE persons(
    id INT NOT NULL,
    person_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    date_of_birth DATE ,
    CONSTRAINT pk_persons_1 PRIMARY KEY(id)
)

-- add columns by using ALTER command

ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL 

