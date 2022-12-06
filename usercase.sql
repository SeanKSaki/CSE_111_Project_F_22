-- User want to find an cpu from certain brand that is compatable with a windows version and with customized rating score

-- After filters are applied, the sql query will be edited through java according to the selections
-- In this case, our user want to find AMD CPUS, compatiable with WINDOWS 11, and benchmark score higher than 10,000
-- the queries will then be executed by the namedjdbctemplate and front-end will show the display table to the user


delete from display;

insert into display (id, cores, threads, cpu_name, launch_date, lithography, base_frequency, turbo_frequency, cache_size, tdp, product_line, 
                        socket, memory_type, cpu_url, vertical_segment, max_temp, sku, rating)
select id, cores, threads, cpu_name, launch_date, lithography, base_frequency, turbo_frequency, 
        cache_l1, cache_l2, cache_l3, tdp, product_line, socket, memory_type, cpu_url, vertical_segment, max_temp, sku, ratings
from (select * 
        from amd_cpus as cpu_table, benchmarks as benchmarks_table
        where cpu_table.sku = benchmarks_table.sku
        and benchmarks_table.brand = 'AMD'
        and benchmarks_table.rating > 10000) as filtered_cpus
join win_11_compatibility_amd as compatibility_table on filtered_cpus.cpu_name = compatibility_table.cpu_name and compatibility = 1;

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
join win_//:version//_compatibility_//:brand// as compatibility_table on filtered_cpus.cpu_name = compatibility_table.cpu_name and compatibility = ?;
*/