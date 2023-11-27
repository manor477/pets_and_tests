/* Запрос для сохранения материального представления client_summary_matview */
create materialized view client_summary_matview AS

select
    c.gender,
    case 
    	when c.age<=18 then 'Under 18'
        when c.age between 19 and 30 then '19-30'
        else 'Over 30'
    end as age_group,
    m.mcc_cd as industry,
    extract(year from t.transaction_dttm) as year,
    extract(month from t.transaction_dttm) as month,
    SUM(t.transaction_amt) as purchase_amt,
    ROUND(AVG(t.transaction_amt), 2) as avg_purchase_amt,
    COUNT(t.transaction_amt) as count_purchases
from t
join m on t.merchant_id = m.merchant_id
join c on t.client_id = c.client_id
group by c.gender, age_group, industry, year, month;