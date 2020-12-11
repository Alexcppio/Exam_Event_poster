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

--������������ � ������ �������� �� ���� ����������

CREATE ROLE [FullAccess];
GRANT ALL TO [FullAccess];
EXEC sp_addrolemember 'FullAccess', 'Mark';

--������������ � ������ ������ �� ������ ������

CREATE ROLE [ReadOnly];
GRANT ALL TO [ReadOnly];
EXEC sp_addrolemember 'ReadOnly', 'David';

--������������ � ������ ���������� ����������� � �������������� ������

EXEC sp_addrolemember db_backupoperator, 'Olga';

--������������ � ������ �������� � �������� �������������.

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