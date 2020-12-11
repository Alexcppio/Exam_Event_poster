USE Event_poster
GO;

--Отобразите все актуальные события на конкретную дату. Дата указывается в качестве параметра

CREATE PROCEDURE events_on_date
@event_date date
AS
BEGIN
SELECT e.Name AS [Event]
FROM [Events] e, [Dates_start] d_s,
[Events_Dates_start] e_d_s
WHERE e.Id = e_d_s.Event_id
AND d_s.Id = e_d_s.Date_start_id
AND d_s.Date_start = @event_date
GROUP BY d_s.Date_start, e.Name
END
GO
EXEC events_on_date '10-12-2020';

--Отобразите все актуальные события из конкретной категории. Категория указывается в качестве параметра

CREATE PROCEDURE events_on_category
@event_category nvarchar(50)
AS
BEGIN
SELECT e.Name AS [Event]
FROM [Events] e, [Categories] c,
[Events_Categories] e_c
WHERE e.Id = e_c.Event_id
AND c.Id = e_c.Category_id
AND c.Name = @event_category
GROUP BY c.Name, e.Name
END
GO
EXEC events_on_category 'концерт';

--Отобразите все актуальные события со стопроцентной продажей билетов

CREATE VIEW [events_on_all_tickets_sold] ([Event])
AS
SELECT e.Name
FROM [Events] e, [Events_Tickets_sold] e_t_s,
[Events_Tickets_max] e_t_m, [Tickets_sold] t_s,
[Tickets_max] t_m
WHERE e_t_s.Event_id = e.Id
AND e_t_s.Tickets_sold_id = t_s.Id
AND e_t_m.Event_id = e.Id
AND e_t_m.Tickets_max_id = t_m.Id
AND t_s.Quantity = t_m.Quantity;

--Отобразите топ-3 самых популярных актуальных событий (по количеству приобретенных билетов)

CREATE VIEW [events_top3_by_tickets_sold] ([Event])
AS
SELECT TOP 3 e.Name
FROM [Events] e, [Events_Tickets_sold] e_t_s,
[Tickets_sold] t_s
WHERE e_t_s.Event_id = e.Id
AND e_t_s.Tickets_sold_id = t_s.Id
GROUP BY t_s.Quantity, e.Name
ORDER BY COUNT(t_s.Quantity) DESC;

--Отобразите самое популярное событие в конкретном городе. Город указывается в качестве параметра

CREATE PROCEDURE [events_popular_on_city]
@event_city nvarchar(50)
AS
BEGIN
SELECT TOP 1 e.Name AS [Event]
FROM [Events] e, [Events_Cities] e_c,
[Cities] c, [Events_Tickets_sold] e_t_s,
[Tickets_sold] t_s
WHERE e_c.Event_id = e.Id
AND e_c.City_id = c.Id
AND e_t_s.Event_id = e.Id
AND e_t_s.Tickets_sold_id = t_s.Id
GROUP BY c.Name, e.Name, t_s.Quantity
ORDER BY COUNT(t_s.Quantity) DESC;
END
GO
EXEC events_popular_on_city 'Москва';

--Покажите информацию о самом активном клиенте (по количеству купленных билетов)

CREATE VIEW [most_active_client] ([Fullname])
AS
SELECT TOP 1 n.Name + ' ' + s.Surname + ' ' + p.Patronymic
FROM [Names] n, [Surnames] s, [Patronymics] p, 
[Clients] c, [Clients_Names] c_n, [Clients_Surnames] c_s,
[Clients_Patronymics] c_p, [Events] e
WHERE c_n.Client_id = c.Id
AND c_n.Name_id = n.Id
AND c_s.Client_id = c.Id
AND c_s.Surname_id = s.Id
AND c_p.Client_id = c.Id
AND c_p.Patronymic_id = p.Id
GROUP BY c.Id, e.Id, n.Name, s.Surname, p.Patronymic
ORDER BY COUNT(e.Id) DESC;

--Покажите название городов, в которых сегодня пройдут события

CREATE VIEW [cities_with_today_events] ([City])
AS
SELECT c.Name
FROM [Cities] c, [Events] e, [Events_Cities] e_c,
[Events_Dates_start] e_d_s, [Dates_start] d_s,
[Events_Dates_end] e_d_e, [Dates_end] d_e
WHERE e_c.City_id = c.Id
AND e_c.Event_id = e.Id
AND e_d_s.Date_start_id = d_s.Id
AND e_d_s.Event_id = e.Id
AND DAY(d_s.Date_start) >= DATEPART(DAY, CURRENT_TIMESTAMP)
AND DAY(d_e.Date_end) <= DATEPART(DAY, CURRENT_TIMESTAMP);

--Покажите все события, которые пройдут сегодня в указанное время. Время передаётся в качестве параметра

CREATE PROCEDURE events_on_time
@event_time time
AS
BEGIN
SELECT e.Name AS [Event]
FROM [Events] e, [Events_Times_start] e_t_s,
[Times_start] t_s, [Events_Times_end] e_t_e,
[Times_end] t_e 
WHERE e_t_s.Event_id = e.Id
AND e_t_s.Time_start_id = t_s.Id
AND e_t_e.Event_id = e.Id
AND e_t_e.Time_end_id = t_e.Id
AND t_s.Time_start = @event_time
AND t_e.Time_end = @event_time;
END
GO
EXEC events_on_time '12-00-00';

--Отобразите топ-3 самых популярных категорий событий (по количеству всех приобретенных билетов). Архив событий учитывается

CREATE VIEW [categories_top3_by_tickets_sold] ([Category])
AS
SELECT TOP 3 c.Name
FROM [Categories] c, [Events_Categories] e_c, [Events_Tickets_sold] e_t_s, [Events] e,
[Tickets_sold] t_s
WHERE e_c.Event_id = e.Id
AND e_c.Category_id = c.Id
AND e_t_s.Event_id = e.Id
AND e_t_s.Tickets_sold_id = t_s.Id
GROUP BY c.Name, t_s.Quantity
ORDER BY COUNT(t_s.Quantity) DESC;

--Покажите информацию о самой непопулярной категории (по количеству событий). Архив событий учитывается.

CREATE VIEW [categories_unpopular_by_events_quantity] ([Category])
AS
SELECT TOP 1 c.Name
FROM [Categories] c, [Events_Categories] e_c, [Events] e
WHERE e_c.Event_id = e.Id
AND e_c.Category_id = c.Id
GROUP BY c.Name
ORDER BY COUNT(e.Id);

--Отобразите топ-3 набирающих популярность событий (по количеству проданных билетов за 5 дней)

CREATE VIEW [events_top3_in_five_days] ([Event])
AS
SELECT TOP 3 e.Name
FROM [Events] e, [Events_Clients] e_c, [Clients] c,
[Events_Tickets_sold] e_t_s, [Tickets_sold] t_s
WHERE e_c.Event_id = e.Id
AND e_c.Client_id = c.Id
AND e_t_s.Event_id = e.Id
AND e_t_s.Tickets_sold_id = t_s.Id
AND DAY(c.Buy_Date) <= DATEPART(DAY, CURRENT_TIMESTAMP) - 5
GROUP BY e.Name
ORDER BY COUNT(t_s.Quantity) DESC;

--При вставке нового клиента нужно проверять, нет ли его уже в базе данных. Если такой клиент есть, генерировать ошибку с описанием возникшей проблемы

CREATE TRIGGER [client_unique_check]
ON [Clients]
AFTER INSERT
AS
BEGIN
DECLARE @client_name nvarchar(max)
SELECT @client_name = i.Name + ' ' + i.Patronymic + ' ' + i.Surname 
FROM [INSERTED] i
IF EXISTS (SELECT n.Name + ' ' + p.Patronymic + ' ' + s.Surname
			FROM [Names] n, [Patronymics] p, [Surnames] s
			WHERE n.Name + ' ' + p.Patronymic + ' ' + s.Surname = @client_name)
	raiserror('Такой клиент уже есть',0,1)
	rollback transaction
END

--При вставке нового события нужно проверять, нет ли его уже в базе данных. Если такое событие есть, генерировать ошибку с описанием возникшей проблемы

CREATE TRIGGER [event_unique_check]
ON [Events]
AFTER INSERT
AS
BEGIN
DECLARE @event_name nvarchar(50)
SELECT @event_name = i.Name 
FROM [INSERTED] i
IF EXISTS (SELECT e.Name
			FROM [Events] e
			WHERE e.Name = @event_name)
	raiserror('Такое событие уже есть',0,1)
	rollback transaction
END

--При удалении прошедших событий необходимо их переносить в архив событий

CREATE TRIGGER [Archive_add]
ON [Events]
AFTER DELETE
AS
BEGIN
DECLARE @deleted_id int
SELECT @deleted_id = DELETED.Id
FROM DELETED
INSERT INTO [Archive] ([Id], [Event_Name], [Event_Date_start], [Event_Date_end], [Event_Country_Name],
[Event_City_Name], [Event_Place_Name], [Event_Time_end], [Event_Time_start], [Event_Description],
[Event_Age_restriction], [Event_Image_File_name], [Event_Image_Title], [Event_Image_Source], [Event_Tickets_sold_Quantity],
[Event_Tickets_max_Quantity], [Event_Category_Name])
SELECT e.Id, e.Name, d_s.Date_start, d_e.Date_end, co.Name, ci.Name, p.Name, t_e.Time_end, t_s.Time_start,
d.Description, a_r.Age_restriction, i.File_name, i.Title, i.Source, t_so.Quantity, t_ma.Quantity, ca.Name
FROM [Events] e, [Dates_start] d_s, [Dates_end] d_e, [Countries] co, [Cities] ci, [Places] p, [Times_end] t_e,
[Times_start] t_s, [Descriptions] d, [Age_restrictions] a_r, [Images] i, [Tickets_sold] t_so, [Tickets_max] t_ma,
[Categories] ca, [Events_Age_restrictions] e_a_r, [Events_Archive] e_a, [Events_Categories] e_ca, [Events_Cities] e_ci,
[Events_Countries] e_co, [Events_Dates_end] e_d_e, [Events_Dates_start] e_d_s, [Events_Descriptions] e_de, [Events_Images] e_im,
[Events_Places] e_pl, [Events_Tickets_cost] e_t_co, [Events_Tickets_max] e_t_ma, [Events_Tickets_sold] e_t_so,
[Events_Times_end] e_t_en, [Events_Times_start] e_t_st
WHERE @deleted_id = e.Id
AND e_a_r.Event_id = e.Id
AND e_a_r.Age_restriction_id = a_r.Id
AND e_ca.Event_id = e.Id
AND e_ca.Category_id = ca.Id
AND e_ci.Event_id = e.Id
AND e_ci.City_id = ci.Id
AND e_co.Event_id = e.Id
AND e_co.Country_id = co.Id
AND e_d_e.Event_id = e.Id
AND e_d_e.Date_end_id = d_e.Id
AND e_d_s.Event_id = e.Id
AND e_d_s.Date_start_id = d_s.Id
AND e_de.Event_id = e.Id
AND e_de.Description_id = d.Id
AND e_im.Event_id = e.Id
AND e_im.Image_id = i.Id
AND e_pl.Event_id = e.Id
AND e_pl.Place_id = p.Id
AND e_t_ma.Event_id = e.Id
AND e_t_ma.Tickets_max_id = t_ma.Id
AND e_t_so.Event_id = e.Id
AND e_t_so.Tickets_sold_id = t_so.Id
AND e_t_en.Event_id = e.Id
AND e_t_en.Time_end_id = t_e.Id
AND e_t_st.Event_id = e.Id
AND e_t_st.Time_start_id = t_s.Id
END;

--При попытке покупки билета проверять не достигнуто ли уже максимальное количество билетов. 
--Если максимальное количество достигнуто, генерировать ошибку с информацией о возникшей проблеме

CREATE TRIGGER [tickets_availability_check]
ON [Tickets_sold]
AFTER INSERT
AS
BEGIN
DECLARE @tickets_quantity int
SELECT @tickets_quantity = i.Quantity 
FROM [INSERTED] i
IF EXISTS (SELECT t_m.Quantity
			FROM [Tickets_max] t_m
			WHERE t_m.Quantity = @tickets_quantity)
	raiserror('Превышен лимит по билетам',0,1)
	rollback transaction
END

--При попытке покупки билета проверять возрастные ограничения. 
--Если возрастное ограничение нарушено, генерировать ошибку с информацией о возникшей проблеме

CREATE TRIGGER [tickets_age_check]
ON [Tickets_sold]
AFTER INSERT
AS
BEGIN
DECLARE @tickets_quantity int
SELECT @tickets_quantity = i.Quantity 
FROM [INSERTED] i
IF EXISTS (SELECT b_d.Birth_date
			FROM [Birth_dates] b_d, [Age_restrictions] a_r, [Events] e, [Events_Age_restrictions] e_a_r,
			[Clients] c, [Clients_Birth_dates] c_b_d, [Events_Clients] e_c
			WHERE DATEPART(YEAR, CURRENT_TIMESTAMP) - YEAR(b_d.Birth_date) < a_r.Age_restriction
			AND e_a_r.Event_id = e.Id
			AND e_a_r.Age_restriction_id = a_r.Id
			AND c_b_d.Client_id = c.Id
			AND c_b_d.Birth_date_id = b_d.Id
			AND e_c.Event_id = e.Id
			AND e_c.Client_id = c.Id)
	raiserror('Возрастное ограничение',0,1)
	rollback transaction
END

--Настроить создание резервных копий с периодичностью раз в день.

BACKUP DATABASE [Event_poster] 
TO  DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\Backup\Event_poster.bak' 
WITH  RETAINDAYS = 1, NOFORMAT, NOINIT,  
NAME = N'Event_poster-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO