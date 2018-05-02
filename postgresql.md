```sql
select * from pg_stat_activity;

select pg_cancel_backend(__pid__);

-- list those commands from psql
select * from pg_stat_activity where application_name='psql';

select pg_terminate_backend(__pid__);  -- be careful with this one

select concat('foo', 'bar');
--> foobar

select 'foo'||'bar'
--> foobar

-- UPDATE joining with a table
update mytable as m
set price = o.price
from other_table as o
where m.other_table_id = o.id

-- if you cancel the query you're currenting writing by using \r
selexxt sflajs fadjs f\r

-- Upgrade to latest postgis
alter extension PostGIS upgrade;
```

## data partitions

```sql
ALTER TABLE mytable ATTACH PARTITION mytable_y2006m08 FOR VALUES FROM ('2008-02-01') TO ('2008-03-01');
ALTER TABLE mytable DETACH PARTITION mytable_y2006m08;
```

## size of databases
```sql
SELECT
    pg_database.datname,
    pg_size_pretty(pg_database_size(pg_database.datname)) AS size
    FROM pg_database;
```

## size of tables

```sql
SELECT relname as "Table",
        pg_size_pretty(pg_total_relation_size(relid)) As "Size",
        pg_size_pretty(pg_total_relation_size(relid) - pg_relation_size(relid)) as "External Size"
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC;
```

## copy table like another

```sql
CREATE TABLE mytable (LIKE othertable INCLUDING DEFAULTS INCLUDING CONTRAINTS);
```

## creating partition manually

```sql
CREATE TABLE measurement_y2008m02
  (LIKE measurement INCLUDING DEFAULTS INCLUDING CONSTRAINTS)
  TABLESPACE fasttablespace;

ALTER TABLE measurement_y2008m02 ADD CONSTRAINT y2008m02
   CHECK ( logdate >= DATE '2008-02-01' AND logdate < DATE '2008-03-01' );
-- good idea to have a CHECK, otherwise it will have to go through a validation
-- process and will have a lock on the parent table.  After you attach, you can
-- get rid of it

\copy measurement_y2008m02 from 'measurement_y2008m02'
-- possibly some other data preparation work

ALTER TABLE measurement ATTACH PARTITION measurement_y2008m02
    FOR VALUES FROM ('2008-02-01') TO ('2008-03-01' );
```

Date conversion
---------------

```sql
select to_char(now(), 'YYYY-MM');
```
