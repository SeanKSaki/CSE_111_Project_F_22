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
