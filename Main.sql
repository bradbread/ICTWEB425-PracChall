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
    



