-- Step 1: Create the table
CREATE TABLE StudentScores (
    name VARCHAR(50),
    score INT
);

-- Step 2: Insert values into the table
INSERT INTO StudentScores (name, score)
VALUES ('Alice', 85);

INSERT INTO StudentScores (name, score)
VALUES ('Bob', 92);

INSERT INTO StudentScores (name, score)
VALUES ('Charlie', 78);

INSERT INTO StudentScores (name, score)
VALUES ('Diana', 88);

INSERT INTO StudentScores (name, score)
VALUES ('Eve', 95);

select * from StudentScores

select name,score,RANK() over (order by score desc) as ranking
from StudentScores;

CREATE TABLE StudentScore (
    name VARCHAR(255) NOT NULL,
    score INT NOT NULL,
    subject VARCHAR(255) NOT NULL
);

INSERT INTO StudentScore (name, score, subject)
VALUES 
('Alice', 85, 'Mathematics'),
('Bob', 90, 'Science'),
('Charlie', 78, 'History'),
('Diana', 92, 'Mathematics'),
('Eve', 88, 'Science');

select * from StudentScore

select name,score,subject ,RANK() over (partition by subject order by score desc) as ranking_within_subject
from StudentScore

---dense rank---

select name,score, DENSE_RANK() over (order by score desc) as dense_ranking_within_subject
from StudentScore

CREATE TABLE StudentDetails (
    name VARCHAR(255) NOT NULL,
    score INT NOT NULL,
    class VARCHAR(50) NOT NULL,
    attendance DECIMAL(5, 2) NOT NULL
);

INSERT INTO StudentDetails (name, score, class, attendance)
VALUES 
('Alice', 85, '10A', 95.5),
('Bob', 90, '10B', 98.0),
('Charlie', 78, '10A', 87.0),
('Diana', 92, '10C', 99.0),
('Eve', 88, '10B', 93.0);

select * from StudentDetails

---dense rank----
select name,score,class,attendance ,DENSE_RANK() over (partition by class ORDER BY attendance DESC)
as dense_rank_within_class
from StudentDetails

