# PostgreSQL Database & Schema Size Queries

## 1️⃣ Get the Total Size of the Current Database
```sql
SELECT pg_size_pretty(pg_database_size(current_database()));
```
✅ Returns the size of the currently connected database in a human-readable format.

### Get Size for a Specific Database
```sql
SELECT pg_size_pretty(pg_database_size('your_database'));
```
✅ Replace `your_database` with the actual database name.

---

## 2️⃣ Get the Size of All Databases
```sql
SELECT datname AS database_name, pg_size_pretty(pg_database_size(datname)) AS size
FROM pg_database
ORDER BY pg_database_size(datname) DESC;
```
✅ Lists all databases and their sizes in descending order.

---

## 3️⃣ Get the Size of All Schemas in the Current Database
```sql
SELECT nspname AS schema_name,
       pg_size_pretty(SUM(pg_total_relation_size(pg_class.oid))) AS schema_size
FROM pg_namespace
JOIN pg_class ON pg_class.relnamespace = pg_namespace.oid
WHERE nspname NOT LIKE 'pg_%' AND nspname <> 'information_schema'
GROUP BY nspname
ORDER BY SUM(pg_total_relation_size(pg_class.oid)) DESC;
```
✅ Returns the total size of all schemas, excluding system schemas.

---

## 4️⃣ Get the Size of All Tables in a Schema
```sql
SELECT relname AS table_name,
       pg_size_pretty(pg_total_relation_size(relid)) AS table_size
FROM pg_stat_user_tables
WHERE schemaname = 'your_schema'
ORDER BY pg_total_relation_size(relid) DESC;
```
✅ Replace `your_schema` with the actual schema name.

---

## 5️⃣ Get the Size of an Individual Table
```sql
SELECT pg_size_pretty(pg_total_relation_size('your_schema.your_table'));
```
✅ Replace `your_schema.your_table` with the actual table name.

---

## 6️⃣ Get the Size of Indexes in the Database
```sql
SELECT pg_size_pretty(SUM(pg_relation_size(indexrelid))) AS total_index_size
FROM pg_stat_user_indexes;
```
✅ Shows how much space indexes are consuming in the database.

---

## 🚀 Summary of Useful Size Queries

| Task | Query |
|------|---------|
| Get size of the current database | `SELECT pg_size_pretty(pg_database_size(current_database()));` |
| Get size of a specific database | `SELECT pg_size_pretty(pg_database_size('your_database'));` |
| Get size of all databases | `SELECT datname, pg_size_pretty(pg_database_size(datname)) FROM pg_database ORDER BY pg_database_size(datname) DESC;` |
| Get size of all schemas | `SELECT nspname, pg_size_pretty(SUM(pg_total_relation_size(pg_class.oid))) FROM pg_namespace JOIN pg_class ON pg_class.relnamespace = pg_namespace.oid WHERE nspname NOT LIKE 'pg_%' AND nspname <> 'information_schema' GROUP BY nspname ORDER BY SUM(pg_total_relation_size(pg_class.oid)) DESC;` |
| Get size of all tables in a schema | `SELECT relname, pg_size_pretty(pg_total_relation_size(relid)) FROM pg_stat_user_tables WHERE schemaname = 'your_schema' ORDER BY pg_total_relation_size(relid) DESC;` |
| Get size of a single table | `SELECT pg_size_pretty(pg_total_relation_size('your_schema.your_table'));` |
| Get total size of indexes | `SELECT pg_size_pretty(SUM(pg_relation_size(indexrelid))) FROM pg_stat_user_indexes;` |

---

### 🔥 Save this file in GitHub for easy reference! 🚀

