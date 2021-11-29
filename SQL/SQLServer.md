# SQL Server 笔记

## 第4章 SQL与数据表第的管理

### 4.1 基本介绍

SQL(Structured Query Language)

| SQL功能· | 核心动词                                         |
| -------- | ------------------------------------------------ |
| 数据查询 | SELECT（查询）                                   |
| 数据操纵 | INSERECT（添加）、UPDATE（修改）、DELETE（删除） |
| 数据定义 | CREATE（创建）、DROP（删除）、ALTER（修改）      |
| 数据控制 | GRANT（授权）、REVOKE（收权、撤销）              |

### 4.2 数据库的创建

| 关键字     |                             描述                             |
| ---------- | :----------------------------------------------------------: |
| ON         | 表示数据库是根据后面的参数来创建的，用来定义主数据文件和辅助数据文件。ON后跟以逗号分割的数据文件定义列表和文件组。 |
| 数据库名   |                      在服务器上上唯一的                      |
| PRIMARY    |                        用来指定主文件                        |
| LOG ON     |             用来定义存储数据库日志的事务日志文件             |
| NAME       |                用于指定数据库文件的逻辑文件名                |
| FILENAME   |      用于指定数据库文件在操作系统的下的物理路径和文件名      |
| SIZE       |                 用于指定数据库文件的初始大小                 |
| MAXSIZE    |               用于指定数据库文件的最大文件大小               |
| FILEGROWTH |                  用于指定数据库文件的增加量                  |

```sql
CERTEATE DATABASE <name>
```

![image-20211114110059051](C:\Users\13980\OneDrive - iweii\桌面\笔记\MySQL基础\img\image-20211114110059051.png)

#### 4.2.3 数据库的修改

| 关键字         | 描述                                                         |
| -------------- | ------------------------------------------------------------ |
| ALTER DATABASE | 指定要修改的数据库名称                                       |
| ADD FILE       | 表示向数据库添加一个新的数据文件                             |
| ADD LOG FILE   | 表示向数据库添加日志文件                                     |
| REMOVE FILE    | 表示从数据库中删除文件                                       |
| MODIFY FILE    | 指定要更改的数据文件定义（更改选项包括FILENAME、SIZE、MAXSZIE、FILEGROETH） |
| MODIFY NAME    | 用于重命名数据库                                             |

![image-20211114111139727](C:\Users\13980\OneDrive - iweii\桌面\笔记\MySQL基础\img\image-20211114111139727.png)

#### 4.2.4 数据库的删除

```sql
DROP DATABASE <name>
```

### 4.3 基本表的创建与管理

#### 4.3.3 基本表的创建

```sql
CREATE TABLE tableName
(
    attribute1 type1,
    attribute1 type2,
    atrribute3 type3

);
```

#### 4.3.4 数据的完整性约束

| 列级完整性约束     | 表级完整性约束   |
| ------------------ | ---------------- |
| PRIMARY KEY 主键   | PRIMARY KEY 主键 |
| FOREIGN KEY 外键   | FOREIGN KEY 外键 |
| UNIQUE 唯一        | UNIQUE 唯一      |
| CHECK 检查         | CHECK 检查       |
| DEFAULT 默认       |                  |
| NULL\NOT NULL 空值 |                  |

```sql
FOREIGN KEY (attributef) REFERENCE tableName(attribute) 
```

```sql
PRIMARY KEY (attribute1,attribute2)
```

#### 4.3.5 基本表的修改和删除

##### 4.3.5.1 基本表的修改

修改表**结构**

```sql
ALTER TABLE <tableName>
[ADD <新表名> <数据类型> <完整性约束>]  --添加新列
[DROP COLUMN <列名>]				  --删除列
[ALTER COLUMN <列名> <数据类型>]     --修改列定义
[ADD <完整性约束>]				    --添加约束
[DROP <完整性约束>]                  --删除约束
```

##### 4.3.5.2 基本表的删除

```sql
DROP TABLE tableName
```

### 4.4 数据更新

#### 4.4.2 插入数据(INSERT)

```sql
INSERT INTO <目标表>[(<属性1>,<属性2>,...)]
VALUES (<常量1>,<常量2>,...)
```

#### 4.4.3 修改数据(UPDATE)

依据给定条件，对数据库表中的指定**数据**进行更新处理

```sql
UPDATE <基本表>
SET <列名1>=<表达式1>[,<列名2>=<表达式2>,...]
[WHERE <条件表达式>]
```

例子，将所有学生的分数提高10%

```sql
UPDATE SC
SET Score= Scope*1.1
```

#### 4.4.4 删除数据（DELETE）

```sql
DELETE FROM <表名>
[WHERE <条件表达式>]
```

DELETE与UPDATE操作一次只能操作一张表,因此会影响参照完整性

#### 4.4.5 删除表中所有记录

```sql
TRUNCATE TABLE <表名>
```

1. 表中记录删除后不能恢复

2. 速度比 DELETE  TABLE 快因为DELETE每删除一句，要在事务日志中记录，而TRUNCATE直接释放
3. TRUNCATE 仅仅删除数据
4. 如果要删除数据同时删除表结构，是有DROP TABLE语句



## 第5章 数据查询

### 5.2 查询的基本结构

```sql
SELECT [ALL | DISTINCT]<目标列表达式1>...
FROM <表名或视图名>... |
	(SELECT>) [AS] <别名> [WHERE<条件表达式>]
[GROUP BY <列名> [HAVING<条件表达式>]]
[ORDER BY <列名> [ASC] [DESC]]
```

查询语句含义是：

根据WHERE子句的条件表达式从FROM子句指定的基本表、视图或派生表中找出满足条件的元祖；再按SELECT子句中的目标列表达式选出元祖中的属性值形成结果表

如果有```GROUP BY```子句 ,则结果按<列名>的进行分组，改属性列的值相等的元祖为一个组。通常会在每组中作用聚合函数,若含有```HAVING```短语，则只有满足指定条件的组才予以输出。

如果有```ORDER BY```子句，则结果还要按照<列名>升序或者降序

### 5.3 简单查询

#### 5.3.1 SELEC..FROM..

(3)查询 经过计算的值

(4)查询 可使用库函数

(5)查询 可使用字符串常量(但会输出无列表名称)

(6)给属性列起别名

可以为属性列取一个便于理解的别名,如用中文来显示列名,为属性列取别名特别合适

取别名可以用空格或者AS两种方式

例子:

```sql
SELECT Sname AS 学会姓名,'出生年份'AS 出生日期,2020-Age 出生年份      
FROM Stu;
```

![image-20211122141851705](C:\Users\13980\OneDrive - iweii\桌面\笔记\MySQL基础\img\image-20211122141851705.png)



(7)使用DISTINCT，消除查询结果中取值重复的元祖

​	SQL查询默认是不消除查询结果中的重复元祖的,因为消除重复元祖要消耗系统资源.如果需要消除结果中重复元祖,则需要使用DISTINCT关键字

#### 5.3.2 WHERE

条件表达式运算符

|  查询条件  |            运算符            |             含义              |
| :--------: | :--------------------------: | :---------------------------: |
| 比较表达式 |        <,>,=.!>,!=...        |           大小比较            |
|  确定范围  | Betwee...And,Not Between And | 在..范围之内、不在...范围之内 |
|  确定集合  |          In,Not In           |         是否在集合内          |
|  模糊查询  |        Like, Not Like        |         类似、不类似          |
|  空值判断  |     Is Null，Is Not Null     |           空值判断            |
|  逻辑谓词  |          And,Or,Not          |           逻辑关系            |

where 条件表达式之间用 OR 不要用 AND

```sql
--IN关键字的使用
SELECT Sname,Mno,Age
FROM Stu
WHERE Mno='SE' OR Mno='NE' OR Mno='EC' ;

SELECT  Sname,Mno,Age
FROM Stu
WHERE Mno IN('SE','NE','EC'); 
```

常用通配符

|   通配符    |             描述             |
| :---------: | :--------------------------: |
|  %(百分号)  | 表示0个或n个字符的任意字符串 |
| _ (下划线)  |    表示0个或任意单个字符     |
| [] (中括号) |     指定范围中的任意字符     |
|     [^]     | 不属于指定范围的任何单个字符 |

ESCAPE 换码字符

优先级:NOT>AND>OR

#### 5.3.3 统计汇总函数(聚集函数)

常用的统计汇总函数(SELECT 后使用)

| 函数名                          | 说明                   |
| :------------------------------ | ---------------------- |
| COUNT(*)                        | 统计某个元组(行)的行数 |
| COUNT([DISTINCT \| ALL] <列名>) | 统计某一列的值得个数   |
| SUM([DISTINCT \| ALL] <列名>)   | 求和                   |
| AVG([DISTINCT \| ALL] <列名>)   | 求平均                 |
| MAX([DISTINCT \|ALL] <列名>)    | 最大值                 |
| MIN([DISTINCT \|  ALL] <列名>)  | 最小值                 |

#### 5.3.4 GROUP  BY 子句

使用GROUP BY 子句的SELECT 是有限制的，只能使用两类

1. 统计汇总函数
2. GROUP BY 后的属性

```sql
SELECT Sex 性别,COUNT(Sno) 人数
FROM Stu 
GROUP BY Sex;
```

![image-20211122152602773](C:\Users\13980\OneDrive - iweii\桌面\笔记\MySQL基础\img\image-20211122152602773.png)

#### 5.3.5 HAVING子句

GROUP BY子句可以实现分组,如果用需要从所有组中挑选符合一定条件的组，

则HAVING可以帮助查实现选择满足条件的分组

```sql
SELECT...FROM...[WHERE...]
GROUP BY 属性名 ...
HAVING 条件表达式
```

此处的条件表达式可以使用聚合函数

**where子句中是不能用聚集函数作为条件表达式的**

#### 5.3.6 ORDER BY子句

可以对查询结果进行排序.可以按照一个或多个属性列的升序(ASC)或降序(DESC)排序,默认值为升序

```sql
SELECT...FROM...
[...]
ORDER BY 属性名 ASC|DESC(升序|降序) ...
```



### 5.4 数据查询扩展功能

#### 5.4.1 使用TOP限制结果集

在使用SELECT语句进行查询的时候,列出结果集中的前几行数据

```sql
SELECT TOP n[Percent][WITH TIES]
FROM 表名
```

TOP n : 取查询结果的前几行数据

TOP n percent : 取查询结果的前n%行数据

WITH TIES: 表示包括最后一行取值并列的结果

**ps :**

1. **top谓词写在SELECT单词的后面(如果有DISTINCT话,则TOP写在DISTINCT的后面)**

2. **在使用TOP谓词时,应该与ORDER BY 一起使用**

#### 5.4.2 COMPUTE 子句

GROUP BY 子句实现了数据的分组汇总,但结果集中不包含数据明细.SELECT命令中的COMPUTE子句不仅能够在查询结果集中生成汇总行,还能生成明细行,并计算各组的汇总值和整个结果集的汇总值

```sql
COMPUTE 聚合函数(属性名) [BY 属性名];
```

#### 5.4.3 将查询结果保存到新表中(INTO)

```sql
SELECT <目标列表达式>
INTO <新表名>
FROM 数据源
[...]
```

### 5.5. 集合查询

SELECT 查询操作的对象是集合,结果也是集合

| 关键词    | 含义   |
| --------- | ------ |
| UNION     | 并操   |
| INTERSECT | 交操作 |
| EXCEPT    | 差操作 |

```sql
　　SELECT Name FROM Person_1
　　UNION
　　SELECT Name FROM Person_2
　　
　　SELECT Name FROM Person_1
　　EXCEPT
　　SELECT Name FROM Person_2
　　
　　SELECT Name FROM Person_1
　　INTERSECT
　　SELECT Name FROM Person_2
　　ORDER BY Name DESC　　　
```

### 5.6 连接查询

多张表综合在一起获得查询结果,综合在一起就是连接

连接查询包括内连接、自连接、外连接、交叉连接

#### 5.6.1 内连接

##### 5.6.1.1 等值连接

通过两张表的公共属性,把不同表的相同逻辑的元组连接起来

```sql
SELECT 表1.* ,表2.*
FROM 表1,表2
WHERE 表名1.列名1=表名2.列名2   
```

对于多个表中的不同属性名,可以不用在属性名前加表名

##### 5.6.1.2 自然连接

若在等值连接中把目标列中重复的属性去掉,则称为自然连接

#### 5.6.2 自连接

是某个表与自己吱声进行的连接.

#### 5.6.3 外连接

### 5.7 嵌套查询

#### 5.7.1 嵌套查询概述

在SQL当中,一个SELECT-FROM-WHERE 语句称为一个查询块.将一个查询块嵌套在另一个查询块的WHERE子句或HAVING子句的条件中的查询称为嵌套查询.

一般,使用子查询的目的是集合成员的检查,如判断元祖是否属于某个集合、进行集合的比较运算,以及测试是否为空集等,具体表现在如下几个方面:

1. 元素与集合见得属于关系
2. 集合之间的包含和相等关系
3. 集合的存在关系
4. 元素与集合之间的比较关系

包含子查询的语句通常采用以下格式中的一种

+ WHERE 表达式 [NOT] IN
+ WHERE 表达式 比较运算符 
+ WHERE [NOT] EXISTS

5.7.2 不相关子查询

不相关子查询是**子查询的查询条件不依赖父查询**.它的执行过程是由**内向外逐层处理**的,即每个子查询都会在它的上一级父类查询处理之前求解.子查询的结果用于建立其父查询的查询条件

子查询可以独立运行,并且只执行一次,执行完毕后将值传递给外部查询

不相关子查询中常用的父子查询之间的谓词有:

1. IN
2. 比较运算谓词
3. ANY/ALL

![image-20211128113009874](C:\Users\13980\OneDrive - iweii\桌面\笔记\MySQL基础\img\image-20211128113009874.png)



## 6.视图和索引
### 6.1. 视图的创建与管理
外模式：用户与数据库系统的接口，以用户的方式表示

不同的用户可以通过不同的外模式(视图)访问数据库。

#### 6.1.1 **视图的定义**

视图是从一个或多个基本表(或视图)中导出的虚表。数据库只存放视图的定义，并不会存放视图对应的数据，我们通过视图看到的数据还是在基本表中。

用户使用SELECT语句对数据表进行投影、选择与连接运算后得到的局部数据表

#### 6.1.2 **视图的作用**
1. 简化用户的操作
2. 对机密数据提供安全保护
3. 逻辑上的独立，屏蔽了真实表的结构带来的影响
4. 视图使用户能以多种角度看待同一数据

#### 6.1.3 **视图的特点**
1. 视图是虚表，视同一个或几个基本表（或视图）导出的表
2. DBMS只存放视图的定义，视图本身并不存放数据
3. 基本表中的数据变化，从事图中查询出的数据也随之发出改变
4. 用于定义视图的基本表和视图不能跨数据库

### 6.1.2. 视图的创建
```sql
CREATE VIEW 视图名[(列名)...]
AS
SELECT 子查询语句
[With check option]
```
```sql
CREATE VIEW V_SE_201
AS
SELECT *
FROM Stu
WHERE Mno='SE'

```
> 注意:

1. 子查询通常不允许包含order by 子句和  distinct 短语

### 6.1.3. 视图的修改（类似第四章的操作）
更新视图是指通过视图来插入(insert)、删除(delete)和修改 