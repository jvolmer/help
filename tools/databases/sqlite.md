# dot commands
.help
    : display list of important sqlite dot commands  
.tables
    : show all tables
.show
    : show default setting for sqlite command prompt  
.header on, .mode column, .time on
    : modify output  
.databases
    : show databases
.dump
    : <dbname.db> .dump > <dbname.sql>  
    : convert database into sqlite statements and dump it into ASCII file  
.mode
    : .mode csv
    : set output mode
.separator
    : .separator "|"
    : set column separator
.import
    : .import <filen> <table>
    : import file to table, if table does not exists it uses the first row as columnnames, if table exists it uses first row as data input
.schema
    : .schema <table>
    : show the create statement for the table
.output
    : .output <file>
    : write to file, e.g. with .headers on, .mode csv, .output data.csv, select-statement, .quit


get a good output format
.header on
.mode column
sqlite3 -column -header <dbfile> "select * from MyTable"

# sql statements
create table
    : create table <table>("<column>" <type>, "<column>" ...);
    : <type> in {text, integer} [NOT NULL]
alter table
    : alter table <table> add <newColumnName> <type>;
    : alter table <table> rename to <newTableName>;
select
    : select <column>, <column>, ... from <table> [order by <criteria> limit <rowCount> offset <offset>;];  
    : select <column> from <table> where <condition1> [and/or <condition2> ...];  
    : select <column> from <table> where <column> like <pattern>;  
    pattern : % wildcard matches any sequence or zero or more characters
              _ wildcard matches any single character
              (if searched string includes e.g. _, then you add at end: escape '_')
    : select distinct ... : remove duplicate rows
    : select count(*); - gives number of rows
    : select count(distinct <columnname>) - gives number of unique entries in <columnname>
    : where _rowid_ = ... - use table-index
    : where length(<column>) ... - selct by string-length
    : group by <column> - you can use count(<column>), min, max, sum, avg, group_concat (to add strings) in select-clause
insert into
    : insert into <table> (column1, column2) values (value1, value2), (nextvalue1, nextvalue2), ...;
    : insert into <table> select ...
drop table if exists
    : drop table if exists <table>;  
update
    : update <table> set <colum1>=<value1>, ... where <condition>;  
delete
    : delete from <table> where <condition>;
join
    : SELECT A.a, B.b from A left join B on A.f = B.f where <condition>;
    : gives all column from A joined with B on condition A.f=B.f (rows with no B.f value will be given Null value)
