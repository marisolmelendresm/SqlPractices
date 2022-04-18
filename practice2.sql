-- Import practice
-- General syntaxis

COPY table_name
FROM 'C:\YourDirectory\your_file.csv'
WITH (FORMAT CSV, HEADER);

1. Importing the data
a. Create a table
b. Make the data available
c. Copy the files
d. It is possible to indicate the columns to import
e. It is possible to import only some records/rows using WHERE
f. It is possible to import to a temporary table, validate or change data and then do an insert to the original table

2. Exporting data
a. Export data from a table
b. Export data from a select

CREATE TABLE us_counties_pop_est_2019 (
    state_fips text,                         -- State FIPS code
    county_fips text,                        -- County FIPS code
    region smallint,                         -- Region
    state_name text,                         -- State name	
    county_name text,                        -- County name
    area_land bigint,                        -- Area (Land) in square meters
    area_water bigint,                       -- Area (Water) in square meters
    internal_point_lat numeric(10,7),        -- Internal point (latitude)
    internal_point_lon numeric(10,7),        -- Internal point (longitude)
    pop_est_2018 integer,                    -- 2018-07-01 resident total population estimate
    pop_est_2019 integer,                    -- 2019-07-01 resident total population estimate
    births_2019 integer,                     -- Births from 2018-07-01 to 2019-06-30
    deaths_2019 integer,                     -- Deaths from 2018-07-01 to 2019-06-30
    international_migr_2019 integer,         -- Net international migration from 2018-07-01 to 2019-06-30
    domestic_migr_2019 integer,              -- Net domestic migration from 2018-07-01 to 2019-06-30
    residual_2019 integer,                   -- Residual for 2018-07-01 to 2019-06-30
    CONSTRAINT counties_2019_key PRIMARY KEY (state_fips, county_fips)	
);

SELECT * FROM us_counties_pop_est_2019;

COPY us_counties_pop_est_2019
FROM '/tmp/us_counties_pop_est_2019.csv'
WITH (FORMAT CSV, HEADER);

-- Usando solo algunas columnas del csv

CREATE TABLE supervisor_salaries (
    id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    town text,
    county text,
    supervisor text,
    start_date text,
    salary numeric(10,2),
    benefits numeric(10,2)
);

COPY supervisor_salaries (town, supervisor, salary)
FROM '/tmp/supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);

SELECT * FROM supervisor_salaries ORDER BY id LIMIT 2;

DELETE FROM supervisor_salaries;

COPY supervisor_salaries (town, supervisor, salary)
FROM '/tmp/supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER)
WHERE town = 'New Brillig';

SELECT * FROM supervisor_salaries;


DELETE FROM supervisor_salaries;

CREATE TEMPORARY TABLE supervisor_salaries_temp 
    (LIKE supervisor_salaries INCLUDING ALL);
    
COPY supervisor_salaries_temp (town, supervisor, salary)
FROM '/tmp/supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);

INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Mills', supervisor, salary
FROM supervisor_salaries_temp;

DROP TABLE supervisor_salaries_temp;

SELECT * FROM supervisor_salaries ORDER BY id LIMIT 2;

COPY (
    SELECT county_name, state_name
    FROM us_counties_pop_est_2019
    WHERE county_name ILIKE '%mill%'
     )
TO '/tmp/us_counties_mill_export.csv'
WITH (FORMAT CSV, HEADER);
