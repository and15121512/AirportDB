DROP SCHEMA IF EXISTS airport CASCADE;
CREATE SCHEMA airport;

SET search_path TO airport;

DROP TABLE IF EXISTS PLANE CASCADE;
CREATE TABLE PLANE (
  plane_id INT PRIMARY KEY,
  plane_model_code INT NOT NULL,
  used_flg BOOLEAN NOT NULL DEFAULT TRUE,
  seats_cnt SMALLINT NOT NULL DEFAULT 1 CHECK (seats_cnt > 0),
  condition_code SMALLINT NOT NULL CHECK (condition_code >= 0 AND condition_code <= 10),
  plane_class_code INT NOT NULL
);

DROP TABLE IF EXISTS RUNWAY CASCADE;
CREATE TABLE RUNWAY (
  runway_id INT PRIMARY KEY,
  used_flg BOOLEAN NOT NULL DEFAULT TRUE,
  condition_code INT NOT NULL CHECK (condition_code >= 0 AND condition_code <= 10),
  plane_class_no INT NOT NULL
);

DROP TABLE IF EXISTS PASSENGER CASCADE;
CREATE TABLE PASSENGER (
  passenger_id INT PRIMARY KEY,
  last_nm VARCHAR(30) NOT NULL,
  first_nm VARCHAR(30) NOT NULL,
  middle_nm VARCHAR(30),
  passport_no VARCHAR(30) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS SERVICE CASCADE;
CREATE TABLE SERVICE (
  service_id INT PRIMARY KEY,
  service_nm VARCHAR(50) NOT NULL,
  employee_cnt INT NOT NULL CHECK (employee_cnt > 0),
  telephone_no VARCHAR(20)
);

DROP TABLE IF EXISTS EMPLOYEE CASCADE;
CREATE TABLE EMPLOYEE (
  employee_id INT PRIMARY KEY,
  service_id INT REFERENCES SERVICE(service_id),
  last_nm VARCHAR(30) NOT NULL,
  first_nm VARCHAR(30) NOT NULL,
  middle_nm VARCHAR(30),
  position_code VARCHAR(50),
  salary_amt DECIMAL(15, 2) CHECK (salary_amt >= 0)
);

DROP TABLE IF EXISTS COMFORTCLASS CASCADE;
CREATE TABLE COMFORTCLASS (
  comfortclass_id INT PRIMARY KEY,
  price_amt DECIMAL(15, 2) CHECK (price_amt >= 0.0) DEFAULT 0.0
);

DROP TABLE IF EXISTS FLIGHT CASCADE;
CREATE TABLE FLIGHT (
  flight_id INT PRIMARY KEY,
  arriving_dttm TIMESTAMP,
  departure_dttm TIMESTAMP,
  from_txt VARCHAR(255) NOT NULL,
  where_txt VARCHAR(255),
  plane_id INT REFERENCES PLANE(plane_id),
  runway_id INT NOT NULL REFERENCES RUNWAY(runway_id)
);

DROP TABLE IF EXISTS TICKET CASCADE;
CREATE TABLE TICKET (
  ticket_id INT PRIMARY KEY,
  flight_id INT NOT NULL REFERENCES FLIGHT(flight_id),
  passenger_id INT NOT NULL REFERENCES PASSENGER(passenger_id),
  comfortclass_id INT REFERENCES COMFORTCLASS(comfortclass_id)
);

DROP TABLE IF EXISTS FLIGHT_X_SERVICE CASCADE;
CREATE TABLE FLIGHT_X_SERVICE (
  flight_id INT REFERENCES FLIGHT(flight_id),
  service_id INT REFERENCES SERVICE(service_id),
  CONSTRAINT PK_Flight_X_Service PRIMARY KEY (flight_id, service_id)
);
