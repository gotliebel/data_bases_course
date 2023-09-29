create or replace view all_tables as
(
select relname as tablename, pn.nspname as schemaname, pa.rolname as tableowner
from pg_class
         join pg_namespace pn on pg_class.relnamespace = pn.oid
         join pg_authid pa on pg_class.relowner = pa.oid
where relkind = 'r');

create or replace view tables_information as
(
select tableowner, schemaname, tablename, pg_relation_size(concat(schemaname, '.', tablename)) as size
from all_tables);

create or replace view tables_information_per_schema as
(
select tableowner, schemaname, sum(size) as per_schema_size
from tables_information
group by tableowner, schemaname);

create or replace view tables_total as
(
select tableowner, sum(per_schema_size) as total
from tables_information_per_schema
group by tableowner);

create or replace view joined1 as
(
select ti.tableowner   as tableowner,
       ti.schemaname   as schemaname,
       ti.tablename    as tablename,
       size            as table_size,
       per_schema_size as used_per_schema_user_total_size
from tables_information ti
         join tables_information_per_schema tips
              on ti.tableowner = tips.tableowner and ti.schemaname = tips.schemaname);

create or replace view v_used_size_per_user
            (table_owner, schema_name, table_name, table_size, used_per_schema_user_total_size, used_user_total_size) as
(
select j1.tableowner                                   as table_owner,
       schemaname                                      as schema_name,
       tablename                                       as table_name,
       pg_size_pretty(table_size)                      as table_size,
       pg_size_pretty(used_per_schema_user_total_size) as used_per_schema_user_total_size,
       pg_size_pretty(total)                           as used_user_total_size
from joined1 j1
         join tables_total tt on j1.tableowner = tt.tableowner
    );


