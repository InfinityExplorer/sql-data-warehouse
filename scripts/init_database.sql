/*
=============================================================
Создание базы данных и схем
=============================================================
Назначение скрипта:
Этот скрипт создает новую базу данных с именем 'DataWarehouse', предварительно проверяя её существование.
Если база данных уже существует, она будет удалена и создана заново. Дополнительно скрипт создает три схемы
внутри базы данных: 'bronze', 'silver' и 'gold'.
	
ПРЕДУПРЕЖДЕНИЕ:
Выполнение этого скрипта приведет к удалению всей базы данных 'DataWarehouse', если она существует.
Все данные в базе будут безвозвратно удалены. Будьте осторожны и убедитесь,
что у вас есть резервные копии перед выполнением этого скрипта.
*/

USE master;
GO

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Создание схем
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
