CREATE TABLE User ( 
User_ID INT PRIMARY KEY, 
Username VARCHAR(50) NOT NULL, 
Email VARCHAR(100) UNIQUE NOT NULL 
); 
CREATE TABLE Player ( 
Player_ID INT PRIMARY KEY, 
Name VARCHAR(50) NOT NULL, 
Team VARCHAR(50), 
Role VARCHAR(20), 
Rating DECIMAL(3,1) 
); 
CREATE TABLE Match ( 
Match_ID INT PRIMARY KEY, 
Date DATE NOT NULL, 
Team1 VARCHAR(50), 
Team2 VARCHAR(50), 
Venue VARCHAR(100) 
); 
CREATE TABLE UserTeam ( 
User_ID INT, 
Match_ID INT, 
Player_ID INT, 
PRIMARY KEY (User_ID, Match_ID, Player_ID), 
FOREIGN KEY (User_ID) REFERENCES User(User_ID), 
FOREIGN KEY (Match_ID) REFERENCES Match(Match_ID), 
FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID) 
); 
CREATE TABLE Performance ( 
Match_ID INT, 
Player_ID INT, 
Runs INT DEFAULT 0, 
Wickets INT DEFAULT 0, 
Catches INT DEFAULT 0, 
Points INT GENERATED ALWAYS AS (Runs + Wickets * 25 + Catches * 10) STORED, 
PRIMARY KEY (Match_ID, Player_ID), 
FOREIGN KEY (Match_ID) REFERENCES Match(Match_ID), 
FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID) 
); 
CREATE TABLE Performance ( 
Match_ID INT, 
Player_ID INT, 
Runs INT DEFAULT 0, 
Wickets INT DEFAULT 0, 
Catches INT DEFAULT 0, 
Points INT GENERATED ALWAYS AS (Runs + Wickets * 25 + Catches * 10) STORED, 
PRIMARY KEY (Match_ID, Player_ID), 
FOREIGN KEY (Match_ID) REFERENCES Match(Match_ID), 
FOREIGN KEY (Player_ID) REFERENCES Player(Player_ID) 
); 
Values Insertion -- Users 
INSERT INTO User VALUES (1, 'user1', 'user1@gmail.com'); 
INSERT INTO User VALUES (2, 'user2', 'user2@gmail.com'); 
INSERT INTO User VALUES (3, 'user3', 'user3@gmail.com'); 
INSERT INTO User VALUES (4, 'user4', 'user4@gmail.com'); 
INSERT INTO User VALUES (5, 'user5', 'user5@gmail.com'); -- Players 
INSERT INTO Player VALUES (101, 'Virat Kohli', 'RCB', 'Batsman', 9.5); 
INSERT INTO Player VALUES (102, 'Jasprit Bumrah', 'MI', 'Bowler', 9.2); 
INSERT INTO Player VALUES (103, 'MS Dhoni', 'CSK', 'Wicketkeeper', 8.9); 
INSERT INTO Player VALUES (104, 'Hardik Pandya', 'MI', 'All-rounder', 9.0); 
INSERT INTO Player VALUES (105, 'KL Rahul', 'LSG', 'Batsman', 8.7); -- Matches 
INSERT INTO Match VALUES (301, '2025-05-21', 'RCB', 'MI', 'Wankhede Stadium'); 
INSERT INTO Match VALUES (302, '2025-05-23', 'CSK', 'MI', 'Chepauk Stadium'); 
INSERT INTO Match VALUES (303, '2025-05-25', 'LSG', 'RCB', 'Ekana Stadium'); -- Team Selection 
INSERT INTO UserTeam VALUES (1, 301, 101); 
INSERT INTO UserTeam VALUES (1, 301, 102); 
INSERT INTO UserTeam VALUES (2, 302, 103); 
INSERT INTO UserTeam VALUES (3, 303, 105); 
INSERT INTO UserTeam VALUES (4, 301, 104); 
INSERT INTO UserTeam VALUES (5, 302, 101); 
-- Performances 
INSERT INTO Performance VALUES (301, 101, 70, 0, 0); 
INSERT INTO Performance VALUES (301, 102, 5, 3, 0); 
INSERT INTO Performance VALUES (302, 103, 40, 0, 1); 
INSERT INTO Performance VALUES (303, 105, 65, 0, 0); 
INSERT INTO Performance VALUES (301, 104, 30, 1, 2); 
INSERT INTO Performance VALUES (302, 101, 80, 0, 0); 