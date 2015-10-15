CREATE KEYSPACE IF NOT EXISTS sql_test WITH REPLICATION = { 'class': 'SimpleStrategy', 'replication_factor': 1 };

CREATE TABLE IF NOT EXISTS sql_test.test1 (a INT, b INT, c INT, d INT, e INT, f INT, g INT, h INT, PRIMARY KEY ((a, b, c), d , e, f));

USE sql_test;

CREATE INDEX test1_g ON test1(g);
INSERT INTO sql_test.test1 (a, b, c, d, e, f, g, h) VALUES (1, 1, 1, 1, 1, 1, 1, 1);
INSERT INTO sql_test.test1 (a, b, c, d, e, f, g, h) VALUES (1, 1, 1, 1, 2, 1, 1, 2);
INSERT INTO sql_test.test1 (a, b, c, d, e, f, g, h) VALUES (1, 1, 1, 2, 1, 1, 2, 1);
INSERT INTO sql_test.test1 (a, b, c, d, e, f, g, h) VALUES (1, 1, 1, 2, 2, 1, 2, 2);
INSERT INTO sql_test.test1 (a, b, c, d, e, f, g, h) VALUES (1, 2, 1, 1, 1, 2, 1, 1);
INSERT INTO sql_test.test1 (a, b, c, d, e, f, g, h) VALUES (1, 2, 1, 1, 2, 2, 1, 2);
INSERT INTO sql_test.test1 (a, b, c, d, e, f, g, h) VALUES (1, 2, 1, 2, 1, 2, 2, 1);
INSERT INTO sql_test.test1 (a, b, c, d, e, f, g, h) VALUES (1, 2, 1, 2, 2, 2, 2, 2);

CREATE TABLE IF NOT EXISTS sql_test.test2 (a INT, b INT, c INT, name TEXT, PRIMARY KEY (a, b));
INSERT INTO sql_test.test2 (a, b, c, name) VALUES (1, 1, 1, 'Tom');
INSERT INTO sql_test.test2 (a, b, c, name) VALUES (1, 2, 3, 'Larry');
INSERT INTO sql_test.test2 (a, b, c, name) VALUES (1, 3, 3, 'Henry');
INSERT INTO sql_test.test2 (a, b, c, name) VALUES (2, 1, 3, 'Jerry');
INSERT INTO sql_test.test2 (a, b, c, name) VALUES (2, 2, 3, 'Alex');
INSERT INTO sql_test.test2 (a, b, c, name) VALUES (2, 3, 3, 'John');
INSERT INTO sql_test.test2 (a, b, c, name) VALUES (3, 1, 3, 'Jack');
INSERT INTO sql_test.test2 (a, b, c, name) VALUES (3, 2, 3, 'Hank');
INSERT INTO sql_test.test2 (a, b, c, name) VALUES (3, 3, 3, 'Dug');

CREATE TABLE IF NOT EXISTS sql_test.test3 (a INT, b INT, c INT, PRIMARY KEY (a, b));
CREATE KEYSPACE IF NOT EXISTS sql_test2 WITH REPLICATION = { 'class': 'SimpleStrategy', 'replication_factor': 1 };
CREATE TABLE IF NOT EXISTS sql_test2.test3 (a INT, b INT, c INT, PRIMARY KEY (a, b));
CREATE TABLE IF NOT EXISTS sql_test2.test2 (a INT, b INT, c INT, PRIMARY KEY (a, b));

INSERT INTO sql_test2.test2 (a, b, c) VALUES (1, 1, 1);
INSERT INTO sql_test2.test2 (a, b, c) VALUES (1, 2, 3);
INSERT INTO sql_test2.test2 (a, b, c) VALUES (1, 3, 3);
INSERT INTO sql_test2.test2 (a, b, c) VALUES (2, 1, 3);
INSERT INTO sql_test2.test2 (a, b, c) VALUES (2, 2, 3);
INSERT INTO sql_test2.test2 (a, b, c) VALUES (2, 3, 3);
INSERT INTO sql_test2.test2 (a, b, c) VALUES (3, 1, 3);
INSERT INTO sql_test2.test2 (a, b, c) VALUES (3, 2, 3);
INSERT INTO sql_test2.test2 (a, b, c) VALUES (3, 3, 3);

CREATE TABLE IF NOT EXISTS sql_test.test_data_type (a ASCII, b INT, c FLOAT, d DOUBLE, e BIGINT, f BOOLEAN, g DECIMAL, h INET, i TEXT, j TIMESTAMP, k UUID, l VARINT, PRIMARY KEY ((a), b, c));
INSERT INTO sql_test.test_data_type (a, b, c, d, e, f, g, h, i, j, k, l) VALUES ('ascii', 10, 12.34, 12.3456789, 123344556, true, 12.36, '74.125.239.135', 'text', '2011-02-03 04:05+0000', 123e4567-e89b-12d3-a456-426655440000 ,123456);

CREATE TABLE IF NOT EXISTS sql_test.test_data_type1 (a ASCII, b INT, c FLOAT, d DOUBLE, e BIGINT, f BOOLEAN, g DECIMAL, h INET, i TEXT, j TIMESTAMP, k UUID, l VARINT, PRIMARY KEY ((a), b, c));

CREATE TABLE IF NOT EXISTS sql_test.test_collection (a INT, b SET<INT>, c MAP<INT, INT>, PRIMARY KEY (a));
INSERT INTO sql_test.test_collection (a, b, c) VALUES (1, {1,2,3}, {1:2, 2:3});

CREATE TYPE sql_test.address (street text, city text, zip int);
CREATE TABLE IF NOT EXISTS sql_test.udts(key INT PRIMARY KEY, name text, addr frozen<address>);
INSERT INTO sql_test.udts(key, name, addr) VALUES (1, 'name', {street: 'Some Street', city: 'Paris', zip: 11120});

