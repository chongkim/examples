select * from pg_stat_activity;

select pg_cancel_backend(__pid__);

-- list those commands from psql
select * from pg_stat_activity where application_name='psql';

select pg_terminate_backend(__pid__);

select concat('foo', 'bar');
--> foobar

select 'foo'||'bar'
--> foobar
