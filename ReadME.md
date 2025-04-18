# 🏏 Fantasy Sports Platform – Database Schema

Welcome to the **Fantasy Sports Platform DB Project**, a mini version of Dream11 — where users create virtual teams, select players, and earn points based on real-life performances. This project is designed using SQL with an emphasis on relational integrity, user interaction, and match performance tracking.

---

## 📁 Tables Overview

### 1. `User`
Stores information about users registered on the platform.

| Column     | Type         | Constraints         |
|------------|--------------|---------------------|
| User_ID    | INT          | Primary Key         |
| Username   | VARCHAR(50)  | Not Null            |
| Email      | VARCHAR(100) | Unique, Not Null    |

---

### 2. `Player`
Stores the details of players available for selection.

| Column     | Type         | Constraints         |
|------------|--------------|---------------------|
| Player_ID  | INT          | Primary Key         |
| Name       | VARCHAR(50)  | Not Null            |
| Team       | VARCHAR(50)  |                     |
| Role       | VARCHAR(20)  |                     |
| Rating     | DECIMAL(3,1) |                     |

---

### 3. `Match`
Stores information about matches.

| Column     | Type         | Constraints         |
|------------|--------------|---------------------|
| Match_ID   | INT          | Primary Key         |
| Date       | DATE         | Not Null            |
| Team1      | VARCHAR(50)  |                     |
| Team2      | VARCHAR(50)  |                     |
| Venue      | VARCHAR(100) |                     |

---

### 4. `UserTeam`
Links users to their selected players for a specific match.

| Column     | Type | Constraints |
|------------|------|-------------|
| User_ID    | INT  | Foreign Key (`User`) |
| Match_ID   | INT  | Foreign Key (`Match`) |
| Player_ID  | INT  | Foreign Key (`Player`) |
| **Primary Key** | Composite (`User_ID`, `Match_ID`, `Player_ID`) |

---

### 5. `Performance`
Tracks how a player performed in a particular match.

| Column     | Type  | Constraints                            |
|------------|-------|----------------------------------------|
| Match_ID   | INT   | Foreign Key (`Match`)                  |
| Player_ID  | INT   | Foreign Key (`Player`)                 |
| Runs       | INT   | Default 0                              |
| Wickets    | INT   | Default 0                              |
| Catches    | INT   | Default 0                              |
| Points     | INT   | Generated as: `Runs + Wickets * 25 + Catches * 10` |
| **Primary Key** | Composite (`Match_ID`, `Player_ID`) |

> 

---

## 🧪 Sample Data Inserted

### 👤 Users:
```sql
INSERT INTO User VALUES (1, 'user1', 'user1@gmail.com');
...
