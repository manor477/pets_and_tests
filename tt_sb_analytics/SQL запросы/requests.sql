-- •Сумма вообще всех покупок за 2020 год
select sum(purchase_amt)
from client_summary_matview
where year = 2020;

-- •Сумма всех покупок за апрель 2020 года
select sum(purchase_amt)
from client_summary_matview
where year = 2020 and month = 4;

-- •Сумма покупок всех мужчин за 2020 год
select sum(purchase_amt)
from client_summary_matview
where year = 2020 and gender = 'M';

-- •Сумма покупок всех мужчин в возрасте 19-30 за 2020 год
select sum(purchase_amt)
from client_summary_matview
where year = 2020 and gender = 'M' and age_group = '19-30';
