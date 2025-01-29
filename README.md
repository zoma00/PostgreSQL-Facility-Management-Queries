# PostgreSQL-Facility-Management-Queries
SQL queries for managing and analyzing facility bookings, members, and costs in a PostgreSQL database.

This repository contains a collection of SQL queries designed to interact with a database schema related to facilities, bookings, and members. The queries are part of an assessment test and demonstrate various SQL techniques, including filtering, aggregation, joins, and sorting.

---

## Table of Contents
1. [Overview](#overview)
2. [Queries and Explanations](#queries-and-explanations)
3. [How to Use](#how-to-use)
4. [License](#license)

---

## Overview

The database schema includes the following tables:
- **`cd.facilities`**: Contains information about facilities, including their names, member costs, guest costs, and maintenance costs.
- **`cd.bookings`**: Contains booking details, including facility IDs, member IDs, start times, and slots.
- **`cd.members`**: Contains member details, including names, join dates, and membership information.

The SQL queries in this repository are designed to retrieve and manipulate data from these tables.

---

## Queries and Explanations

Below is a detailed explanation of each query in the `sql_test.sql` file:

---

### 1. Retrieve All Information from the `cd.facilities` Table
```sql
SELECT * FROM cd.facilities;
```
- **Purpose**: Fetches all columns and rows from the `cd.facilities` table.
- **Use Case**: Useful for inspecting the entire facilities dataset.

---

### 2. Retrieve Facility Names and Member Costs
```sql
SELECT name, membercost FROM cd.facilities;
```
- **Purpose**: Retrieves only the names and member costs of all facilities.
- **Use Case**: Helps in analyzing the cost structure for members.

---

### 3. Retrieve Facilities That Charge a Fee to Members
```sql
SELECT * FROM cd.facilities WHERE membercost > 0;
```
- **Purpose**: Filters facilities that have a member cost greater than 0.
- **Use Case**: Identifies facilities that require a fee from members.

---

### 4. Retrieve Facilities with a Member Fee Less Than 1/50th of Monthly Maintenance Cost
```sql
SELECT facid, name, membercost, monthlymaintenance 
FROM cd.facilities
WHERE membercost > 0 AND membercost < (monthlymaintenance / 50.0);
```
- **Purpose**: Finds facilities where the member cost is less than 1/50th of the monthly maintenance cost.
- **Use Case**: Useful for identifying facilities with relatively low member fees compared to maintenance costs.

---

### 5. Retrieve Facilities with 'Tennis' in Their Name
```sql
SELECT * FROM cd.facilities WHERE name LIKE '%Tennis%';
```
- **Purpose**: Filters facilities whose names contain the word "Tennis."
- **Use Case**: Helps in locating tennis-related facilities.

---

### 6. Retrieve Details of Facilities with IDs 1 and 5
```sql
SELECT * FROM cd.facilities WHERE facid IN (1, 5);
```
- **Purpose**: Fetches details of facilities with IDs 1 and 5.
- **Use Case**: Useful for retrieving specific facility information without using the `OR` operator.

---

### 7. Retrieve Members Who Joined After September 2012
```sql
SELECT memid, surname, firstname, joindate 
FROM cd.members
WHERE joindate >= '2012-09-01';
```
- **Purpose**: Lists members who joined on or after September 1, 2012.
- **Use Case**: Helps in analyzing membership growth over time.

---

### 8. Retrieve the First 10 Unique Surnames from the Members Table
```sql
SELECT DISTINCT surname FROM cd.members
ORDER BY surname ASC
LIMIT 10;
```
- **Purpose**: Retrieves the first 10 unique surnames in alphabetical order.
- **Use Case**: Useful for generating a sorted list of member surnames.

---

### 9. Retrieve the Signup Date of the Last Member
```sql
SELECT joindate FROM cd.members
ORDER BY joindate DESC
LIMIT 1;
```
- **Purpose**: Fetches the join date of the most recent member.
- **Use Case**: Helps in identifying the latest member signup.

---

### 10. Count Facilities with a Guest Cost of 10 or More
```sql
SELECT COUNT(*) FROM cd.facilities
WHERE guestcost >= 10;
```
- **Purpose**: Counts the number of facilities where the guest cost is 10 or more.
- **Use Case**: Useful for analyzing high-cost facilities.

---

### 11. Retrieve Total Number of Slots Booked per Facility in September 2012
```sql
SELECT facid, SUM(slots) AS "Total Slots"
FROM cd.bookings
WHERE starttime >= '2012-09-01' AND starttime < '2012-10-01'
GROUP BY facid
ORDER BY SUM(slots);
```
- **Purpose**: Calculates the total number of slots booked per facility in September 2012.
- **Use Case**: Helps in understanding facility usage during a specific period.

---

### 12. Retrieve Start Times for Tennis Court Bookings on September 21, 2012
```sql
SELECT cd.bookings.starttime AS start, cd.facilities.name AS name
FROM cd.facilities
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid 
WHERE cd.facilities.facid IN (0, 1)
AND cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime < '2012-09-22'
ORDER BY cd.bookings.starttime;
```
- **Purpose**: Lists the start times for bookings of tennis courts on September 21, 2012.
- **Use Case**: Useful for scheduling and facility management.

---

### 13. Retrieve Start Times for Bookings by Member 'David Farrell'
```sql
SELECT cd.bookings.starttime 
FROM cd.bookings
INNER JOIN cd.members 
ON cd.bookings.memid = cd.members.memid
WHERE cd.members.firstname = 'David'
AND cd.members.surname = 'Farrell';
```
- **Purpose**: Fetches the start times of bookings made by the member named 'David Farrell.'
- **Use Case**: Helps in tracking bookings by specific members.

---

## How to Use

1. Clone this repository to your local machine.
2. Open the `assessmenttest2.sql` file in your PostgreSQL environment.
3. Execute the queries against your database to see the results.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

