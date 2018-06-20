## Basic SQL
```sql
        -- UPDATE joining with a table
        UPDATE mytable AS m
        SET price = o.price
        FROM other_table AS o
        WHERE m.other_table_id = o.id;

        -- UPDATE join with multiple tables
        UPDATE mytable AS m
        SET price = o.price
        FROM other_table AS o,
             third_table as t
        WHERE m.other_table_id = o.id,
              t.id = o.t_id;

        -- you cancel the query you're currenting writing by using \r
        selexxt sflajs fadjs f\r

        -- copy table like another
        CREATE TABLE mytable (LIKE othertable INCLUDING DEFAULTS INCLUDING CONTRAINTS);
```
## Strings
```sql
        SELECT SUBSTRING('abcde' FROM 2 FOR 3);
        --> 'bcd'

        SELECT CONCAT('foo', 'bar');
        --> 'foobar'

        SELECT 'foo'||'bar'
        --> 'foobar'
```
## Dates
```sql
        SELECT TO_CHAR(NOW(), 'YYYY-MM');
        --> '2018-05'
```
## Math
```sql
        select 5 % 2;  -- modulo
```
## System
```sql
        -- get a list of queries
        SELECT pid, query FROM pg_stat_activity;
        -- list those commands from psql
        SELECT pid, query FROM pg_stat_activity WHERE application_name='psql';

        SELECT pg_cancel_backend(1208);
        SELECT pg_terminate_backend(1208);  -- be careful with this one

        -- Upgrade to latest postgis
        ALTER EXTENSION PostGIS UPGRADE;

        -- list installed extensions
        \dx

        -- list all extensions
        select pg_available_extensions();

        -- size of databases
        SELECT  pg_database.datname,
                pg_size_pretty(pg_database_size(pg_database.datname)) AS size
        FROM pg_database;

        -- size of tables
        SELECT  relname AS "Table",
                pg_size_pretty(pg_total_relation_size(relid)) AS "Size",
                pg_size_pretty(pg_total_relation_size(relid) - pg_relation_size(relid)) AS "External Size"
        FROM pg_catalog.pg_statio_user_tables
        ORDER BY pg_total_relation_size(relid) DESC;
```
## Variables
```sql
        \set myvar 12
        select :myvar;
        select * from accounts where id = :myvar;
        \unset myvar
        \set   -- lists all variables

        select id, name from accounts limit 1 \gset
        -- now you have :id and :name set to those values
        select id, name from accounts limit 1 \gset my_
        -- now you have :my_id set to id and :my_name set to name
```
## Partitions
```sql
        -- create parition table
        CREATE TABLE mytable (id INT, account_id INT) PARTITION BY RANGE(account_id);

        -- create a subtable
        CREATE TABLE mypart PARTITION OF MASTER FOR VALUES FROM (1) TO (100);

        -- adding/removing partitions
        ALTER TABLE mytable ATTACH PARTITION mytable_y2006m08 FOR VALUES FROM ('2008-02-01') TO ('2008-03-01');
        ALTER TABLE mytable DETACH PARTITION mytable_y2006m08;

        -- creating partition manually
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

        -- create a sequence
        CREATE SEQUENCE my_seq
                START WITH 1
                INCREMENT BY 1
                NO MINVALUE
                NO MAXVALUE
                CACHE 1;
        CREATE TABLE foo(id integer DEFAULT nextval('my_seq') NOT NULL)
        PARTITION BY RANGE (id);
        ALTER SEQUENCE my_seq OWNED BY foo.id;
```
