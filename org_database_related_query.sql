#select upper(first_name) worker_name from org.worker
#select distinct department from org.worker
#select upper( substring(first_name,1,3) )from org.worker
#select instr(first_name,Binary'a') from org.worker where FIRST_NAME = 'Amitabh'
#select rtrim(first_name) from org.worker
#select ltrim(department) from org.worker
#select distinct DEPARTMENT,length(department) from org.worker
#select concat(first_name,' ',last_name) full_name from org.worker
#select * from org.worker order by FIRST_NAME,DEPARTMENT desc
#select * from org.worker where FIRST_NAME in('Satish','Vipul')
#select * from org.worker where FIRST_NAME not in('Satish','Vipul')
#select * from org.worker where DEPARTMENT like "admin%"
#select * from org.worker where FIRST_NAME like "%a%"
#select * from org.worker where FIRST_NAME like "%a"
#select * from org.worker where FIRST_NAME like '_____h'
#select* from org.worker where SALARY between 100000 and 500000
#select* from org.worker where year(joining_date)=2014 and month(joining_date) =2
#select count(*)from org.worker where DEPARTMENT ='Admin'
#select concat(first_name,' ',last_name) full_name, SALARY from org.worker where	salary between 50000 and 100000
#select department,count(worker_id) no_of_worker from org.worker group by DEPARTMENT order by no_of_worker desc
#select distinct w.first_name,t.worker_title from org.worker w,org.title t where w.WORKER_ID =t.WORKER_REF_ID and t.WORKER_TITLE in ('manager')
## to fetch duplicate records having match data in some fields of a table 
#select worker_title,affected_from, count(*) from org.title	group by WORKER_TITLE,AFFECTED_FROM having count(*)> 1
## query to show only odd rows from the table
#select * from org.worker where mod(worker_id,2) !=0
## query to clone a new table from another table 
#create table workerclone like org.workerworker
## fetch intersecting records of two tables
#select * from org.worker w where exists (select * from org.workerclone wc where w.WORKER_ID=wc.WORKER_ID)
#select * from org.worker order by salary desc limit 5
## to get the nth highest salary
#select* from org.worker order by salary desc limit 2,1
## fetch list of employee with the same salary
#select distinct w.worker_id,w.first_name,w.salary from org.worker w,org.worker w1 where w.SALARY =w1.SALARY and w.WORKER_ID != w1.WORKER_ID
#select * from org.worker order by salary desc limit 2,1
### fetch query for the department which has less than 5 people in it 
#select department ,count(worker_id) worker_count from org.worker group by DEPARTMENT having worker_count< 5
## show department along with the no. of peoplw
#select department ,count(DEPARTMENT) worker_count from org.worker group by DEPARTMENT
## last record from the table 
#select * from org.worker where WORKER_ID = (select max(WORKER_ID) from org.worker)
## to fetch last 3 row 
#SELECT * FROM (SELECT * FROM org.worker ORDER BY WORKER_ID DESC LIMIT 3) sub ORDER BY WORKER_ID ASC
###------select w.FIRST_NAME,w.LAST_NAME,w.SALARY,w.DEPARTMENT from (select max(salary)mt,Department from org.worker group by DEPARTMENT) wt inner join org.worker w on wt.department=w.DEPARTMENT and wt.mt=w.SALARY------
### three max salaries from table 
#SELECT distinct Salary from org.worker a WHERE 3 >= (SELECT count(distinct Salary) from org.worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
### three min salary
#SELECT distinct Salary from org.worker a WHERE 3 >= (SELECT count(distinct Salary) from org.worker b WHERE a.Salary >= b.Salary) order by a.Salary desc
### fetch department along with the total salary paid to them
#select department, sum(Salary) from org.worker group by DEPARTMENT
### name of the worker who earns the highest salary
SELECT FIRST_NAME, SALARY from org.worker WHERE SALARY=(SELECT max(SALARY) from org.worker)