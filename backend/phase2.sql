-- Populate tables with only common attributes from the original datasets
INSERT INTO intel_cpus
SELECT *
FROM(
SELECT id, cores, threads, cpu_name, launch_date, lithography, base_frequency, turbo_frequency, cache_size, tdp, product_line, socket, memory_type, cpu_url, vertical_segment, max_temp, sku
FROM intel_original);

INSERT INTO amd_cpus
SELECT *
FROM(
SELECT id, cores, threads, cpu_name, launch_date, lithography, base_frequency, turbo_frequency, cache_l1, cache_l2, cache_l3, tdp, product_line, socket, memory_type, cpu_url, vertical_segment, max_temp, sku
FROM amd_original);

INSERT INTO amd_benchmarks
SELECT *
FROM benchmarks
where brand = 'amd';

INSERT INTO intel_benchmarks
SELECT *
FROM benchmarks
where brand = 'intel';

-- Clean display table
DELETE from display;

--Populating Display Table
-- Filtering can be done through here by including or excluding columns as well but these will be the default to include all

INSERT INTO display (id, cores, threads, cpu_name, launch_date, lithography, base_frequency, turbo_frequency, cache_l1, cache_l2, cache_l3, tdp, product_line, socket, memory_type, cpu_url, vertical_segment, max_temp, sku)
SELECT id, cores, threads, cpu_name, launch_date, lithography, base_frequency, turbo_frequency, cache_l1, cache_l2, cache_l3, tdp, product_line, socket, memory_type, cpu_url, vertical_segment, max_temp, sku
from amd_cpus;

UPDATE display
set brand = 'AMD'
where brand ISNULL;

INSERT INTO display (id, cores, threads, cpu_name, launch_date, lithography, base_frequency, turbo_frequency, cache_size, tdp, product_line, socket, memory_type, cpu_url, vertical_segment, max_temp, sku)
SELECT id, cores, threads, cpu_name, launch_date, lithography, base_frequency, turbo_frequency, cache_size, tdp, product_line, socket, memory_type, cpu_url, vertical_segment, max_temp, sku
from intel_cpus;

UPDATE display
set brand = 'INTEL'
where brand ISNULL;

-- Applying Filters
-- If filters do not have certain columns they will not be loaded into dispaly initially and that will be handeled through the backend of our site

SELECT *
FROM display
WHERE brand = 'AMD'
AND threads > 4;


-- Information like generation and series 
SELECT *
FROM display
WHERE brand = 'INTEL'
AND product_line LIKE '%Core i5%'

SELECT *
FROM display
where brand = 'INTEL'
AND product_line LIKE '%5th Generation%'

SELECT *
FROM display
WHERE brand = 'AMD'
AND product_line LIKE '%Ryzen 5%'

SELECT *
FROM display
where brand = 'AMD'
AND product_line LIKE '%Threadripper%'

-- get type of processor 

SELECT *
FROM display
WHERE product_line LIKE '%Desktop%'

SELECT *
FROM display
WHERE product_line LIKE '%Mobile%'

SELECT *
FROM display
WHERE product_line LIKE '%Laptop%'

SELECT *
FROM display
where brand = 'INTEL'
AND (cpu_name LIKE '%U' or cpu_name LIKE '%H' or cpu_name LIKE '%Y') -- Intel CPU's denoted with U at the end are for laptops and H is for high performance laptops and Y is for extremely low power

SELECT *
FROM display
where brand = 'INTEL'
AND cpu_name LIKE '%T' -- Intel CPU's denoted with T at the end are lower power CPUs

-- get multiple socket types so user's can find compatibility with motherboards

SELECT *
FROM display
WHERE socket LIKE '%AM4%' 

SELECT *
FROM display
WHERE socket LIKE '%FCBGA1364%'

-- get cpus that are overclockable

SELECT *
from display
where (cpu_name LIKE '%K' or cpu_name like '%X') -- Intel CPUs with K or X are overlockable while the X ones are high end ones
AND brand = 'INTEL'

SELECT *
FROM display
WHERE product_line LIKE '%Ryzen%' -- All Ryzen CPU's are overclockable

-- get CPUs with high core count
SELECT *
FROM display
WHERE cores >= 16
ORDER BY cores DESC

-- get CPUs with high thread count
SELECT *
FROM display
WHERE threads >= 40
ORDER BY threads DESC

-- get CPUs with a high base clock
SELECT *
FROM display
WHERE base_frequency > 4000

-- get CPUs with low TDP
SELECT *
FROM display
WHERE tdp < 50

-- get CPUs with DDR4 memeory
SELECT *
FROM display
WHERE memory_type LIKE '%DDR4%'


-- User want to find an cpu from certain brand with customized rating score
-- After filters are applied, the sql query will be edited through java according to the selections

-- In this case, our user want to find AMD CPUS, and benchmark score higher than 10,000
-- the queries will then be executed by the namedjdbctemplate and front-end will show the display table to the user

select id, cores, threads, cpu_name, launch_date, lithography, base_frequency, turbo_frequency, 
        cache_l1, cache_l2, cache_l3, tdp, product_line, socket, memory_type, cpu_url, vertical_segment, max_temp, sku, rating
from (select * 
        from amd_cpus as cpu_table, cpu_benchmarks as benchmarks_table
        where cpu_table.sku = benchmarks_table.sku
        and benchmarks_table.brand = 'amd'
        and benchmarks_table.rating > 10000) as filtered_cpus


        --the below code will be the code in the java file in backend
/*
insert into display (id, cores, threads, cpu_name, launch_date, lithography, base_frequency, turbo_frequency, cache_size, tdp, product_line, 
                        socket, memory_type, cpu_url, vertical_segment, max_temp, sku, rating)
select id, cores, threads, cpu_name, launch_date, lithography, base_frequency, turbo_frequency, 
        cache_l1, cache_l2, cache_l3, tdp, product_line, socket, memory_type, cpu_url, vertical_segment, max_temp, sku, ratings
from (select * 
        from //:brand_cpu// as cpu_table, benchmarks as benchmarks_table
        where cpu_table.sku = benchmarks_table.sku
        and benchmarks_table.brand = //:brand_name//
        and benchmarks_table.rating > //:ratings//) as filtered_cpus
*/



-- find processors that have been supported throughout the past few versions of windows to see which ones are likely to be future proof

SELECT *
from win_10_compatibility_intel as ten, win_11_compatibility_intel as eleven, win_8_compatibility_intel as eight, win_7_compatibility_intel as seven
WHERE ten.model = eleven.model
AND eight.model = eleven.model
AND seven.model = eight.model;

