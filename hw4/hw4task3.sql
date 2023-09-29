create or replace view v_first_level_partition_info as
(
select ppn.nspname as parent_schema, ppc.relname as parent_table, cpn.nspname as child_schema, cpc.relname as child_table
from pg_inherits
         join pg_class cpc on pg_inherits.inhrelid = cpc.oid
         join pg_namespace cpn on cpc.relnamespace = cpn.oid
         join pg_class ppc on pg_inherits.inhparent = ppc.oid
         join pg_namespace ppn on ppc.relnamespace = ppn.oid);
