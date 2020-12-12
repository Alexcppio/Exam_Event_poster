USE [Event_poster];
GO

--Age_restrictions

INSERT INTO [Age_restrictions] ([Age_restriction])
VALUES (3);

INSERT INTO [Age_restrictions] ([Age_restriction])
VALUES (6);

INSERT INTO [Age_restrictions] ([Age_restriction])
VALUES (12);

INSERT INTO [Age_restrictions] ([Age_restriction])
VALUES (14);

INSERT INTO [Age_restrictions] ([Age_restriction])
VALUES (18);

--Birth_dates

INSERT INTO [Birth_dates] ([Birth_date])
VALUES ('2009-09-14');

INSERT INTO [Birth_dates] ([Birth_date])
VALUES ('1965-12-06');

INSERT INTO [Birth_dates] ([Birth_date])
VALUES ('1975-10-31');

INSERT INTO [Birth_dates] ([Birth_date])
VALUES ('2001-02-12');

INSERT INTO [Birth_dates] ([Birth_date])
VALUES ('1991-09-10');

INSERT INTO [Birth_dates] ([Birth_date])
VALUES ('1990-09-10');

INSERT INTO [Birth_dates] ([Birth_date])
VALUES ('1992-04-20');

--Cities

INSERT INTO [Cities] ([Name])
VALUES ('Москва');

INSERT INTO [Categories] ([Name])
VALUES ('Санкт-Петербург');

INSERT INTO [Categories] ([Name])
VALUES ('Екатеринбург');

INSERT INTO [Categories] ([Name])
VALUES ('Ростов');

INSERT INTO [Categories] ([Name])
VALUES ('Омск');

INSERT INTO [Categories] ([Name])
VALUES ('Калининград');

INSERT INTO [Categories] ([Name])
VALUES ('Новосибирск');

INSERT INTO [Categories] ([Name])
VALUES ('Ярославль');

INSERT INTO [Categories] ([Name])
VALUES ('Челябинск');

INSERT INTO [Categories] ([Name])
VALUES ('Владивосток');

INSERT INTO [Categories] ([Name])
VALUES ('Уфа');

--Countries

INSERT INTO [Countries] ([Name])
VALUES ('Россия');

--Emails

INSERT INTO [Emails] ([Email])
VALUES ('delluiza@yandex.ru');

INSERT INTO [Emails] ([Email])
VALUES ('Konfetka13-94@mail.ru');

INSERT INTO [Emails] ([Email])
VALUES ('vladkazh@mail.ru');

INSERT INTO [Emails] ([Email])
VALUES ('uglova93@mail.ru');

INSERT INTO [Emails] ([Email])
VALUES ('icebery@qip.ru');

INSERT INTO [Emails] ([Email])
VALUES ('alpotehinj@gmail.com');

INSERT INTO [Emails] ([Email])
VALUES ('cezarikc@mail.ru');

INSERT INTO [Emails] ([Email])
VALUES ('kimef11@yandex.ru');

INSERT INTO [Emails] ([Email])
VALUES ('vovik97_nsk@mail.ru');

INSERT INTO [Emails] ([Email])
VALUES ('nvirtova300@mail.ru');

INSERT INTO [Emails] ([Email])
VALUES ('ofisov.arenda@list.ru');

INSERT INTO [Emails] ([Email])
VALUES ('bukhgalter-ru@mail.ru');

INSERT INTO [Emails] ([Email])
VALUES ('it-servis-comp@mail.ru');

INSERT INTO [Emails] ([Email])
VALUES ('labaratoriya.seo@mail.ru');

INSERT INTO [Emails] ([Email])
VALUES ('l.o.r.o.m.ax.@youtube.bxox.info');

INSERT INTO [Emails] ([Email])
VALUES ('remont-parket@bk.ru');

INSERT INTO [Emails] ([Email])
VALUES ('optimizatsiya.seo@mail.ru');

INSERT INTO [Emails] ([Email])
VALUES ('perevozki.kitay@mail.ru');

INSERT INTO [Emails] ([Email])
VALUES ('biznes.ofisy@mail.ru');

INSERT INTO [Emails] ([Email])
VALUES ('bukhgalter.help@mail.ru');

--Clients

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Александр', 'Александрович', 'Иванов');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Михаил', 'Игоревич', 'Смирнов');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Максим', 'Сергеевич', 'Кузнецов');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Артем', 'Геннадьевич', 'Попов');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Лев', 'Дмитриевич', 'Васильев');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Марк', 'Никитич', 'Петров');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Дмитрий', 'Ильич', 'Соколов');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Иван', 'Александрович', 'Михайлович');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Матвей', 'Игоревич', 'Новиков');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Данил', 'Сергеевич', 'Федоров');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Мария', 'Геннадьевна', 'Морозова');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Анна', 'Дмитриевна', 'Волкова');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Виктория', 'Никитична', 'Алексеева');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Алиса', 'Ильинична', 'Лебедева');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Полина', 'Матвеевна', 'Семенова');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Ева', 'Даниловна', 'Егорова');

INSERT INTO [Clients] ([Name], [Patronymic], [Surname])
VALUES ('Елизавета', 'Львовна', 'Павлова');

--Dates_start

INSERT INTO [Dates_start] ([Date_start])
VALUES ('2020-10-01');

INSERT INTO [Dates_start] ([Date_start])
VALUES ('2020-10-02');

INSERT INTO [Dates_start] ([Date_start])
VALUES ('2020-10-02');

INSERT INTO [Dates_start] ([Date_start])
VALUES ('2020-10-03');

INSERT INTO [Dates_start] ([Date_start])
VALUES ('2020-10-03');

INSERT INTO [Dates_start] ([Date_start])
VALUES ('2020-10-04');

INSERT INTO [Dates_start] ([Date_start])
VALUES ('2020-10-04');

INSERT INTO [Dates_start] ([Date_start])
VALUES ('2020-10-05');

--Dates_end

INSERT INTO [Dates_end] ([Date_end])
VALUES ('2020-10-01');

INSERT INTO [Dates_end] ([Date_end])
VALUES ('2020-10-02');

INSERT INTO [Dates_end] ([Date_end])
VALUES ('2020-11-02');

INSERT INTO [Dates_end] ([Date_end])
VALUES ('2020-10-03');

INSERT INTO [Dates_end] ([Date_end])
VALUES ('2020-11-03');

INSERT INTO [Dates_end] ([Date_end])
VALUES ('2020-10-04');

INSERT INTO [Dates_end] ([Date_end])
VALUES ('2020-11-04');

INSERT INTO [Dates_end] ([Date_end])
VALUES ('2020-10-05');

--Descriptions


--Events



--Places



--Categories

INSERT INTO [Categories] ([Name])
VALUES ('спектакль');

INSERT INTO [Categories] ([Name])
VALUES ('концерт');

INSERT INTO [Categories] ([Name])
VALUES ('выставка');

INSERT INTO [Categories] ([Name])
VALUES ('цирк');

INSERT INTO [Categories] ([Name])
VALUES ('спорт');

INSERT INTO [Categories] ([Name])
VALUES ('семинары и тренинги');

INSERT INTO [Categories] ([Name])
VALUES ('кино');

INSERT INTO [Categories] ([Name])
VALUES ('юмор');

INSERT INTO [Categories] ([Name])
VALUES ('вечеринки');

INSERT INTO [Categories] ([Name])
VALUES ('детям');

INSERT INTO [Categories] ([Name])
VALUES ('другое');
