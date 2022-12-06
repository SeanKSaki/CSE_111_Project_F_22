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
    sku integer
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
    sku integer
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
);

DELETE FROM benchmarks;

CREATE TABLE cpu_benchmarks(
    id integer,
    brand varchar(255),
    sku integer,
    rating integer,
    benchmark_url URL
);


CREATE TABLE win_11_compatibility_intel(
    manufacturer VARCHAR(255),
    brand VARCHAR(255),
    model VARCHAR(255)
);
CREATE TABLE win_10_compatibility_intel(
    manufacturer VARCHAR(255),
    brand VARCHAR(255),
    model VARCHAR(255)
);
CREATE TABLE win_8_compatibility_intel(
    manufacturer VARCHAR(255),
    brand VARCHAR(255),
    model VARCHAR(255)
);
CREATE TABLE win_7_compatibility_intel(
    manufacturer VARCHAR(255),
    brand VARCHAR(255),
    model VARCHAR(255)
);

CREATE TABLE win_11_compatibility_amd(
    manufacturer VARCHAR(255),
    brand VARCHAR(255),
    model VARCHAR(255)
);
CREATE TABLE win_10_compatibility_amd(
    manufacturer VARCHAR(255),
    brand VARCHAR(255),
    model VARCHAR(255)
);
CREATE TABLE win_8_compatibility_amd(
    manufacturer VARCHAR(255),
    brand VARCHAR(255),
    model VARCHAR(255)
);
CREATE TABLE win_7_compatibility_amd(
    manufacturer VARCHAR(255),
    brand VARCHAR(255),
    model VARCHAR(255)
);

