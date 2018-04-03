PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

CREATE TABLE "expense_reports" (
	`k`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`date_begin`	INTEGER NOT NULL,
	`date_end`	INTEGER,
	`location`	TEXT NOT NULL,
	`operation`	TEXT NOT NULL,	
	`comment`	TEXT
);

INSERT INTO "expense_reports" VALUES(1,1521306115,NULL, 'Faverges', 'Mission Stäubli 2017-W4',NULL);
INSERT INTO "expense_reports" VALUES(2,1521306115,NULL, 'Pézenas', 'Mission Stäubli 2017-W4',NULL);

CREATE TABLE `expenses` (
	`k`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`type`	TEXT NOT NULL,
	`date`	INTEGER NOT NULL,
	`ttc`	NUMERIC NOT NULL,
	`tva`	NUMERIC DEFAULT 0,
	`comment`	TEXT,
	`expense_record_k`	INTEGER,
    FOREIGN KEY(`expense_record_k`) REFERENCES `expense_reports`(`k`)
);

CREATE TABLE `ikms` (
	`k`	INTEGER PRIMARY KEY AUTOINCREMENT,
	`date`	INTEGER NOT NULL,
	`distance`	TEXT,
	`expense_record_k`	INTEGER,
    FOREIGN KEY(`expense_record_k`) REFERENCES `expense_reports`(`k`)
);

INSERT INTO "expenses" VALUES(1,'MEAL',1521306115,6,1,NULL,1);
INSERT INTO "expenses" VALUES(2,'MEAL',1521306115,12,2,NULL,1);
INSERT INTO "expenses" VALUES(3,'MEAL',1521306115,24,4,NULL,2);

DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('expense_reports',2);
INSERT INTO "sqlite_sequence" VALUES('expenses',3);
COMMIT;
