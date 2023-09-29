create or replace view v_first_level_partition_info as
(
select 1           as part_level,
       ppn.nspname as parent_schema,
       ppc.relname as parent_table,
       cpn.nspname as child_schema,
       cpc.relname as child_table
from pg_inherits
         join pg_class cpc on pg_inherits.inhrelid = cpc.oid
         join pg_namespace cpn on cpc.relnamespace = cpn.oid
         join pg_class ppc on pg_inherits.inhparent = ppc.oid
         join pg_namespace ppn on ppc.relnamespace = ppn.oid);


create or replace recursive view v_rec_level_partition_info(part_level, parent_schema, parent_table, child_schema, child_table) as
(
select part_level, parent_schema, parent_table, child_schema, child_table
from v_first_level_partition_info
union all
select r.part_level + 1, r.parent_schema, r.parent_table, f.child_schema, f.child_table
from v_rec_level_partition_info r
         join v_first_level_partition_info f on r.child_table = f.parent_table and r.child_schema = f.parent_schema
    );
