/* заполнение таблиц тестовыми данные:
 заполняем таблицу транзакций */

insert into t (transaction_id, merchant_id, client_id, transaction_dttm, transaction_amt)
select 
	g,
    cast((random()*1000) as integer), 
    cast((random()*1000) as integer), 
    timestamp '2020-01-01 00:00:00' + random() * (timestamp '2023-12-31 23:59:59' - timestamp '2020-01-01 00:00:00'),
    cast((random()*10000) as integer)
from generate_series(1, 1000) as g;

/* заполняем таблицу торговых точек, за основу берём merchant_id 
 из таблицы транзакций и для них генерируем даннные */

insert into m (merchant_id, latitude, longtitude, mcc_cd)
select 
    t.merchant_id,
    cast((46.0 + random()*(55.0-46.0)) as numeric(8,6)),
    cast((37.0 + random()*(70.0-10.0)) as numeric(8,6)),
    cast((random()*(10000-200)+ 100) as integer)
from t;


/* заполняем таблицу профилей клиентов, за основу берём client_id 
 из таблицы транзакций и для них генерируем даннные */

insert into c (client_id, gender, age)
select
	t.client_id,
    case 
    	when random() > 0.5 then 'M' 
    	else 'F' 
	end,
    CAST((18 + random()*(80-18)) as integer)
from t;