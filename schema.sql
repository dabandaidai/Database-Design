-- COULD NOT: What constraints from the domain specification could not be 
--              enforced without assertions or triggers, if any?
-- We can not enforce the constraint that all venues should have at least 
-- 10 seats without using a trigger, because it requires us to check the 
-- total number of seats of the venue when we are updating or deleting seats
-- from a venue, and this check can not be enforced without using a trigger.

-- DID NOT: What constraints from the domain specification could have been 
--          enforced without assertions or triggers, but were not enforced, 
--          if any? Why not?
-- We enforced all constraints that can be enforced without 
-- assertions or triggers.

-- EXTRA CONSTRAINS: What additional constraints that we didn't mention did you 
--                  enforce, if any?
-- (1) We enforced that there is only 1 venue at a specific location.
-- (2) We enforced that every venue must have a owner, thus if a owner is 
-- deleted from the Owner table, the corresponding venues are deleted from the
-- Venue table.
-- (3) We enforced that a concert must be held in a venue in the Venue table,
-- thus if a venue if deleted from the Venue table, all concerts held in it 
-- is also removed(called off).

-- ASSUMPTION: What assumptions did you make?
-- (1) We assumed that the phone number of the owner could be longer than 10 
-- digits as they may come from foreign countries.
-- (2) We assumed that the name of an owner is no longer than 250 characters.
-- (3) We assumed the username of the an user, the name of a city, the name of 
-- a venue, the name of a seat section and a seat name, are no longer than 25 
-- characters.
-- (4) We assumed the name of the address, name of the concert, is no longer 
-- than 50 characters.
-- (5) We assumed that every seat is available for every ticket.
-- (6) We assumed that one user can purchase more than 1 ticket for a concert.


DROP SCHEMA IF EXISTS ticketchema CASCADE;
CREATE SCHEMA ticketchema;
SET SEARCH_PATH TO ticketchema;


-- Each row is a person or an organization with phone number and name.
CREATE TABLE Owner (
    phone   VARCHAR(20) PRIMARY KEY,
    name    VARCHAR(250) NOT NULL
);


-- Each row is an App user with username.
CREATE TABLE "User" (
    username    VARCHAR(25) PRIMARY KEY 
);


-- Each row is a venue with venue ID, venue name, the city it's in, its address,
-- and its owner.
CREATE TABLE Venue (
    venue_id    INTEGER PRIMARY KEY,
    name        VARCHAR(25) NOT NULL,
    city        VARCHAR(25) NOT NULL,
    address     VARCHAR(50) NOT NULL,
    owner       VARCHAR(20) NOT NULL REFERENCES Owner 
    ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE (city, address),
    UNIQUE (venue_id, owner)
);


-- Each row is a seat with the venue it's in, its section, seat name, 
-- and accessibility.
CREATE TABLE Seat (
    venue_id    INTEGER NOT NULL REFERENCES Venue 
    ON UPDATE CASCADE ON DELETE CASCADE, 
    section     VARCHAR(25) NOT NULL,
    seat_name   VARCHAR(25) NOT NULL,
    accessible  BOOLEAN NOT NULL,
    PRIMARY KEY (venue_id, section, seat_name)
);

-- Each row is a concert with concert ID, concert name, time, and the venue 
-- that's holding this concert.
CREATE TABLE Concert (
    concert_id  INTEGER PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    datetime    TIMESTAMP NOT NULL,
    venue_id    INTEGER NOT NULL REFERENCES Venue 
    ON UPDATE CASCADE ON DELETE CASCADE,
    UNIQUE (datetime, venue_id)
);


-- Each row is a type of ticket with type ID, the corresponding concert, 
-- the section, and price of this type of tickets.
CREATE TABLE TicketType (
    type_id     INTEGER PRIMARY KEY,
    concert_id  INTEGER NOT NULL REFERENCES Concert 
    ON UPDATE CASCADE ON DELETE CASCADE,
    section     VARCHAR(25) NOT NULL,
    price       REAL NOT NULL,
    UNIQUE (concert_id, section, price)
);

-- Each row is a ticket with ticket ID, ticket type, and the seat.
CREATE TABLE Ticket (
    ticket_id   INTEGER PRIMARY KEY,
    type_id     INTEGER REFERENCES TicketType
    ON UPDATE CASCADE ON DELETE CASCADE,
    seat_name   VARCHAR(25) NOT NULL,
    UNIQUE (type_id, seat_name)
);


-- Each row is an order(purchase) with order ID, the buyer, the bought ticket, 
-- and datetime of purchase.
CREATE TABLE "Order" (
    order_id    INTEGER PRIMARY KEY,
    username    VARCHAR(25) REFERENCES "User" 
    ON UPDATE CASCADE ON DELETE CASCADE,
    ticket_id   INTEGER REFERENCES Ticket
    ON UPDATE CASCADE ON DELETE CASCADE,
    datetime    TIMESTAMP NOT NULL,
    UNIQUE (ticket_id, username)
);


