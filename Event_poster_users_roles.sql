CREATE LOGIN Mark
WITH PASSWORD = '123';
CREATE LOGIN David
WITH PASSWORD = '123';
CREATE LOGIN Olga
WITH PASSWORD = '123';
CREATE LOGIN Konstantin
WITH PASSWORD = '123';

USE Event_poster;

CREATE USER Mark
FOR LOGIN Mark;
CREATE USER David
FOR LOGIN David;
CREATE USER Olga
FOR LOGIN Olga;
CREATE USER Konstantin
FOR LOGIN Konstantin;

--ѕользователь с полным доступом ко всей информации

CREATE ROLE [FullAccess];
GRANT ALL TO [FullAccess];
EXEC sp_addrolemember 'FullAccess', 'Mark';

--ѕользователь с правом только на чтение данных

CREATE ROLE [ReadOnly];
GRANT ALL TO [ReadOnly];
EXEC sp_addrolemember 'ReadOnly', 'David';

--ѕользователь с правом резервного копировани€ и восстановлени€ данных

EXEC sp_addrolemember db_backupoperator, 'Olga';

--ѕользователь с правом создани€ и удалени€ пользователей.

EXEC sp_addrolemember db_securityadmin, Konstantin;

/*
DROP USER Mark
DROP LOGIN Mark
DROP USER David
DROP LOGIN David
DROP USER Olga
DROP LOGIN Olga
DROP USER Konstantin
DROP LOGIN Konstantin
*/