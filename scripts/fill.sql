SET SEARCH_PATH TO airport;

INSERT INTO PLANE VALUES
  (0, 1, TRUE, 200, 7, 3),
  (1, 1, TRUE, 250, 8, 4),
  (2, 4, TRUE, 100, 6, 4),
  (3, 2, TRUE, 150, 7, 5),
  (4, 2, TRUE, 300, 8, 3),
  (5, 11, TRUE, 400, 6, 11),
  (6, 5, TRUE, 200, 10, 7),
  (7, 5, TRUE, 250, 10, 9),
  (8, 9, TRUE, 300, 9, 8),
  (9, 5, FALSE, 250, 1, 3),
  (10, 5, FALSE, 100, 2, 3);

INSERT INTO RUNWAY VALUES 
  (0, TRUE, 8, 11),
  (1, TRUE, 5, 9),
  (2, TRUE, 6, 4),
  (3, TRUE, 7, 7),
  (4, TRUE, 7, 8),
  (5, TRUE, 8, 5),
  (6, TRUE, 9, 9),
  (7, FALSE, 10, 10),
  (8, FALSE, 9, 8),
  (9, FALSE, 7, 6);

INSERT INTO PASSENGER VALUES 
  (0, 'Семенов', 'Виктор', 'Александрович', '6521 789456'),
  (1, 'Павлов', 'Денис', 'Андреевич', '6521 885422'),
  (2, 'Петров', 'Александр', 'Богданович', '5451 854548'),
  (3, 'Морозов', 'Виктор', 'Валентинович', '6521 652135'),
  (4, 'Лебедев', 'Денис', 'Александрович', '5455 546455'),
  (5, 'Павлов', 'Илья', 'Владимирович', '6521 845123'),
  (6, 'Козлов', 'Илья', 'Максимович', '5422 215655'),
  (7, 'Макаров', 'Павел', 'Максимович', '6521 312155'),
  (8, 'Семенов', 'Матвей', 'Владимирович', '6521 145421'),
  (9, 'Яковлев', 'Павел', 'Михайлович', '6521 233232');

INSERT INTO SERVICE VALUES 
  (0, 'Cafe', 1, 6484546446),
  (1, 'Products', 1, NULL),
  (2, 'Security service', 1, 5461464511),
  (3, 'Migration service', 2, 4845441564),
  (4, 'Cafe', 2, 6484546446),
  (5, 'Control service1', 1, 8945841546),
  (6, 'Control service2', 1, 8546141215),
  (7, 'Control service3', 2, 4545445154),
  (8, 'Control service4', 2, 8546562151),
  (9, 'Control service5', 2, 5121546456);

INSERT INTO EMPLOYEE VALUES
  (0, 0, 'Семенов', 'Виктор', 'Александрович', '884451', 30000.0),
  (1, 1, 'Павлов', 'Денис', 'Андреевич', '5878', 50000.0),
  (2, 2, 'Петров', 'Александр', 'Богданович', '454', 400000.0),
  (3, 3, 'Морозов', 'Виктор', 'Валентинович', '885433', 400000.0),
  (4, 3, 'Лебедев', 'Денис', 'Александрович', '3468415', 50000.0),
  (5, 4, 'Павлов', 'Илья', 'Владимирович', '845123', 50000.0),
  (6, 4, 'Козлов', 'Илья', 'Максимович', '215655', 55000.0),
  (7, 5, 'Макаров', 'Павел', 'Максимович', '312155', 50000.0),
  (8, 6, 'Семенов', 'Матвей', 'Владимирович', '145421', 30000.0),
  (9, 7, 'Яковлев', 'Павел', 'Михайлович', '233232', 30000.0),
  (10, 7, 'Павлов', 'Павел', 'Владимирович', '848461', 50000.0),
  (11, 8, 'Козлов', 'Олег', 'Владимирович', '744444', 55000.0),
  (12, 8, 'Макаров', 'Олег', 'Максимович', '865456', 50000.0),
  (13, 9, 'Семенов', 'Павел', 'Владимирович', '887562', 35000.0),
  (14, 9, 'Яковлев', 'Матвей', 'Михайлович', '213654', 30000.0);

INSERT INTO COMFORTCLASS VALUES 
  (0, 15000),
  (1, 10000),
  (2, 9000),
  (3, 7000),
  (4, 6000),
  (5, 5500),
  (6, 4000),
  (7, 3500),
  (8, 3000),
  (9, 2500);

INSERT INTO FLIGHT VALUES 
  (0, '2019-04-04 20:00:00', '2019-04-04 23:00:00', 'Moscow', 'S-Pb', 2, 3),
  (1, '2019-05-01 19:00:00', '2019-05-01 23:00:00', 'Moscow', 'S-Pb', 2, 4),
  (2, '2019-08-01 09:00:00', '2019-08-01 13:00:00', 'Moscow', 'S-Pb', 3, 4),
  (3, '2019-07-04 10:00:00', '2019-07-04 14:00:00', 'Moscow', 'Novosibirsk', 3, 3),
  (4, '2019-01-04 20:00:00', '2019-01-04 23:00:00', 'Moscow', 'Novosibirsk', 0, 5),
  (5, '2019-05-21 04:00:00', '2019-05-21 09:00:00', 'Vladivostok', 'Moscow', 4, 1),
  (6, '2019-04-04 11:00:00', '2019-04-04 15:00:00', 'Vladivostok', 'Moscow', 0, 3),
  (7, '2019-04-20 20:00:00', '2019-04-20 23:00:00', 'Krasnodar', 'Moscow', 4, 5),
  (8, '2019-04-21 18:00:00', '2019-04-21 22:00:00', 'Krasnodar', 'Moscow', 7, 1),
  (9, '2019-05-13 16:00:00', '2019-05-13 20:00:00', 'Krasnodar', 'Moscow', 6, 4);

INSERT INTO TICKET VALUES 
  (0, 4, 3, 0),
  (1, 5, 3, 5),
  (2, 5, 4, 3),
  (3, 4, 4, 4),
  (4, 2, 4, 6),
  (5, 3, 3, 7),
  (6, 4, 7, 5),
  (7, 8, 7, 4),
  (8, 9, 1, 2),
  (9, 1, 1, 2);

INSERT INTO FLIGHT_X_SERVICE VALUES
  (0 , 0),
  (1 , 1),
  (2 , 2),
  (3 , 3),
  (4 , 4),
  (5 , 5),
  (6 , 6),
  (7 , 7),
  (8 , 8),
  (9 , 9),
  (4 , 2),
  (4 , 3),
  (5 , 4),
  (5 , 3);