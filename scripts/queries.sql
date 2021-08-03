SET SEARCH_PATH TO airport;

-- 1. Все пассажиры, прилетающие в Новосибирск 2019 в июле (7 месяц) 2019 года
SELECT p1.last_nm, p1.first_nm, p1.middle_nm
FROM
  passenger p1
INNER JOIN
  (SELECT t.passenger_id
  FROM
    ticket t
  INNER JOIN
    flight f
  ON t.flight_id = f.flight_id and f.where_txt = 'Novosibirsk'
      and f.arriving_dttm >= '2019-07-01 00:00:00' and f.arriving_dttm < '2019-08-01 00:00:00') as p2
ON p1.passenger_id = p2.passenger_id;

-- 2. Суммарная стоимость билетов, проданных на рейс Владивосток-Москва 21.05.2019
WITH t_x_fl AS
  (SELECT t.ticket_id, t.comfortclass_id
    FROM
      ticket t
    INNER JOIN
      flight f
    ON t.flight_id = f.flight_id and f.from_txt = 'Vladivostok' and f.where_txt = 'Moscow'
        and f.departure_dttm >= '2019-05-21 00:00:00' and f.departure_dttm < '2019-05-22 00:00:00')
SELECT sum(cc.price_amt)
FROM
  comfortclass cc
INNER JOIN
  t_x_fl tbl
ON cc.comfortclass_id = tbl.comfortclass_id;

-- 3. Для каждого пассажира найти среднюю цену купленных билетов
WITH prices as
(SELECT tbl.passenger_id, avg(tbl.price_amt) as avg_prices
FROM
  (SELECT t.ticket_id, t.passenger_id, cc.price_amt
  FROM
    ticket t
  INNER JOIN
    comfortclass cc
  ON t.comfortclass_id = cc.comfortclass_id) AS tbl
GROUP BY tbl.passenger_id)
SELECT p.last_nm, p.first_nm, p.middle_nm, pr.avg_prices
FROM
  passenger p
INNER JOIN
  prices pr
ON p.passenger_id = pr.passenger_id;

-- 4. Для каждого сервиса найти суммарную зарплату сотрудников
WITH tbl AS
  (WITH salaries AS
    (SELECT s.service_id, e.employee_id, e.salary_amt
    FROM
      service s
    INNER JOIN
      employee e
    ON s.service_id = e.service_id)
  SELECT sal.service_id, sum(sal.salary_amt) as sum_sal
  FROM salaries sal
  GROUP BY sal.service_id)
SELECT s.service_nm, t.sum_sal
FROM
  tbl t
INNER JOIN
  service s
ON t.service_id = s.service_id;

-- 5. Все пассажиры рейса Владивосток-Москва 21.05.2019, у которых фамилия начинается с 'Л'
SELECT p1.last_nm, p1.first_nm, p1.middle_nm
FROM
  passenger p1
INNER JOIN
  (SELECT t.passenger_id
  FROM
    ticket t
  INNER JOIN
    flight f
  ON t.flight_id = f.flight_id and f.from_txt = 'Vladivostok' and f.where_txt = 'Moscow'
        and f.departure_dttm >= '2019-05-21 00:00:00' and f.departure_dttm < '2019-05-22 00:00:00') as p2
ON p1.passenger_id = p2.passenger_id AND p1.last_nm LIKE 'Л%';

------------------------------------
--CRUD

-- 1-я таблица
SELECT *
FROM PASSENGER p
WHERE p.last_nm LIKE 'С%';

INSERT INTO PASSENGER VALUES (10, 'Зябликов', 'Виктор', 'Дмитриевич', '6521 865451');

UPDATE PASSENGER
SET first_nm = 'Яков'
WHERE last_nm = 'Зябликов';

DELETE
FROM PASSENGER
WHERE last_nm = 'Зябликов';

-- 2-я таблица

SELECT *
FROM FLIGHT f
WHERE f.from_txt = 'Moscow';

INSERT INTO FLIGHT VALUES (10, '2019-02-13 16:00:00', '2019-02-13 20:00:00', 'Novosibirsk', 'Moscow', 6, 4);

UPDATE FLIGHT
SET departure_dttm = '2019-02-13 15:00:00'
WHERE flight_id = 10;

DELETE
FROM FLIGHT
WHERE flight_id = 10;
