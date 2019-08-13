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


