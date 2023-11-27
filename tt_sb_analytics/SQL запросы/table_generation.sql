/* Создадим таблицы:
Таблица транзакций (t): */

create table t (
	transaction_id INT PRIMARY KEY,
    merchant_id INT,
    client_id INT,
    transaction_dttm TIMESTAMP,
    transaction_amt DECIMAL(10,2)
);

/* Таблица Торговых точек (m): */

create table m (
    merchant_id INT,
    latitude DECIMAL(8,6),
    longtitude DECIMAL(8,6),
    mcc_cd INT
);

/* Таблица Профиля клиента (c): */

create table c (
    client_id INT,
    gender CHAR(1),
    age INT
);