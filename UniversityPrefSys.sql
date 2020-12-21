create table university (
	id serial not null,
	name varchar(100) not null,
	address varchar(100) not null,
	city varchar(30) not null,
	email varchar(100) not null,
	university_type varchar(10) not null,
	foundation_year int not null,
	CONSTRAINT "pk_universityid" PRIMARY KEY("id"),
	CONSTRAINT "un_email" UNIQUE("email"),
	CONSTRAINT "un_name" UNIQUE("name")
);

create table faculty (
	id serial not null,
	name varchar(150) not null,
	email varchar(150) not null,
	university_id int,
	CONSTRAINT "pk_facultyid" PRIMARY KEY("id"),
	CONSTRAINT "un_facemail" UNIQUE("email"),
	CONSTRAINT "for_key_universityid" FOREIGN KEY("university_id")
	REFERENCES university("id") match simple
	ON UPDATE CASCADE ON DELETE CASCADE
);

create table department (
	id serial not null,
	faculty_id int,
	name varchar(150) not null,
	email varchar(150) not null,
	language varchar(50) not null,
	education_type varchar(50) not null,
	quota int not null,
	spec int,
	period int not null,
	min_score double precision not null,
	min_order int not null,
	CONSTRAINT "pk_departmentid" PRIMARY KEY("id"),
	CONSTRAINT "un_depemail" UNIQUE("email"),
	CONSTRAINT "for_key_facultyid" FOREIGN KEY("faculty_id")
	REFERENCES faculty("id") match simple
	ON UPDATE CASCADE ON DELETE CASCADE
);

create table student (
	id int not null,
	name varchar(100) not null,
	surname varchar(100) not null,
	exam_score float not null,
	rank int not null,
	hs_position int not null,
	CONSTRAINT "pk_studentid" PRIMARY KEY("id")
);

create table studentdepartment_pref (
	student_id integer not null,
    	department_id integer not null,
	order_of_pref int not null,
    	CONSTRAINT pk_student_department PRIMARY KEY (student_id, department_id),
    	CONSTRAINT for_key_studentid FOREIGN KEY ("student_id")
   	 REFERENCES student("id")
	MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE,
    	CONSTRAINT for_key_departmentid FOREIGN KEY ("department_id")
	REFERENCES department("id") 
	MATCH SIMPLE ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO university (name, address, city, email, university_type, foundation_year)
    VALUES ('Dokuz Eylül University', 'Buca', 'İzmir', 'deü@gmail.com', 'devlet', '1982');

INSERT INTO university (name, address, city, email, university_type, foundation_year)
    VALUES ('Yasar University', 'Bornova', 'İzmir', 'yü@gmail.com', 'vakıf', '2001');
	
INSERT INTO university (name, address, city, email, university_type, foundation_year)
    VALUES ('Erciyes University', 'Talas', 'Kayseri', 'erü@gmail.com', 'devlet', '1978');

INSERT INTO university (name, address, city, email, university_type, foundation_year)
    VALUES ('Izmir Technical University', 'Urla', 'İzmir', 'iyte@gmail.com', 'devlet', '1992');

INSERT INTO university (name, address, city, email, university_type, foundation_year)
    VALUES ('Izmir University', 'Üçkuyular', 'İzmir', 'iü@gmail.com', 'devlet', '2007');

INSERT INTO university (name, address, city, email, university_type, foundation_year)
    VALUES ('Ege University', 'Bornova', 'İzmir', 'eü@gmail.com', 'devlet', '1955');
	
INSERT INTO university (name, address, city, email, university_type, foundation_year)
    VALUES ('Izmir Ekonomi University', 'Bornovaa', 'İzmir', 'ieü@gmail.com', 'vakıf', '2005');
	
INSERT INTO faculty (name, email, university_id)
    VALUES ('Faculty of Engineering', 'deümüh@gmail.com', '1');

INSERT INTO faculty (name, email, university_id)
    VALUES ('Faculty of Medicine', 'deütıp@gmail.com', '1');
	
INSERT INTO faculty (name, email, university_id)
    VALUES ('Faculty of Law', 'deühukuk@gmail.com', '1');
	
INSERT INTO faculty (name, email, university_id)
    VALUES ('Faculty of Engineering', 'yümüh@gmail.com', '2');

INSERT INTO faculty (name, email, university_id)
    VALUES ('Faculty of Engineering', 'erümüh@gmail.com', '3');
	
INSERT INTO faculty (name, email, university_id)
    VALUES ('Faculty of Medicine', 'erütıp@gmail.com', '3');
	
INSERT INTO faculty (name, email, university_id)
    VALUES ('Faculty of Engineering', 'iytemüh@gmail.com', '4');
	
INSERT INTO faculty (name, email, university_id)
    VALUES ('Faculty of Engineering', 'izmirmüh@gmail.com', '5');
	
INSERT INTO faculty (name, email, university_id)
    VALUES ('Faculty of Engineering', 'eümüh@gmail.com', '6');
	
INSERT INTO faculty (name, email, university_id)
    VALUES ('Faculty of Medicine', 'eütıp@gmail.com', '6');
	
INSERT INTO faculty (name, email, university_id)
    VALUES ('Faculty of Law', 'eühukuk@gmail.com', '6');

INSERT INTO faculty (name, email, university_id)
    VALUES ('Faculty of Engineering', 'ieümüh@gmail.com', '7');
	
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('1', 'Computer Engineering', 'deüceng@gmail.com', 'English', 
			'öö', '90', 3, '4', '425.12447', '37082');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('1', 'Electirical-Electronics Engineering', 'deüeee@gmail.com', 'English', 
			'öö', '90', 3, '4', '418.06950', '41111');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('1', 'Mechanical Engineering', 'deümakine@gmail.com', 'Turkish', 
			'öö', '105', 5, '4', '395.47115', '55209');
	
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('1', 'Mechanical Engineering', 'deümakine2@gmail.com', 'Turkish', 
			'iö', '105', 0, '4', '368.18479', '75597');	

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('1', 'Civil Engineering', 'deüinsaat2@gmail.com', 'Turkish', 
			'öö', '100', 4, '4', '385.17519', '	62422');

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('1', 'Civil Engineering', 'deüinsaat@gmail.com', 'Turkish', 
			'iö', '100', 4, '4', '355.98790', '	86326');

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('2', 'Medicine', 'deütıp@gmail.com', 'Turkish',
			'öö', '250', 5, '6', '504.43670', '4849');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('2', 'Nursing', 'deühemşire@gmail.com', 'Turkish',
			'öö', '240', 5, '4', '318.01076', '129700');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('2', 'Physiotherapy', 'deüfiz@gmail.com', 'Turkish',
			'öö', '110', 3, '4', '365.75030', '77639');

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('3', 'Law', 'deühukuk@gmail.com', 'Turkish',
			'öö', '480', 3, '4', '403.46036', '15866');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('3', 'Psychology', 'deüpsiko@gmail.com', 'Turkish',
			'öö', '100', 1, '4', '382.72822', '31616');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('3', 'Sociology', 'deüsos@gmail.com', 'Turkish',
			'öö', '60', 0, '4', '296.80938', '198845');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('3', 'Sociology', 'deüsos2@gmail.com', 'Turkish',
			'iö', '60', 0, '4', '272.74018', '303824');

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('4', 'Computer Engineering', 'yüceng@gmail.com', 'English',
			'öö', '44', 0, '4', '361.47049', '81353');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('4', 'Electrical-Electronic Engineering', 'yüeee@gmail.com', 'English',
			'öö', '55', 0, '4', '348.12517', '93822');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('4', 'Industrial Engineering', 'yüie@gmail.com', 'English',
			'öö', '64', 0, '4', '267.69849', '230701');
		
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('4', 'Architecture', 'yüarc@gmail.com', 'English',
			'öö', '84', 0, '4', '361.36782', '81459');

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('5', 'Computer Engineering', 'erüceng@gmail.com', 'Turkish',
			'öö', '85', 2, '4', '333.03138', '110276');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('5', 'Computer Engineering', 'erüceng2@gmail.com', 'Turkish',
			'iö', '85', 0, '4', '294.69200', '167533');
	
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('5', 'Industrial Engineering', 'erüie@gmail.com', 'Turkish',
			'öö', '80', 0, '4', '291.90854', '172878');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('5', 'Industrial Engineering', 'erüie2@gmail.com', 'Turkish',
			'iö', '80', 0, '4', '264.71325', '239567');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('5', 'Civil Engineering', 'erüinsaat@gmail.com', 'Turkish',
			'öö', '90', 0, '4', '324.68902', '120773');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('5', 'Civil Engineering', 'erüinsaat2@gmail.com', 'Turkish',
			'iö', '90', 0, '4', '296.76002', '163625');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('5', 'Mechanical Engineering', 'erümakine@gmail.com', 'Turkish',
			'öö', '100', 0, '4', '291.80699', '173088');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('5', 'Mechanical Engineering', 'erümakine2@gmail.com', 'Turkish',
			'iö', '100', 0, '4', '270.05382', '224095');

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('6', 'Medicine', 'erümedicine@gmail.com', 'Turkish',
			'öö', '270', 3, '6', '489.14418', '10635');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('6', 'Dentist', 'erüdis@gmail.com', 'Turkish',
			'öö', '110', 2, '4', '461.87134', '23346');

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('7', 'Computer Engineering', 'iyteceng@gmail.com', 'Turkish',
			'öö', '60', 0, '4', '447.00268', '25734');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('7', 'Civil Engineering', 'iyteinsaat@gmail.com', 'Turkish',
			'öö', '60', 0, '4', '401.55527', '51245');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('7', 'Chemistery Engineering', 'iytekimya@gmail.com', 'Turkish',
			'öö', '60', 0, '4', '369.13426', '74806');

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('8', 'Computer Engineering', 'izmirceng@gmail.com', 'Turkish',
			'öö', '70', 2, '4', '400.00268', '65896');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('8', 'Civil Engineering', 'izmirinsaat@gmail.com', 'Turkish',
			'öö', '70', 2, '4', '345.07868', '104275');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('8', 'Mechanical Engineering', 'izmirmakine@gmail.com', 'Turkish',
			'öö', '70', 2, '4', '335.78512', '112274');

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('9', 'Computer Engineering', 'eüceng@gmail.com', 'English',
			'öö', '100', 3, '4', '430.49316', '34157');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('9', 'Mechanical Engineering', 'eümakine@gmail.com', 'English',
			'öö', '80', 1, '4', '407.98429', '47127');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('9', 'Civil Engineering', 'eüinsaat@gmail.com', 'English',
			'öö', '60', 0, '4', '399.18119', '52735');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('9', 'Electrical-Electronics Engineering', 'eüeee@gmail.com', 'English',
			'öö', '80', 1, '4', '417.59504', '41366');

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('10', 'Medicine', 'eümedicine@gmail.com', 'English',
			'öö', '340', 3, '6', '510.39907', '3677');

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('11', 'Psychology', 'eüpsiko@gmail.com', 'Turkish',
			'öö', '100', 1, '4', '391.86139', '23825');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('11', 'Sociology', 'eüsos@gmail.com', 'Turkish',
			'öö', '70', 0, '4', '308.63747', '160566');

INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('12', 'Computer Engineering', 'ieüceng@gmail.com', 'English',
			'öö', '44', 0, '4', '407.33432', '47536');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('12', 'Electrical-Electronics Engineering', 'ieüeee@gmail.com', 'English',
			'öö', '60', 0, '4', '374.85676', '70240');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('12', 'Industrial Engineering', 'ieüie@gmail.com', 'English',
			'öö', '55', 0, '4', '397.07123', '54139');
			
INSERT INTO department (faculty_id, name, email, language, 
						education_type, quota, spec, period, min_score, min_order)
    VALUES ('12', 'Aviation and Aerospace Engineering', 'ieüaae@gmail.com', 'English',
			'öö', '30', 0, '4', '281.77961', '194416');

INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1001', 'Arif', 'Mertaslan', '511', '1453', '1');
			
INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1002', 'Selçuk', 'İnan', '385', '154687', '35');
	
INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1003', 'Emre', 'Akbaba', '435', '34578', '6');
			
INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1004', 'Ömer', 'Bayram', '415', '48769', '10');
			
INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1005', 'Ozan', 'Kabak', '478', '8435', '8');
	
INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1006', 'Çağlar', 'Söyüncü', '428', '39976', '19');
	
INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1007', 'Merih', 'Demiral', '373', '184658', '54');
			
INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1008', 'Adem', 'Büyük', '274', '224568', '121');
	
INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1009', 'Ahmet', 'Çalık', '430', '30974', '14');
	
INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1010', 'Cengiz', 'Ünder', '312', '200154', '99');
			
INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1011', 'Burak', 'Yılmaz', '431', '35472', '8');
	
INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1012', 'İmparator Fatih', 'Terim', '540', '1', '1');
	
INSERT INTO student (id, name, surname, exam_score, rank, hs_position)
    VALUES ('1013', 'Bülent', 'Korkmaz', '413', '50423', '23');

INSERT INTO studentdepartment_pref (student_id, department_id, order_of_pref)
	VALUES (1001, 1, 1),
		   (1001, 7, 2),
		   (1001, 35, 3);
		   
INSERT INTO studentdepartment_pref (student_id, department_id, order_of_pref)
	VALUES (1002, 1, 1),
		   (1002, 4, 2),
		   (1002, 3, 3);
		   
INSERT INTO studentdepartment_pref (student_id, department_id, order_of_pref)
	VALUES (1003, 24, 1),
		   (1003, 44, 2),
		   (1003, 42, 3);
		
INSERT INTO studentdepartment_pref (student_id, department_id, order_of_pref)
	VALUES (1004, 1, 1),
		   (1004, 15, 2),
		   (1004, 19, 3);
		   
INSERT INTO studentdepartment_pref (student_id, department_id, order_of_pref)
	VALUES (1005, 33, 1),
		   (1005, 13, 2),
		   (1005, 14, 3);
		   
INSERT INTO studentdepartment_pref (student_id, department_id, order_of_pref)
	VALUES (1006, 3, 1),
		   (1006, 41, 2),
		   (1006, 27, 3);
		   
INSERT INTO studentdepartment_pref (student_id, department_id, order_of_pref)
	VALUES (1007, 16, 1),
		   (1007, 11, 2),
		   (1007, 26, 3);
		
INSERT INTO studentdepartment_pref (student_id, department_id, order_of_pref)
	VALUES (1008, 44, 1),
		   (1008, 39, 2),
		   (1008, 27, 3);
		   
INSERT INTO studentdepartment_pref (student_id, department_id, order_of_pref)
	VALUES (1009, 1, 1),
		   (1009, 2, 2),
		   (1009, 3, 3);
		   
INSERT INTO studentdepartment_pref (student_id, department_id, order_of_pref)
	VALUES (1010, 12, 1),
		   (1010, 13, 2),
		   (1010, 18, 3);
		   
INSERT INTO studentdepartment_pref (student_id, department_id, order_of_pref)
	VALUES (1011, 22, 1),
		   (1011, 35, 2),
		   (1011, 9, 3);
		
INSERT INTO studentdepartment_pref (student_id, department_id, order_of_pref)
	VALUES (1012, 6, 1),
		   (1012, 13, 2),
		   (1012, 31, 3);

/* QUERY 1 */
SELECT * FROM university WHERE foundation_year > 1990 and city LIKE 'İ%';
/*
2	"Yasar University"				"Bornova"	"İzmir"	"yü@gmail.com"	"vakıf"			2001
4	"Izmir University"				"Üçkuyular"	"İzmir"	"iü@gmail.com"	"devlet"		2007
5	"Izmir Technical University"	"Urla"		"İzmir"	"iyte@gmail.com"	"devlet"	1992
7	"Izmir Ekonomi University"		"Bornovaa"	"İzmir"	"ieü@gmail.com"	"devlet"		2005
*/

/* QUERY 2 */
SELECT * FROM university WHERE id IN(SELECT university_id FROM faculty WHERE name LIKE '%Engineering' INTERSECT SELECT university_id FROM faculty WHERE name LIKE '%Medicine');
/*
3	"Erciyes University"		"Talas"		"Kayseri"	"erü@gmail.com"	"devlet"	1978
6	"Ege University"			"Bornova"	"İzmir"		"eü@gmail.com"	"devlet"	1955
1	"Dokuz Eylül University"	"Buca"		"İzmir"		"deü@gmail.com"	"devlet"	1982
*/

/* QUERY 3 */
SELECT COUNT(*) FROM faculty WHERE university_id IN(SELECT id FROM university WHERE university_type LIKE 'devlet')
UNION
SELECT COUNT(*) FROM faculty WHERE university_id IN(SELECT id FROM university WHERE university_type LIKE 'vakıf');
/*
vakıf --> 2
devlet --> 10
*/

/* QUERY 4 */
SELECT * FROM department WHERE education_type = 'iö' and name LIKE '%Engineering';
/*
4	1	"Mechanical Engineering"	"deümakine2@gmail.com"	"Turkish"	"iö"	105	0	4	368.18479	75597
6	1	"Civil Engineering"			"deüinsaat@gmail.com"	"Turkish"	"iö"	100	4	4	355.9879	86326
19	5	"Computer Engineering"		"erüceng2@gmail.com"	"Turkish"	"iö"	85	0	4	294.692		167533
21	5	"Industrial Engineering"	"erüie2@gmail.com"		"Turkish"	"iö"	80	0	4	264.71325	239567
23	5	"Civil Engineering"			"erüinsaat2@gmail.com"	"Turkish"	"iö"	90	0	4	296.76002	163625
25	5	"Mechanical Engineering"	"erümakine2@gmail.com"	"Turkish"	"iö"	100	0	4	270.05382	224095
*/

/* QUERY 5 */
SELECT * FROM department ORDER BY period DESC, min_score DESC LIMIT 5;
/*
38	10	"Medicine"				"eümedicine@gmail.com"	"English"	"öö"	340	3	6	510.39907	3677
7	2	"Medicine"				"deütıp@gmail.com"		"Turkish"	"öö"	250	5	6	504.4367	4849
26	6	"Medicine"				"erümedicine@gmail.com"	"Turkish"	"öö"	270	3	6	489.14418	10635
27	6	"Dentist"				"erüdis@gmail.com"		"Turkish"	"öö"	110	2	4	461.87134	23346
28	7	"Computer Engineering"	"iyteceng@gmail.com"	"Turkish"	"öö"	60	0	4	447.00268	25734
*/

/* QUERY 6 */
SELECT * FROM department WHERE period = '4' and id IN(SELECT department_id FROM studentdepartment_pref GROUP BY department_id ORDER BY COUNT(*) DESC) LIMIT 1;
/*
1	1	"Computer Engineering"	"deüceng@gmail.com"	"English"	"öö"	90	3	4	425.12447	37082
*/

/* QUERY 7 */
SELECT * FROM student WHERE id IN(SELECT student_id FROM studentdepartment_pref WHERE order_of_pref = '1' and department_id IN(SELECT id FROM department WHERE name LIKE 'Computer Engineering'));
/*
1002	"Selçuk"	"İnan"		385	154687	35
1004	"Ömer"		"Bayram"	415	48769	10
1001	"Arif"		"Mertaslan"	511	1453	1
1009	"Ahmet"		"Çalık"		430	30974	14
*/

/* QUERY 8 */
UPDATE faculty SET email = 'iytenewmüh@gmail.com', university_id = (SELECT id FROM University WHERE name = 'Izmir Technical University')
WHERE university_id IN(SELECT id FROM university WHERE name = 'Dokuz Eylül University') and name = 'Faculty of Engineering';
/*
UPDATED FACULTY:
1	"Faculty of Engineering"	"deümüh@gmail.com"	1

TO:
1	"Faculty of Engineering"	"iytenewmüh@gmail.com"	4
*/

/* QUERY 9 */
UPDATE department SET period = period + 1 WHERE faculty_id IN(SELECT id FROM faculty WHERE name LIKE 'Faculty of Law');
/*
UPDATED DEPARTMENTS:
10	3	"Law"			"deühukuk@gmail.com"	"Turkish"	"öö"	480	3	4	403.46036	15866
11	3	"Psychology"	"deüpsiko@gmail.com"	"Turkish"	"öö"	100	1	4	382.72822	31616
12	3	"Sociology"		"deüsos@gmail.com"		"Turkish"	"öö"	60	0	4	296.80938	198845
13	3	"Sociology"		"deüsos2@gmail.com"		"Turkish"	"iö"	60	0	4	272.74018	303824
39	11	"Psychology"	"eüpsiko@gmail.com"		"Turkish"	"öö"	100	1	4	391.86139	23825
40	11	"Sociology"		"eüsos@gmail.com"		"Turkish"	"öö"	70	0	4	308.63747	160566

TO:
10	3	"Law"			"deühukuk@gmail.com"	"Turkish"	"öö"	480	3	5	403.46036	15866
11	3	"Psychology"	"deüpsiko@gmail.com"	"Turkish"	"öö"	100	1	5	382.72822	31616
12	3	"Sociology"		"deüsos@gmail.com"		"Turkish"	"öö"	60	0	5	296.80938	198845
13	3	"Sociology"		"deüsos2@gmail.com"		"Turkish"	"iö"	60	0	5	272.74018	303824
39	11	"Psychology"	"eüpsiko@gmail.com"		"Turkish"	"öö"	100	1	5	391.86139	23825
40	11	"Sociology"		"eüsos@gmail.com"		"Turkish"	"öö"	70	0	5	308.63747	160566
*/

/* QUERY 10 */
DELETE FROM faculty WHERE university_id IN(SELECT id FROM university WHERE name LIKE 'Izmir University');
/*
DELETED FACULTY: 
8	"Faculty of Engineering"	"izmirmüh@gmail.com"	5

DELETED DEPARTMENTS:
31	8	"Computer Engineering"		"izmirceng@gmail.com"	"Turkish"	"öö"	70	2	4	400.00268	65896
32	8	"Civil Engineering"			"izmirinsaat@gmail.com"	"Turkish"	"öö"	70	2	4	345.07868	104275
33	8	"Mechanical Engineering"	"izmirmakine@gmail.com"	"Turkish"	"öö"	70	2	4	335.78512	112274
*/