

# 死锁排查
http://www.postgres.cn/docs/12/explicit-locking.html

```sql
--
SELECT * FROM pg_stat_activity WHERE "state" = 'active';
-- 2. 查询表中存在的锁
SELECT * FROM pg_locks;
SELECT * FROM pg_class;
select a.locktype, a.database, a.pid, a.mode, a.relation, b.relname
	from pg_locks a
	join pg_class b on a.relation = b.oid
--	where lower(b.relname) = "h5_game";
-- 3. 批量删除数据库链接
SELECT
	pg_terminate_backend ( pid ) 
FROM
	pg_stat_activity 
WHERE
	state = "active" 
	AND pid != pg_backend_pid ( ) 
	AND pid IN ( SELECT A.pid FROM pg_locks A JOIN pg_class b ON A.relation = b.oid WHERE LOWER ( b.relname ) = "news_content" )


SELECT
	pg_terminate_backend ( pg_stat_activity.pid ) 
FROM
	pg_stat_activity 
WHERE
	datname = 'god_eye' AND state = 'active'
	AND pid <> pg_backend_pid ( );


-- 表大小
SELECT 
table_schema || '.' || table_name 
AS table_full_name, pg_size_pretty(pg_total_relation_size('"' ||table_schema || '"."' || table_name || '"')) AS size
FROM 
information_schema.tables
ORDER BY
    pg_total_relation_size('"' || table_schema || '"."' || table_name || '"')
DESC limit 20;
```