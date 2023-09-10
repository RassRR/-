--Создайтетаблицуstudentsсколонками:
CREATE table students (
id SERIAL primary key,
name varchar (200),
total_score INTEGER
);
insert into students (id, name, total_score) values
(1, 'VASIA1', 125),
(2, 'VASIA2', 126),
(3, 'VASIA3', 127);

--Создайте таблицу activity_scores с колонками
CREATE table activity_scores (
foreign (student_id) references students INTEGER,
activity_type TEXT,
score INTEGER
);
insert into activity_scores (student_id, activity_type, score) values
(1, 'exam', 10),
(2, 'exam', 20),
(3, 'exam', 30),
(1, 'HomeW', 14),
(2, 'HomeW', 25),
(3, 'HomeW', 36),
(1, 'exam', 15),
(1, 'exam', 25);
create or replace function update_total_score (student_id integer) 
RETURNS Integer as $$
	DECLARE 
		total_score integer;
	BEGIN 
		SELECT sum(score) into total_score from activity_scores;
	RETURN total_score;
	END;
$$ language plpgsql;
create or replace function update_total_wrappers()
returns trigger as $$
	begin 
		select update_total_score(new.student_id) into new.total_score
		
		return new;
	end; 
$$ language plpgsql;

create trigger update_total_score_trigger
after update on university_scores.activity_scores
for each row 
execute function update_total_wrappers();
	
--select * FROM students;	
--
--SELECT * FROM activity_scores;
----drop table students;