drop table Stream_recommendation;
drop table Streams;
create table Streams(
Stream_ID int primary key,
Stream_Name varchar(100)
);

create table Stream_recommendation(
Course_Preference varchar(100) primary key,
Stream_ID int,
FOREIGN KEY (Stream_ID) REFERENCES Streams(Stream_ID)
);

drop table Science;
create table Science(
College_ID int primary key,
Name varchar(1000),
Cut_Off double,
Stream_ID int,
FOREIGN KEY (Stream_ID) REFERENCES Streams(Stream_ID)
);

drop table Commerce;
create table Commerce(
College_ID int primary key,
Name varchar(1000),
Cut_Off double,
Stream_ID int,
FOREIGN KEY (Stream_ID) REFERENCES Streams(Stream_ID)
);

drop table Humanities;
create table Humanities(
College_ID int primary key,
Name varchar(1000),
Cut_Off double,
Stream_ID int,
FOREIGN KEY (Stream_ID) REFERENCES Streams(Stream_ID)
);

drop table Student;
create table Student(
Username varchar(100) primary key,
Password varchar(10000),
Name varchar(1000),
Email_ID varchar(100),
Marks double,
Preference varchar(100),
Stream_ID int,
FOREIGN KEY (Stream_ID) REFERENCES Streams(Stream_ID),
College_choosen varchar(100)
);

select * from student;
select * from science;
select * from student;
insert into Streams values("1","Science");
insert into Streams values("2","Commerce");
insert into Streams values("3","Humanities");


INSERT INTO Humanities VALUES
(1, 'Wilson College', 75.1, 3),
(2, 'St. Xavier''s College', 75.1, 3),
(3, 'KC College', 75.1, 3),
(4, 'St. Xavier''s College', 80.5, 3),
(5, 'Mumbai University', 80.5, 3),
(6, 'Jai Hind College', 80.5, 3),
(7, 'St. Xavier''s College', 79.8, 3),
(8, 'KJ Somaiya College', 79.8, 3),
(9, 'St. Xavier''s College', 83.2, 3),
(10, 'Mumbai University', 83.2, 3),
(11, 'Jai Hind College', 83.2, 3),
(12, 'Jai Hind College', 80.4, 3),
(13, 'Mumbai University', 80.4, 3),
(14, 'St. Xavier''s College', 80.4, 3),
(15, 'St. Xavier''s College', 79.1, 3),
(16, 'Mumbai University', 79.1, 3),
(17, 'Jai Hind College', 79.1, 3),
(18, 'Furtados School of Music', 74.6, 3),
(19, 'Shanmukhananda Hall', 74.6, 3);

INSERT INTO Commerce VALUES
(1, 'St. Xavier''s College', 78.2, 2),
(2, 'HR College', 78.2, 2),
(3, 'KC College', 78.2, 2),
(4, 'NMIMS Mumbai', 82.5, 2),
(5, 'JBIMS', 82.5, 2),
(6, 'Welingkar Institute', 82.5, 2),
(7, 'HR College', 84.3, 2),
(8, 'R.A. Podar College', 84.3, 2),
(9, 'KC College', 84.3, 2),
(10, 'Xavier Institute of Communications (XIC)', 81.2, 2),
(11, 'Wilson College', 79.3, 2),
(12, 'KJ Somaiya College', 79.3, 2),
(13, 'NMIMS Mumbai', 79.4, 2),
(14, 'KJ Somaiya College', 79.4, 2),
(15, 'IHM Mumbai', 80.1, 2),
(16, 'Rizvi College', 80.1, 2),
(17, 'AIHMCT Mumbai', 80.1, 2),
(18, 'IHM Mumbai', 78.9, 2),
(19, 'Rizvi College', 78.9, 2),
(20, 'AIHMCT Mumbai', 78.9, 2),
(21, 'NIFT Mumbai', 76.8, 2),
(22, 'INIFD Mumbai', 76.8, 2),
(23, 'JD Institute of Fashion Technology', 76.8, 2),
(24, 'NIFT Mumbai', 81.3, 2),
(25, 'INIFD Mumbai', 81.3, 2),
(26, 'JD Institute of Fashion Technology', 81.3, 2),
(27, 'NMIMS Mumbai', 80.4, 2),
(28, 'KJ Somaiya College', 80.4, 2),
(29, 'NMIMS Mumbai', 80.4, 2),
(30, 'KJ Somaiya College', 80.4, 2),
(31, 'IHM Mumbai', 81.8, 2),
(32, 'NMIMS Mumbai', 81.8, 2),
(33, 'KJ Somaiya College', 81.8, 2),
(34, 'Xavier Institute of Communications', 83.2, 2),
(35, 'KJ Somaiya College', 83.2, 2),
(36, 'NMIMS Mumbai', 80.9, 2),
(37, 'KJ Somaiya College', 80.9, 2),
(38, 'NMIMS Mumbai', 79.6, 2),
(39, 'KJ Somaiya College', 79.6, 2),
(40, 'SNDT Women''s University', 88.3, 2);

INSERT INTO Science  VALUES
(1, 'Mumbai University', 85.6, 1),
(2, 'IIT Bombay', 87.4, 1),
(3, 'NMIMS Mumbai', 82.9, 1),
(4, 'VJTI', 87.4, 1),
(5, 'Sardar Patel College', 87.4, 1),
(6, 'Ruia College', 88.2, 1),
(7, 'Ramnarain Ruia College', 88.2, 1),
(8, 'Tata Institute of Fundamental Research', 84.9, 1),
(9, 'Nair Hospital Dental College', 89.7, 1),
(10, 'Bombay College of Pharmacy', 87.8, 1),
(11, 'Grant Medical College', 90.2, 1),
(12, 'KEM Hospital', 90.2, 1),
(13, 'Lokmanya Tilak Municipal Medical College', 90.2, 1),
(14, 'Nair Hospital Dental College', 89.7, 1),
(15, 'Government Dental College', 89.7, 1),
(16, 'Terna Dental College', 89.7, 1),
(17, 'Maharashtra Animal and Fishery Sciences University', 88.5, 1),
(18, 'Nanasaheb Salunkhe College', 88.5, 1),
(19, 'Forest Research Institute', 87.1, 1),
(20, 'Indian Institute of Forest Management', 87.1, 1),
(21, 'G.B. Pant University of Agriculture and Technology', 87.1, 1);

INSERT INTO Stream_recommendation VALUES
('Computer Science', 1),
('Economics', 2),
('Mechanical Engineering', 1),
('Business Management', 2),
('Psychology', 3),
('History', 3),
('Biology', 1),
('Accountancy', 2),
('Sociology', 3),
('Chemistry', 1),
('Physics', 1),
('Mathematics', 1),
('Political Science', 3),
('Electrical Engineering', 1),
('Civil Engineering', 1),
('Literature', 3),
('Environmental Science', 1),
('Fine Arts', 3),
('Linguistics', 3),
('Music', 3),
('Biotechnology', 1),
('Architecture', 1),
('Journalism', 3),
('Fashion Design', 3),
('Anthropology', 3),
('Geography', 3),
('Law', 3),
('Medicine', 1),
('Dentistry', 1),
('Pharmacy', 1),
('Nursing', 1),
('Hospitality Management', 2),
('Culinary Arts', 2),
('Agriculture', 1),
('Philosophy', 3),
('Social Work', 3),
('Public Health', 1),
('Tourism Management', 3),
('Hospital Management', 2),
('Veterinary Medicine', 1),
('Forestry', 1),
('Theatre Studies', 3),
('Interior Design', 3),
('Fashion Merchandising', 2),
('Environmental Engineering', 1),
('International Business', 2),
('Real Estate Management', 2),
('Animation', 3),
('Game Design', 3),
('Robotics', 1),
('Forensic Psychology', 3),
('Cognitive Science', 1),
('Neuroscience', 1),
('Biomedical Sciences', 1),
('Health Informatics', 1),
('Digital Marketing', 2),
('Artificial Intelligence', 1),
('Blockchain Technology', 1),
('Cybersecurity', 1),
('Renewable Energy', 1),
('Space Exploration', 1),
('Marine Biology', 1),
('Wildlife Conservation', 1),
('Fashion Styling', 3),
('Event Planning', 2),
('Child Development', 3),
('Gerontology', 3),
('Sports Science', 1),
('Hospitality Marketing', 2),
('Digital Media Production', 3),
('User Experience Design', 3),
('Human-Centered Design', 3),
('Business Analytics', 2),
('Supply Chain Logistics', 2),
('Food Science', 1),
('Wine Studies', 1);
