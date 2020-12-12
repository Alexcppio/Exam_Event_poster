USE [Event_poster];
GO

CREATE INDEX [IX_Categories_Name] ON [Categories] ([Name]);

CREATE INDEX [IX_Tickets_max] ON [Tickets_max] ([Quantity]);

CREATE INDEX [IX_Tickets_sold] ON [Tickets_sold] ([Quantity]);

CREATE INDEX [IX_Surnames_Surname] ON [Clients] ([Surname]);

CREATE INDEX [IX_Birth_dates_Birth_date] ON [Birth_dates] ([Birth_date]);

CREATE INDEX [IX_Emails_Email] ON [Emails] ([Email]);

CREATE INDEX [IX_Dates_start_Date_start] ON [Dates_start] ([Date_start]);

CREATE INDEX [IX_Times_start_Time_start] ON [Times_start] ([Time_start]);

CREATE INDEX [IX_Age_restrictions_Age_restriction] ON [Age_restrictions] ([Age_restriction]);

CREATE INDEX [IX_Places_Name] ON [Places] ([Name]);

CREATE INDEX [IX_Cities_Name] ON [Cities] ([Name]);

CREATE INDEX [IX_Tickets_cost_Cost] ON [Tickets_cost] ([Cost]);