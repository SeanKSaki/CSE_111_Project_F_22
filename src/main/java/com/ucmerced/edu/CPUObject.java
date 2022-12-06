package com.ucmerced.edu;

public class CPUObject {
    int id;
    String brand;
    int cores;
    int threads;
    String cpu_name;
    String launch_date;
    int lithography;
    int base_frequency;
    int turbo_frequency;
    int cache_size;
    int cache_l1, cache_l2, cache_l3;
    int tdp;
    String product_line;
    String socket;
    String memory_type;
    String cpu_url;
    String vertical_segment;
    int max_temp;
    int sku;

    public CPUObject() {
    }

    public CPUObject(int id, String brand, int cores, int threads, String cpu_name, String launch_date, int lithography, int base_frequency, int turbo_frequency, int cache_size, int cache_l1, int cache_l2, int cache_l3, int tdp, String product_line, String socket, String memory_type, String cpu_url, String vertical_segment, int max_temp, int sku) {
        this.id = id;
        this.brand = brand;
        this.cores = cores;
        this.threads = threads;
        this.cpu_name = cpu_name;
        this.launch_date = launch_date;
        this.lithography = lithography;
        this.base_frequency = base_frequency;
        this.turbo_frequency = turbo_frequency;
        this.cache_size = cache_size;
        this.cache_l1 = cache_l1;
        this.cache_l2 = cache_l2;
        this.cache_l3 = cache_l3;
        this.tdp = tdp;
        this.product_line = product_line;
        this.socket = socket;
        this.memory_type = memory_type;
        this.cpu_url = cpu_url;
        this.vertical_segment = vertical_segment;
        this.max_temp = max_temp;
        this.sku = sku;
    }

    public int getId() {
        return id;
    }

    public String getBrand() {
        return brand;
    }

    public int getCores() {
        return cores;
    }

    public int getThreads() {
        return threads;
    }

    public String getCpu_name() {
        return cpu_name;
    }

    public String getLaunch_date() {
        return launch_date;
    }

    public int getLithography() {
        return lithography;
    }

    public int getBase_frequency() {
        return base_frequency;
    }

    public int getTurbo_frequency() {
        return turbo_frequency;
    }

    public int getCache_size() {
        return cache_size;
    }

    public int getCache_l1() {
        return cache_l1;
    }

    public int getCache_l2() {
        return cache_l2;
    }

    public int getCache_l3() {
        return cache_l3;
    }

    public int getTdp() {
        return tdp;
    }

    public String getProduct_line() {
        return product_line;
    }

    public String getSocket() {
        return socket;
    }

    public String getMemory_type() {
        return memory_type;
    }

    public String getCpu_url() {
        return cpu_url;
    }

    public String getVertical_segment() {
        return vertical_segment;
    }

    public int getMax_temp() {
        return max_temp;
    }

    public int getSku() {
        return sku;
    }

    @Override
    public String toString() {
        return "CPUObject{" +
                "id=" + id +
                ", brand='" + brand + '\'' +
                ", cores=" + cores +
                ", threads=" + threads +
                ", cpu_name='" + cpu_name + '\'' +
                ", launch_date='" + launch_date + '\'' +
                ", lithography=" + lithography +
                ", base_frequency=" + base_frequency +
                ", turbo_frequency=" + turbo_frequency +
                ", cache_size=" + cache_size +
                ", cache_l1=" + cache_l1 +
                ", cache_l2=" + cache_l2 +
                ", cache_l3=" + cache_l3 +
                ", tdp=" + tdp +
                ", product_line='" + product_line + '\'' +
                ", socket='" + socket + '\'' +
                ", memory_type='" + memory_type + '\'' +
                ", cpu_url='" + cpu_url + '\'' +
                ", vertical_segment='" + vertical_segment + '\'' +
                ", max_temp=" + max_temp +
                ", sku=" + sku +
                '}';
    }
}
