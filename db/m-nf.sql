PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE `contracts` (
	`k`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`desc`	TEXT
);
INSERT INTO "contracts" VALUES(1,'contract 1');
INSERT INTO "contracts" VALUES(2,'contract 2');
INSERT INTO "contracts" VALUES(3,'contract 3');
INSERT INTO "contracts" VALUES(4,'contract 4');
CREATE TABLE `missions` (
	`k`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`contract_k`	INTEGER,
	`desc`	TEXT,
	`dt_begin`	INTEGER NOT NULL,
	`dt_end`	INTEGER NOT NULL,
	`location`	TEXT NOT NULL,
    FOREIGN KEY(`contract_k`) REFERENCES `contracts`(`k`)
);
INSERT INTO "missions" VALUES(1,1,'mission 1',1518882927,1526568927,'Annecy');
INSERT INTO "missions" VALUES(2,1,'mission 2',1521302127,1526568927,'Pézenas');
CREATE TABLE "expense_reports" (
	`k`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`date`	INTEGER NOT NULL,
	`mission_k`	INTEGER,
	`comment`	TEXT
);
INSERT INTO "expense_reports" VALUES(1,1521306115,1,NULL);
INSERT INTO "expense_reports" VALUES(2,1521306115,2,NULL);
CREATE TABLE `expenses` (
	`k`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`type`	TEXT NOT NULL,
	`date`	INTEGER NOT NULL,
	`montant_ttc`	NUMERIC NOT NULL,
	`tva`	NUMERIC DEFAULT 0,
	`comment`	TEXT,
	`expense_record_k`	INTEGER,
FOREIGN KEY(`expense_record_k`) REFERENCES `missions`(`k`)
);
INSERT INTO "expenses" VALUES(1,'MEAL',1521306115,6,1,NULL,1);
INSERT INTO "expenses" VALUES(2,'MEAL',1521306115,12,2,NULL,1);
INSERT INTO "expenses" VALUES(3,'MEAL',1521306115,24,4,NULL,2);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('contracts',4);
INSERT INTO "sqlite_sequence" VALUES('missions',2);
INSERT INTO "sqlite_sequence" VALUES('expense_reports',2);
INSERT INTO "sqlite_sequence" VALUES('expenses',3);
COMMIT;
