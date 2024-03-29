/*  Name: Bradley
    StudentID: 102673815 */

/* Relational Schema:
    Tour(TourName, Description)
    PK(TourName)

    Client(ClientID, Surname, GivenName, Gender)
    PK(ClientID)

    Event(TourName, EventYear, EventMonth, EventDay, Fee)
    PK(TourName, EventYear, EventMonth, EventDay)
    FK(TourName) References Tour

    Booking(ClientID, TourName, EventYear, EventMonth, EventDay, DateBooked, Payment)
    PK(ClientID, TourName, EventYear, EventMonth, EventDay)
    FK(ClientID) References Client
    FK(TourName, EventYear, EventMonth, EventDay) References Event */

    /* DDL */

    DROP TABLE IF EXISTS Booking3815
    DROP TABLE IF EXISTS Event3815
    DROP TABLE IF EXISTS Client3815
    DROP TABLE IF EXISTS Tour3815

    CREATE TABLE Tour3815 (
        TOURNAME NVARCHAR(20)
    ,   DESCRIPTION NVARCHAR(100)
    ,   PRIMARY KEY (TOURNAME)
    );

    CREATE TABLE Client3815 (
        CLIENTID NUMERIC(10)
    ,   SURNAME NVARCHAR(25)
    ,   GIVENNAME NVARCHAR(25)
    ,   GENDER NVARCHAR(1)
    , PRIMARY KEY (CLIENTID)
    );

    CREATE TABLE Event3815 (
        TOURNAME NVARCHAR(20)
    ,   EVENTYEAR NUMERIC(4)
    ,   EVENTMONTH NVARCHAR(3)
    ,   EVENTDAY NUMERIC(2)
    ,   FEE MONEY
    ,   PRIMARY KEY (TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY)
    ,   FOREIGN KEY (TOURNAME) REFERENCES Tour3815
    );

    CREATE TABLE Booking3815 (
        CLIENTID NUMERIC(10)
    ,   TOURNAME NVARCHAR(20)
    ,   EVENTYEAR NUMERIC(4)
    ,   EVENTMONTH NVARCHAR(3)
    ,   EVENTDAY NUMERIC(2)
    ,   DATEBOOKED DATE
    ,   PAYMENT MONEY
    ,   PRIMARY KEY (CLIENTID, TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY)
    ,   FOREIGN KEY (CLIENTID) REFERENCES Client3815
    ,   FOREIGN KEY (TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY) REFERENCES Event3815
    );

    /* DML */

    INSERT INTO Client3815 (CLIENTID, SURNAME, GIVENNAME, GENDER) VALUES (1, 'Price', 'Taylor', 'M')
    INSERT INTO Client3815 (CLIENTID, SURNAME, GIVENNAME, GENDER) VALUES (2, 'Gamble', 'Ellyse', 'F')
    INSERT INTO Client3815 (CLIENTID, SURNAME, GIVENNAME, GENDER) VALUES (3, 'Tan', 'Tilly', 'F')
    INSERT INTO Client3815 (CLIENTID, SURNAME, GIVENNAME, GENDER) VALUES (102673815, 'Bowering', 'Bradley', 'M')

    INSERT INTO Tour3815 (TOURNAME, DESCRIPTION) VALUES ('North', 'Tour of wineries and outlets of the Bedigo and Castlemaine region')
    INSERT INTO Tour3815 (TOURNAME, DESCRIPTION) VALUES ('South', 'Tour of wineries and outlets of Mornington Penisula')
    INSERT INTO Tour3815 (TOURNAME, DESCRIPTION) VALUES ('West', 'Tour of wineries and outlets of the Geelong and Otways region')

    INSERT INTO Event3815 (TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, FEE) VALUES ('North', 2016, 'Jan', 09, 200)
    INSERT INTO Event3815 (TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, FEE) VALUES ('North', 2016, 'Feb', 13, 225)
    INSERT INTO Event3815 (TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, FEE) VALUES ('South', 2016, 'Jan', 9, 200)
    INSERT INTO Event3815 (TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, FEE) VALUES ('South', 2016, 'Jan', 16, 200)
    INSERT INTO Event3815 (TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, FEE) VALUES ('West', 2016, 'Jan', 29, 225)

    INSERT INTO Booking3815 (CLIENTID, TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, PAYMENT, DATEBOOKED) VALUES (1, 'North', 2016, 'Jan', 09, 200, '2015-01-09')
    INSERT INTO Booking3815 (CLIENTID, TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, PAYMENT, DATEBOOKED) VALUES (2, 'North', 2016, 'Jan', 09, 200, '2015-12-16')
    INSERT INTO Booking3815 (CLIENTID, TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, PAYMENT, DATEBOOKED) VALUES (1, 'North', 2016, 'Feb', 13, 225, '2016-01-08')
    INSERT INTO Booking3815 (CLIENTID, TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, PAYMENT, DATEBOOKED) VALUES (2, 'North', 2016, 'Feb', 13, 125, '2016-01-14')
    INSERT INTO Booking3815 (CLIENTID, TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, PAYMENT, DATEBOOKED) VALUES (3, 'North', 2016, 'Feb', 13, 225, '2016-03-02')
    INSERT INTO Booking3815 (CLIENTID, TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, PAYMENT, DATEBOOKED) VALUES (1, 'South', 2016, 'Jan', 09, 200, '2015-12-10')
    INSERT INTO Booking3815 (CLIENTID, TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, PAYMENT, DATEBOOKED) VALUES (2, 'South', 2016, 'Jan', 16, 200, '2015-12-18')
    INSERT INTO Booking3815 (CLIENTID, TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, PAYMENT, DATEBOOKED) VALUES (3, 'South', 2016, 'Jan', 16, 200, '2016-01-09')
    INSERT INTO Booking3815 (CLIENTID, TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, PAYMENT, DATEBOOKED) VALUES (2, 'West', 2016, 'Jan', 29, 225, '2015-12-17')
    INSERT INTO Booking3815 (CLIENTID, TOURNAME, EVENTYEAR, EVENTMONTH, EVENTDAY, PAYMENT, DATEBOOKED) VALUES (3, 'West', 2016, 'Jan', 29, 200, '2015-12-18')
    
    /* Queries */

    /* 4.1 */

    SELECT C.GIVENNAME, C.SURNAME, B.TOURNAME, T.DESCRIPTION, E.EVENTYEAR, E.EVENTMONTH, E.EVENTDAY, E.FEE, B.DATEBOOKED, B.PAYMENT FROM Booking3815 AS B
    INNER JOIN Client3815 AS C
    ON B.CLIENTID = C.CLIENTID
    INNER JOIN Event3815 AS E
    ON B.TOURNAME = E.TOURNAME AND B.EVENTYEAR = E.EVENTYEAR AND B.EVENTMONTH = E.EVENTMONTH AND  B.EVENTDAY = E.EVENTDAY
    INNER JOIN Tour3815 AS T
    ON B.TOURNAME = T.TOURNAME

    /* 4.2 */

    SELECT EVENTMONTH, TOURNAME, COUNT(ClientID) AS NumBookings FROM Booking3815
    GROUP BY EVENTMONTH, TOURNAME

    /* 4.3 */

    SELECT * FROM Booking3815
    WHERE PAYMENT > 
    (SELECT AVG(PAYMENT) FROM Booking3815)

    /* 5.1 */

    CREATE VIEW Task_4_Q1_View AS
    SELECT C.GIVENNAME, C.SURNAME, B.TOURNAME, T.DESCRIPTION, E.EVENTYEAR, E.EVENTMONTH, E.EVENTDAY, E.FEE, B.DATEBOOKED, B.PAYMENT FROM Booking3815 AS B
    INNER JOIN Client3815 AS C
    ON B.CLIENTID = C.CLIENTID
    INNER JOIN Event3815 AS E
    ON B.TOURNAME = E.TOURNAME AND B.EVENTYEAR = E.EVENTYEAR AND B.EVENTMONTH = E.EVENTMONTH AND  B.EVENTDAY = E.EVENTDAY
    INNER JOIN Tour3815 AS T
    ON B.TOURNAME = T.TOURNAME

    /* 6.1 */

    SELECT COUNT(*) FROM Booking3815

    /* this displays the total number of bookings and 
    as we are expecting all bookings to be displayed with query 1
    so the number here should match the number of results we get from query 1 */

    /* Select Count(*) FROM Task_4_Q1_View quickly checks the number of results from query 1 */

    /* 6.2 */

    SELECT COUNT(*) FROM Booking3815

    /* a similar concept to the first solution could be applied here
    the sum of the results from the all NumBookings collum should be
    equal to the count of all bookings as all bookings should be accounted for */

    /* Creating a view following the previous naming convention 
    running this should return the same the same value as the given SQL above
    SELECT SUM(NumBookings) FROM Task_4_Q2_View */

    /* 6.3 */

    SELECT COUNT(*) FROM Booking3815

    /* for this query we have a few options first 
    we should check that our number of results is
    less than our number of bookings as
    it would not make sense for an avarage to have more 
    people above average than people
    or for above the average to equal to the number of people
    assuming the same naming convention for a view of this query
    you could check the count of results using
    SELECT COUNT(*) FROM Task_4_Q3_View */

    SELECT AVG(PAYMENT) FROM Booking3815

    /* this seems redundant as the query already
    should be displaying only results above average
    but you can also check that no results from it
    are below the average payment 
    again assuming same naming convention as before for views
    with
    SELECT COUNT(*) FROM Task_4_Q3_View
    WHERE PAYMENT < (SELECT AVG(PAYMENT) FROM Booking3815)
    this should return 0 */

    