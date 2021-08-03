SET SEARCH_PATH TO airport;

CREATE VIEW plane_view AS
(
  SELECT p.plane_model_code, p.used_flg, p.seats_cnt, p.condition_code, p.plane_class_code
  FROM PLANE p
);

CREATE VIEW runway_view AS
(
  SELECT r.used_flg, r.condition_code, r.plane_class_no
  FROM RUNWAY r
);

CREATE VIEW passenger_view AS
(
  SELECT p.last_nm, p.first_nm, p.middle_nm, substr(p.passport_no, 1, 6) || '****'
                                             || substr(p.passport_no, 11, 1)
  FROM PASSENGER p
);

CREATE VIEW service_view AS
(
  SELECT s.service_nm, s.employee_cnt, s.telephone_no
  FROM SERVICE s
);

CREATE VIEW employee_view AS
(
  SELECT s.service_nm, e.last_nm, e.first_nm, e.middle_nm, e.salary_amt
  FROM
    EMPLOYEE e
  INNER JOIN
    SERVICE s
  ON e.service_id = s.service_id
);

CREATE VIEW comfortclass_view AS
(
  SELECT price_amt
  FROM COMFORTCLASS cc
);

CREATE VIEW flight_view AS
(
  SELECT f.departure_dttm, f.arriving_dttm, f.from_txt, f.where_txt
  FROM FLIGHT f
);

CREATE VIEW ticket_view AS
(
  WITH fl_x_tick_x_pass AS
  (
    WITH fl_x_tick AS
    (
    SELECT f.departure_dttm, f.arriving_dttm, f.from_txt, f.where_txt, t.passenger_id, t.comfortclass_id
    FROM TICKET t
           INNER JOIN
         FLIGHT f
         ON t.flight_id = f.flight_id
    )
    SELECT tbl.departure_dttm,
           tbl.arriving_dttm,
           tbl.from_txt,
           tbl.where_txt,
           tbl.comfortclass_id,
           p.last_nm,
           p.first_nm,
           p.middle_nm
    FROM PASSENGER p
           INNER JOIN
         fl_x_tick tbl
         ON p.passenger_id = tbl.passenger_id
  )
  SELECT tbl1.departure_dttm,
         tbl1.arriving_dttm,
         tbl1.from_txt,
         tbl1.where_txt,
         tbl1.last_nm,
         tbl1.first_nm,
         tbl1.middle_nm,
         cc.price_amt
  FROM
    COMFORTCLASS cc
  INNER JOIN
    fl_x_tick_x_pass tbl1
  ON cc.comfortclass_id = tbl1.comfortclass_id
);

CREATE VIEW flight_x_service_view AS
(
  WITH tbl AS
  (
    SELECT f.departure_dttm, f.arriving_dttm, f.from_txt, f.where_txt, f_x_s.service_id
    FROM
      FLIGHT f
    INNER JOIN
      FLIGHT_X_SERVICE f_x_s
    ON f.flight_id = f_x_s.flight_id
  )
  SELECT tbl.departure_dttm, tbl.arriving_dttm, tbl.from_txt, tbl.where_txt, s.service_nm
  FROM
    tbl
  INNER JOIN
    SERVICE s
  ON tbl.service_id = s.service_id
);

SELECT *
FROM plane_view;

SELECT *
FROM runway_view;

SELECT *
FROM passenger_view;

SELECT *
FROM service_view;

SELECT *
FROM employee_view;

SELECT *
FROM comfortclass_view;

SELECT *
FROM flight_view;

SELECT *
FROM ticket_view;

SELECT *
FROM flight_x_service_view;
