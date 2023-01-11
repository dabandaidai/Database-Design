SET SEARCH_PATH TO ticketchema;

INSERT INTO Owner (phone, name) VALUES
('80011111', 'The Corporation of Massey Hall and Roy Thomson Hall'),
('800222222', 'Maple Leaf Sports & Entertainment');


INSERT INTO "User"(username) VALUES
('ahightower'),
('d_targaryen'),
('cristonc');


INSERT INTO Venue (venue_id, name, city, address, owner) VALUES
(1, 'Massey Hall', 'Toronto', '178 Victoria Street', '80011111'),
(2, 'Roy Thomson Hall', 'Toronto', '60 Simcoe St', '80011111'),
(3, 'ScotiaBank Arena', 'Toronto', '40 Bay St', '800222222');


INSERT INTO Seat (venue_id, section, seat_name, accessible) VALUES
-- Massey Hall
(1, 'floor', 'A1', TRUE),
(1, 'floor', 'A2', TRUE),
(1, 'floor', 'A3', TRUE),
(1, 'floor', 'A4', FALSE),
(1, 'floor', 'A5', FALSE),
(1, 'floor', 'A6', FALSE),
(1, 'floor', 'A7', FALSE),
(1, 'floor', 'A8', TRUE),
(1, 'floor', 'A9', TRUE),
(1, 'floor', 'A10', TRUE),
(1, 'floor', 'B1', FALSE),
(1, 'floor', 'B2', FALSE),
(1, 'floor', 'B3', FALSE),
(1, 'floor', 'B4', FALSE),
(1, 'floor', 'B5', FALSE),
(1, 'floor', 'B6', FALSE),
(1, 'floor', 'B7', FALSE),
(1, 'floor', 'B8', FALSE),
(1, 'floor', 'B9', FALSE),
(1, 'floor', 'B10', FALSE),
(1, 'balcony', 'C1', FALSE),
(1, 'balcony', 'C2', FALSE),
(1, 'balcony', 'C3', FALSE),
(1, 'balcony', 'C4', FALSE),
(1, 'balcony', 'C5', FALSE),
-- Roy Thomson Hall
(2, 'main hall', 'AA1', FALSE),
(2, 'main hall', 'AA2', FALSE),
(2, 'main hall', 'AA3', FALSE),
(2, 'main hall', 'BB1', FALSE),
(2, 'main hall', 'BB2', FALSE),
(2, 'main hall', 'BB3', FALSE),
(2, 'main hall', 'BB4', FALSE),
(2, 'main hall', 'BB5', FALSE),
(2, 'main hall', 'BB6', FALSE),
(2, 'main hall', 'BB7', FALSE),
(2, 'main hall', 'BB8', FALSE),
(2, 'main hall', 'CC1', FALSE),
(2, 'main hall', 'CC2', FALSE),
(2, 'main hall', 'CC3', FALSE),
(2, 'main hall', 'CC4', FALSE),
(2, 'main hall', 'CC5', FALSE),
(2, 'main hall', 'CC6', FALSE),
(2, 'main hall', 'CC7', FALSE),
(2, 'main hall', 'CC8', FALSE),
(2, 'main hall', 'CC9', FALSE),
(2, 'main hall', 'CC10', FALSE),
-- ScotiaBank Arena 
(3, '100', 'row 1, seat 1', TRUE),
(3, '100', 'row 1, seat 2', TRUE),
(3, '100', 'row 1, seat 3', TRUE),
(3, '100', 'row 1, seat 4', TRUE),
(3, '100', 'row 1, seat 5', TRUE),
(3, '100', 'row 2, seat 1', TRUE),
(3, '100', 'row 2, seat 2', TRUE),
(3, '100', 'row 2, seat 3', TRUE),
(3, '100', 'row 2, seat 4', TRUE),
(3, '100', 'row 2, seat 5', TRUE),
(3, '200', 'row 1, seat 1', FALSE),
(3, '200', 'row 1, seat 2', FALSE),
(3, '200', 'row 1, seat 3', FALSE),
(3, '200', 'row 1, seat 4', FALSE),
(3, '200', 'row 1, seat 5', FALSE),
(3, '200', 'row 2, seat 1', FALSE),
(3, '200', 'row 2, seat 2', FALSE),
(3, '200', 'row 2, seat 3', FALSE),
(3, '200', 'row 2, seat 4', FALSE),
(3, '200', 'row 2, seat 5', FALSE),
(3, '300', 'row 1, seat 1', FALSE),
(3, '300', 'row 1, seat 2', FALSE),
(3, '300', 'row 1, seat 3', FALSE),
(3, '300', 'row 1, seat 4', FALSE),
(3, '300', 'row 1, seat 5', FALSE),
(3, '300', 'row 2, seat 1', FALSE),
(3, '300', 'row 2, seat 2', FALSE),
(3, '300', 'row 2, seat 3', FALSE),
(3, '300', 'row 2, seat 4', FALSE),
(3, '300', 'row 2, seat 5', FALSE);


INSERT INTO Concert (concert_id, name, datetime, venue_id) VALUES
(1, 'Ron Sexsmith', '2022-12-03 19:30:00', 1),
(2, 'Women''s Blues Review', '2022-11-25 20:00:00', 1),
(3, 'Mariah Carey - Merry Christmas to all', '2022-12-09 20:00:00', 3),
(4, 'Mariah Carey - Merry Christmas to all', '2022-12-11 20:00:00', 3),
(5, 'TSO - Elf in Concert', '2022-12-09 19:30:00', 2),
(6, 'TSO - Elf in Concert', '2022-12-10 14:30:00', 2),
(7, 'TSO - Elf in Concert', '2022-12-10 19:30:00', 2);


INSERT INTO TicketType (type_id, concert_id, section, price) VALUES
-- Ron Sexsmith
(1, 1, 'floor', 130),
(2, 1, 'balcony', 99),
-- Women's Blues Review
(3, 2, 'floor', 150),
(4, 2, 'balcony', 125),
-- Mariah Carey - Merry Christmas to all
(5, 3, '100', 986),
(6, 3, '200', 244),
(7, 3, '300', 176),
(8, 4, '100', 936),
(9, 4, '200', 194),
(10, 4, '300', 126),
-- TSO - Elf in Concert
(11, 5, 'main hall', 159),
(12, 6, 'main hall', 159),
(13, 7, 'main hall', 159);


INSERT INTO Ticket(ticket_id, type_id, seat_name) VALUES 
(1, 3, 'A5'),
(2, 4, 'C2'),
(3, 1, 'B3'),
(4, 13, 'BB7'),
(5, 5, 'row 1, seat 3'),
(6, 9, 'row 2, seat 3'),
(7, 9, 'row 2, seat 4');




INSERT INTO "Order" (order_id, username, ticket_id, datetime) VALUES
(1, 'ahightower', 1, now()),
(2, 'ahightower', 2, now()),
(3, 'd_targaryen', 3, now()),
(4, 'd_targaryen', 4, now()),
(5, 'cristonc', 5, now()),
(6, 'cristonc', 6, now()),
(7, 'cristonc', 7, now());