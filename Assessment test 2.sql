SELECT * FROM cd.facilities;
SELECT * FROM cd.bookings;
SELECT * FROM cd.members;


/* Assessment test 2:
----------------------

Link to Google Doc with Questions and Expected Results:

https://docs.google.com/document/d/1wiuYbTQslmfolQWgeVPB356csjK6yqOUBhgC7fM44o8/edit?usp=sharing

Link to Google Doc with Solutions

https://docs.google.com/document/d/1swGZ0RG3KKqWqzmsI_qrMgjJ3lt39mtAJqRSMZy6Z-8/edit?usp=sharing


-----------------------------------------------

1. How can you retrieve all the information from the cd.facilities table?
SELECT * FROM cd.facilities; 

2.You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?
SELECT name, membercost FROM cd.facilities;

3.How can you produce a list of facilities that charge a fee to members?
 SELECT * FROM cd.facilities WHERE membercost > 0;
 */



/*
 How can you produce a list of facilities that:
 1-facilities table
 ------------------
 charge a fee to members = (membercost)
 
 , and that fee is less than 1/50th of the monthly maintenance cost?
 2-=== Use where for filtering membercost and monthly fees.
 ------------------------------------
 
 3-=== memebercost > 0
 -------------------
 4-(membercost< monthlymaintenace/50.0)
 
 Return the facid, facility name, member cost, and monthly
 maintenance of the facilities 
 in question.
 5-=== facid,name,membercost,monthlymaintenance 
 
SELECT * FROM cd.facilities;

SELECT facid,name,membercost,monthlymaintenance FROM cd.facilities
WHERE membercost > 0
And (membercost< monthlymaintenance/50)
 */

 
/*
 How can you produce a list of all facilities with the word 
 'Tennis' in their name?
 WHERE name LIKE '%Tennis%'

SELECT * FROM cd.facilities
WHERE name LIKE '%Tennis%'
 */

/*
How can you retrieve the details of facilities with ID 1 and 5? 
Try to do it without using the OR operator.


SELECT * FROM cd.facilities
WHERE facid IN (1,5)
WHERE facid = 1 
or facid = 5;
*/



/*
7. How can you produce a list of members who joined 
##afterthe start of September 2012?
##Return the memid, surname,firstname, and joindate of the members in question.


SELECT memid,surname,firstname,joindate 
FROM cd.members
WHERE joindate >= '2012-09-01'
*/

/*
8.How can you produce an ordered list of the first 10 surnames 
in the members table?

The list must not contain duplicates.
SELECT DISTINCT(surname) FROM cd.members
ORDER BY surname ASC
LIMIT 10;
*/


/*

9.You'd like to get the signup date of your last member.
How can you retrieve this information?

SELECT joindate FROM cd.members
ORDER BY joindate DESC
LIMIT 1;
*/


/*
10.Produce a count of the number of facilities that have 
a cost to guests of 10 or more.


SELECT COUNT(guestcost) FROM cd.facilities
WHERE guestcost >= 10
*/


/*
SELECT facid,sum(slots) AS "Total Slots" FROM cd.bookings
WHERE starttime>= '2012-09-01' AND starttime < '2012-10-01'
GROUP BY facid ORDER BY SUM(slots);
||||||||||||||||||||||||||||||||||||

11. Produce a list of the 
total number of slots = sum slot
booked per facility =  facid

in the month of September 2012. = where starttime >09 <=10

Produce an output table 

consisting of facility id = Group facid

and slots sorted by the number of slots    order by sum(slot)

SELECT * FROM cd.bookings;


SELECT facid,SUM(slots) AS "Total Slots"
FROM cd.bookings
WHERE starttime > '2012-09-01' AND starttime <= '2012-10-01'
GROUP BY facid ORDER BY SUM(slots)
*/


/*
13. How can you produce a list of the start times for bookings for 
tennis courts,
for the date '2012-09-21'? Return a list of start time and facility name 
pairings,
ordered by the time.



 SELECT cd.bookings.starttime AS start, cd.facilities.name AS name
 FROM cd.facilities
 INNER JOIN cd.bookings
 ON cd.facilities.facid = cd.bookings.facid 
 WHERE cd.facilities.facid IN (0,1)
 AND cd.bookings.starttime >='2012-09-21'
 AND cd.bookings.starttime < '2012-09-22'
 ORDER BY cd.bookings.starttime
*/

 /*
 
How can you produce a list of the start times for bookings by members 
named 'David Farrell'?

 */
SELECT * FROM cd.bookings;
select * from cd.members;

SELECT  cd.bookings.starttime FROM cd.bookings
INNER JOIN cd.members 
ON cd.bookings.memid = cd.members.memid
WHERE cd.members.firstname = 'David'
AND cd.members.surname = 'Farrell'



