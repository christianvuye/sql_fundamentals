create table customers
(
    customer_id integer not null
        constraint customers_pk
            primary key,
    first_name  varchar(50),
    last_name   varchar(50),
    city        varchar(50),
    state       varchar(2)
);

alter table customers
    owner to postgres;

create table employees
(
    employee_id integer not null
        constraint employees_pk
            primary key,
    first_name  varchar(50),
    last_name   varchar(50),
    department  varchar(50),
    salary      integer
);

alter table employees
    owner to postgres;

create table products
(
    product_id   integer not null
        constraint products_pk
            primary key,
    product_name varchar(50),
    price        numeric(10, 2)
);

alter table products
    owner to postgres;

create table orders
(
    order_id     integer not null
        constraint orders_pk
            primary key,
    customer_id  integer
        constraint orders_customers_customer_id_fk
            references customers,
    order_date   date,
    total_amount numeric(10, 2)
);

alter table orders
    owner to postgres;

create table order_items
(
    order_item_id integer not null
        constraint order_items_pk
            primary key,
    order_id      integer
        constraint order_items_orders_order_id_fk
            references orders,
    product_id    integer
        constraint order_items_products_product_id_fk
            references products,
    quantity      integer
);

alter table order_items
    owner to postgres;

create table employee_locations
(
    employee_id integer     not null
        constraint employee_locations_employees_employee_id_fk
            references employees,
    city        varchar(50) not null,
    is_primary  boolean,
    primary key (employee_id, city)
);

alter table employee_locations
    owner to postgres;

create table sales_records
(
    record_id   serial
        primary key,
    order_id    integer
        constraint sales_records_orders_order_id_fk
            references orders,
    employee_id integer
        constraint sales_records_employees_employee_id_fk
            references employees
);

alter table sales_records
    owner to postgres;

