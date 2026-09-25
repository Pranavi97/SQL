-- create table using ddl commands
create table personsons(
    id int not null,
    person_name varchar(50) not null,
    phone_number varchar(15) not null,
    date_of_birth date ,
    constraint pk_persons primary key(id)
)
