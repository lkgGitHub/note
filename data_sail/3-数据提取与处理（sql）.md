# 1. sql基础知识

## 基本概念

1. sql:  structured query language(结构化查询语言)
2. database/schema（数据库）
3. table（表）
4. row（行）
5. column（列）

## 数据字典

数据库说明书，查询表或者字段含义

## 企业中数据分析工作流程

得到分析需求 -> 确定数据位置 ->  构建问题解决逻辑 -> 构建SQL语句 ->  获得分析结果

# 2. SQL核心语句

## 1.查询

select column_name from table_name where    order by   desc(降序) limit num

## 2.聚合（group by）

![image-20200728132158667](.\3-数据提取与处理.assets\image-20200728132158667.png)

![image-20200728132531660](.\3-数据提取与处理.assets\image-20200728132531660.png)

## 3.数据表间连接

1. inner join
2. left join
3. right join

on和where区别

# sql高级用法

## 1. 子查询

- 单行单列过滤条件子查询：返回**单行单列**值作为结果
- 多行单列过滤条件子查询：返回**多行单列**值作为结果
- 临表子查询麽：返回临时列表 (**多行多列**) 作为结果

## 2.条件判断语句

```mssql
case
where 判断条件 then 判断结果
else 
end
```

## 3. 窗口函数

- 序号函数：row_number() / rank() / dense_rank()
- 分布函数：percent_rank() / cume_dist()
- 前后函数：lag() / lead()
- 头尾函数：first_val() / last_val()
- 其他函数：nth_value() / nfile()