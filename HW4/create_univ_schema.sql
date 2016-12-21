create table student(ID integer not null, name varchar not null, dept_name varchar not null, tot_cred integer not null);

create table takes(ID integer not null, course_id integer not null, sec_id integer not null, semester varchar not null, year integer not null, grade varchar not null);

create table section(course_id integer not null, sec_id integer not null, semester varchar not null, year integer not null, building varchar not null, room_no integer not null, time_slot_id integer not null);

create table course(course_id integer not null, title varchar not null, dept_name var char not null, credits integer not null);