create database bank_project_report;

select count(*) from finance_sql_data;
select * from finance_sql_data;

select * from finanace2;

#KPI's

/*
>year wise loan amount
>Grade-subgrade wise revolution balance
> Total payment for verified status vs Non-verified status
>State wise last credit pulld wise loan status
>Home ownership vs last Payment Date Stats
*/

#KPI-1
select year(issue_D) as year_of_issue_d ,
 sum(loan_amnt) as Total_loan_amnt from finance_sql_data
 group by year_of_issue_d
 order by year_of_issue_d;
 
 #KPI-2
 select grade,sub_grade, sum(revol_bal) as total_revol_bal from finance_sql_data
 inner join finanace2
 on(finance_sql_data.id=finanace2.id)
 group by grade,sub_grade
 order by grade,sub_grade;
 
 #Kpi3

select verification_status, 
concat("$", format(round(sum(total_pymnt),2),2),"M") as Total_payment

from finanace2 inner join finance_sql_data 
on (finanace2.id=finance_sql_data.id)
group by verification_status;

#Kpi 4
select *from finance_sql_data;
select * from finanace2;

select addr_state,last_credit_pull_D,loan_status from finance_sql_data inner join finanace2 on (finance_sql_data.id=finanace2.id)
group by addr_state,last_credit_pull_d,loan_status
order by last_credit_pull_d;

#kpi5
select home_ownership,year(last_pymnt_d),
concat("$", format(round(sum(total_pymnt)/10000,2),2),"K") as Total_amount
from finance_sql_data inner join finanace2 on (finance_sql_data.id=finanace2.id)
Group by home_ownership,last_pymnt_d
order by home_ownership DESC ,last_pymnt_d DESC;