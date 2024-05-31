-- Insert data into the buyer table
INSERT INTO buyer (userID, name, email, password) VALUES 
('789456123', 'Alex Johnson', 'alex.johnson@sample.edu', 'password123'), 
('789456124', 'Chris Lee', 'chris.lee@sample.edu', 'pass456'), 
('789456125', 'Jordan Kim', 'jordan.kim@sample.edu', 'securepass'), 
('789456126', 'Taylor Brown', 'taylor.brown@sample.edu', 'managerpwd'), 
('78194926', 'Morgan Smith', 'morgan.smith@sample.com', 'letmein');

-- Insert data into the eventplanner table
INSERT INTO eventplanner (userID, name, email, password) VALUES 
('28648190902', 'Jamie Wilson', 'jamie.wilson@sample.com', 'p@ssw0rd'), 
('9746312890', 'Sam Anderson', 'sam.anderson@sample.com', 'securepwd'), 
('789456127', 'Pat Martinez', 'pat.martinez@sample.com', 'strongpwd'), 
('789456128', 'Casey Taylor', 'casey.taylor@sample.com', 'iloveyou'), 
('789456129', 'Alex Lee', 'alex.lee@sample.com', 'qwerty123');

-- Insert data into the event table
INSERT INTO event (eventID, eventName, description, date_and_time, location) VALUES 
(1, 'Concert', 'Live music performance', '2024-05-09 18:00:00', 'Venue A'), 
(2, 'Sports Game', 'Exciting sports event', '2024-05-10 14:00:00', 'Stadium B'), 
(3, 'Theater Play', 'Dramatic theater performance', '2024-05-11 19:30:00', 'Theater C'), 
(4, 'Conference', 'Industry conference', '2024-05-12 09:00:00', 'Convention Center');

-- Insert data into the createevent table
INSERT INTO createevent (EventPlannerUserID, EventID) VALUES 
('789456127', 1), 
('789456128', 2), 
('789456125', 3), 
('789456126', 4), 
('78194926', 1);

-- Insert data into the cart table
INSERT INTO cart (cartID, eventID) VALUES 
('cart1', 1), 
('cart2', 2), 
('cart3', 3), 
('cart4', 4), 
('cart5', 1);

-- Insert data into the card table
INSERT INTO card (cardNo, userID, cardName, expMonth, expYear, securityCode) VALUES 
(1234567890123456, '789456123', 'Jamie Doe', 12, 2024, 123), 
(2345678901234567, '789456124', 'Jordan Smith', 11, 2023, 456), 
(3456789012345678, '789456125', 'Taylor Johnson', 10, 2022, 789), 
(4567890123456789, '789456126', 'Morgan Williams', 9, 2021, 012), 
(5678901234567890, '78194926', 'Alex Davis', 8, 2020, 345);

-- Insert data into the hastickets table
INSERT INTO hastickets (userID, eventID, tickets) VALUES 
('789456123', 1, 2), 
('789456124', 2, 3), 
('789456125', 3, 1), 
('789456126', 4, 4), 
('78194926', 1, 5);

-- Insert data into the tickets table
INSERT INTO tickets (eventID, totalTickets, remainingTickets, price) VALUES 
(1, 100, 98, 50), 
(2, 200, 197, 75), 
(3, 150, 149, 100), 
(4, 300, 296, 25);

-- Insert data into the transaction table
INSERT INTO transaction (transactionID, eventID, userID, tickets, amount) VALUES 
(1, 1, '789456123', 2, 100), 
(2, 2, '789456124', 3, 225), 
(3, 3, '789456125', 1, 100), 
(4, 4, '789456126', 4, 100), 
(5, 1, '78194926', 5, 250);

-- Insert data into the return table
INSERT INTO `return` (returnID, eventID, userID, tickets) VALUES 
(1, 1, '789456123', 1), 
(2, 2, '789456124', 2), 
(3, 3, '789456125', 1), 
(4, 4, '789456126', 2), 
(5, 1, '78194926', 3);
