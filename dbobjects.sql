CREATE or REPLACE DATABASE  sf_tuts;

USE DATABASE sf_tuts;

SELECT CURRENT_DATABASE(), CURRENT_SCHEMA();



CREATE OR REPLACE TABLE emp_basic(
    first_name STRING,
    last_name STRING,
    email STRING,
    street_address STRING,
    city STRING,
    state_date DATE
);


SELECT CURRENT_WAREHOUSE();


PUT file://///workspaces/snowtuts/ex1data/employees0*.csv @sf_tuts.public.%emp_basic;


LIST @sf_tuts.public.%emp_basic;
COPY INTO emp_basic
FROM @%emp_basic
FILE_FORMAT=(type='csv' field_optionally_enclosed_by='"')
PATTERN = '.*0[1-5].csv.gz'
ON_ERROR = 'skip_file';





INSERT INTO emp_basic VALUES
   ('Clementine','Adamou','cadamou@sf_tuts.com','10510 Sachs Road','Klenak','2017-9-22') ,
   ('Marlowe','De Anesy','madamouc@sf_tuts.co.uk','36768 Northfield Plaza','Fangshan','2017-1-26');



SELECT * FROM emp_basic WHERE email LIKE '%.uk';

SELECT first_name, last_name, DATEADD('day',90,state_date) as start_date FROM emp_basic WHERE state_date <= '2017-01-01';


DROP DATABASE IF EXISTS sf_tuts;

DROP WAREHOUSE IF EXISTS sf_tuts_wh;