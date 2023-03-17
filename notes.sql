
/*
 * DATABASES : 

     * There are many engine of databases  
     * Most used ones are :
                            - InoDB  ; fast Read , slow write, more secure
                            - MyISAM ; slow read ,fast write, less secure

*/
-- ? Create DATABASE : 
CREATE DATABASE `newDataBase` ;
 
--  ? Show DATABASE : 
 SHOW  DATABASES ;

-- ? DELETE DATABASE 
 DROP DATABASE `newDataBase` ;

-- ! IF EXIST - IF NOT EXIST:
DROP DATABASE  `myDbTest` IF EXIST ;

-- ? USE THE DATABSE 
USE   `myDbTest`

/*
* TABLES : 
*/

-- ? Create Table : 
CREATE TABLE search (
id int NOT NULL AUTO_INCREMENT,
q varchar(10) NOT NULL,
place varchar(255) NOT NULL,
active tinyint NOT NULL,
is_saved boolean NOT NULL,
created_at timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
updated_at datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
PRIMARY KEY (id),
CONSTRAINT max_length_q CHECK (LENGTH(q) <= 10),
INDEX idx_q (q)
) ENGINE=InnoDB;

--  ! CHOOSE the engine (optional)
ENGINE = MyISAM
CARACTER SET utf8mb4
COLATE utf8mb4_unicode_ci;

--? Show tables :
SHOW TABLES ;

-- ? DROP table 
 DROP TABLE `user`;

-- ? Show table infos : 
DESCRIBE `user`; 

-- ? Update Table Info
ALTER TABLE `user` 
ADD `phone`VARCHAR(5);
--

ALTER TABLE `user` 
DROP `other_key`;
 -- 
 
ALTER TABLE `user` 
MODIFY `region` SMALLINT;  
--

ALTER TABLE `user` 
CHANGE `updatedAt` `updated_at`  DATE ;

-- ? Show table Status : 
SHOW TABLE STATUS ;


-- ? ForeignKay 
CREATE TABLE job (
id int NOT NULL AUTO_INCREMENT,
id_in_website int NOT NULL ,
title varchar(255) NOT NULL,
published_at date NOT NULL,
place varchar(255) NOT NULL,
salary_hour int NOT NULL,
salary_year int NOT NULL,
mean_salary_hour int NOT NULL,
min_work_hour int NOT NULL,
max_work_hour int NOT NULL,
employer_name varchar(255) NOT NULL,
email varchar(255) NOT NULL UNIQUE,
is_scraped tinyint NOT NULL DEFAULT false,
is_applied tinyint NOT NULL DEFAULT false,
is_negotiable tinyint NOT NULL DEFAULT false,
is_validate tinyint NOT NULL DEFAULT false,
req_license tinyint NOT NULL,
created_at timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
updated_at datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
searchId int NULL,
UNIQUE INDEX IDX_909e019cbbdb533ad6f74ea2f9 (id_in_website),
PRIMARY KEY (id),
CONSTRAINT fk_search_id
FOREIGN KEY (search_id)
REFERENCES search (id)
ON DELETE SET NULL

) ENGINE=InnoDB;


-- mythos  many to Many
id      |  user    |   mytho 
1            1            3  
2            2            4
3            5            1
4            5            2
5            5            3
6            5            4
7            5            5

/*
* SELECT
*/
-- ? Select 
Select * FROM job ;

--  ? Betweee  
SELECT id ,salary_hour FROM job WHERE 
salary_hour BETWEEN 0 AND 44.39; 

--? 0=Select Left join

SELECT job.*, search.q
FROM job
LEFT JOIN search ON job.search_id = search.id;

-- ? Insert : 
INSERT INTO search (q, active)
VALUES (q='Ux Designer', active=false);

-- ? update 
 UPDATE `search` SET active=1 WHERE  active=0 ;

-- ?  Delete  
DELETE FROM search WHERE q='Ux Designer' ;

-- ? order by
 SELECT id , title , email FROM job ORDER BY title ASC;

-- ? LIMIT
SELECT id , title , email FROM job LIMIT 10 ;

-- ? OFFSET
SELECT id , title , email FROM job LIMIT 10 OFFSET 10 ;

-- ?  Group by
SELECT searchId, COUNT(*) as nb_jobs, AVG(salary_hour) as avg_salary_hour, MAX(salary_hour) as max_salary_hour, MIN(salary_hour) as min_salary_hour
FROM job WHERE salary_hour !=""
AND salary_hour !=""
GROUP BY searchId;

