CREATE TABLE intel_cpus(
    id integer,
    cores integer,
    threads integer,
    cpu_name varchar(255),
    launch_date timestamp,
    lithography integer,
    base_frequency integer,
    turbo_frequency integer,
    cache_size integer, 
    tdp integer,
    product_line varchar(255),
    socket varchar(255),
    memory_type varchar(255),
    cpu_url URL,
    vertical_segment varchar(255),
    max_temp integer,
    sku integer,
    rating integer,
    win_compatibility varchar(255)
);

CREATE TABLE amd_cpus(
    id integer,
    cores integer,
    threads integer,
    cpu_name varchar(255),
    launch_date timestamp,
    lithography integer,
    base_frequency integer,
    turbo_frequency integer,
    cache_l1 integer,
    cache_l2 integer,
    cache_l3 integer,
    tdp integer,
    product_line varchar(255),
    socket varchar(255),
    memory_type varchar(255),
    cpu_url URL,
    vertical_segment varchar(255),
    max_temp integer,
    sku integer,
    rating integer,
    win_compatibility varchar(255)
);

create table intel_original(
    id integer,
    cores integer,
    threads integer,
    cpu_name varchar(255),
    processor_number varchar(255),
    launch_date timestamp,
    lithography integer,
    bus_speed integer,
    base_frequency integer,
    turbo_frequency integer,
    configurable_tdp_up_frequency integer,
    cache_size integer,
    tdp integer,
    configurable_tdp_up integer,
    price integer,
    product_line varchar(255),
    socket varchar(255),
    memory_type varchar(255),
    cpu_url URL,
    vertical_segment varchar(255),
    max_memory_size integer,
    cpu_status varchar(255),
    max_temp integer,
    sku integer,
    package_size varchar(255),
    fullname varchar(255)
);

CREATE TABLE amd_original(
    id integer,
    cores integer,
    threads integer,
    cpu_name varchar(255),
    launch_date timestamp,
    lithography integer,
    base_frequency integer,
    turbo_frequency integer,
    cache_l1 integer,
    cache_l2 integer,
    cache_l3 integer,
    tdp integer,
    product_line varchar(255),
    socket varchar(255),
    memory_type varchar(255),
    cpu_url URL,
    vertical_segment varchar(255),
    max_memory_speed integer,
    max_temp integer,
    sku integer,
    rating integer,
);


-- display exists because when you want to compare both AMD and INTEL processors it is necessary to have the common elements of the two processors
CREATE TABLE display(
    id integer,
    brand varchar(255),
    cores integer,
    threads integer,
    cpu_name varchar(255),
    launch_date varchar(255),
    lithography integer,
    base_frequency integer,
    turbo_frequency integer,
    cache_size integer,
    cache_l1 integer,
    cache_l2 integer,
    cache_l3 integer,
    tdp integer,
    product_line varchar(255),
    socket varchar(255),
    memory_type varchar(255),
    cpu_url URL,
    vertical_segment varchar(255),
    max_temp integer,
    sku integer,
    rating integer,
    win_compatibility varchar(255)
);

CREATE TABLE intel_benchmarks(
    sku integer,
    brand varchar(255)
    rating integer,
    benchmark_url URL
)


CREATE TABLE amd_benchmarks(
    sku integer,
    brand varchar(255)
    rating integer,
    benchmark_url URL
)