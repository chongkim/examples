```sql
select * from pg_stat_activity;

select pg_cancel_backend(__pid__);

-- list those commands from psql
select * from pg_stat_activity where application_name='psql';

select pg_terminate_backend(__pid__);

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

