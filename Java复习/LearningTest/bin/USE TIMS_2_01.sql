USE TIMS_2_01

SELECT sno,score
FROM SC
WHERE Cno='C03'
ORDER BY Score DESC

/*在使用 TOP 谓词时应该与 ORDER BY 一起使用 */

SELECT TOP 3*
FROM SC
ORDER BY Score DESC

SELECT Sname,'出生年份',2020-Age
--SELECT *
FROM Stu;

SELECT Sname AS 学会姓名,'出生年份'AS 出生日期,2020-Age 出生年份      
FROM Stu;

--消除重复
SELECT Sno
FROM SC;

SELECT DISTINCT Sno
FROM SC;

--IN关键字的使用
SELECT Sname,Mno,Age
FROM Stu
WHERE Mno='SE' OR Mno='NE' OR Mno='EC' ;

SELECT  *
FROM Stu
WHERE Mno IN('SE','NE','EC'); 

SELECT Sex 性别,COUNT(Sno) 人数
FROM Stu 
GROUP BY Sex;