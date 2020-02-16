USE ALARMLINKDB
GO

DELETE FROM [ALARMLINKDB].[dbo].[SubscriberAddress]
GO
DELETE FROM [ALARMLINKDB].[dbo].[Subscriber]
GO
DELETE FROM [ALARMLINKDB].[dbo].[SubscriberGroup]
GO
DELETE FROM [ALARMLINKDB].[dbo].[SubscriberGroupsMember]
GO

-- Create subscribers
INSERT INTO [ALARMLINKDB].[dbo].[Subscriber] (name, language) VALUES ('Subscriber 1', 'de-DE'); 
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberAddress] (orderidx, address, servicetype, subscriberId) VALUES (4, '12121212' , 'sms', (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] where name = 'Subscriber 1'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[Subscriber] (name, language) VALUES ('Subscriber 2', 'en-GB'); 
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberAddress] (orderidx, address, servicetype, subscriberId) VALUES (2, '+45 88888888' , 'sms', (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] where name = 'Subscriber 2'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[Subscriber] (name, language) VALUES ('Subscriber 3', 'en-US'); 
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberAddress] (orderidx, address, servicetype, subscriberId) VALUES (0, '99 99 99 99' , 'sms', (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] where name = 'Subscriber 3'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[Subscriber] (name, language) VALUES ('Subscriber 4', 'ru-RU'); 
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberAddress] (orderidx, address, servicetype, subscriberId) VALUES (3, '11111111' , 'sms', (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] where name = 'Subscriber 4'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[Subscriber] (name, language) VALUES ('Subscriber 5', 'en-GB'); 
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberAddress] (orderidx, address, servicetype, subscriberId) VALUES (2, '12345678' , 'sms', (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] where name = 'Subscriber 5'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[Subscriber] (name, language) VALUES ('Subscriber 6', 'en-GB'); 
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberAddress] (orderidx, address, servicetype, subscriberId) VALUES (1, '1234 5678' , 'sms', (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] where name = 'Subscriber 6'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[Subscriber] (name, language) VALUES ('Subscriber 7', 'en-GB'); 
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberAddress] (orderidx, address, servicetype, subscriberId) VALUES (1, '88888888' , 'sms', (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] where name = 'Subscriber 7'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[Subscriber] (name, language) VALUES ('Subscriber 8', 'en-GB'); 
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberAddress] (orderidx, address, servicetype, subscriberId) VALUES (2, '88888888' , 'sms', (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] where name = 'Subscriber 8'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[Subscriber] (name, language) VALUES ('Subscriber 9', 'en-GB'); 
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberAddress] (orderidx, address, servicetype, subscriberId) VALUES (2, '87654321' , 'sms', (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] where name = 'Subscriber 9'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[Subscriber] (name, language) VALUES ('Subscriber 10', 'en-GB'); 
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberAddress] (orderidx, address, servicetype, subscriberId) VALUES (2, '22222222' , 'sms', (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] where name = 'Subscriber 10'));
GO

-- Create subscriber groups
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroup] (name, description) VALUES ('Subscription group 1', 'Group with 7 members');
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroup] (name, description) VALUES ('Subscription group 2', 'Empty group');
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroup] (name, description) VALUES ('Subscription group 3', 'Group with 4 members');
GO

-- Put subscribers into groups
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroupsMember] (groupid, subscriberId) VALUES(
  (SELECT id FROM [ALARMLINKDB].[dbo].[SubscriberGroup] WHERE name = 'Subscription group 1'), 
  (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] WHERE name = 'Subscriber 1'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroupsMember] (groupid, subscriberId) VALUES(
  (SELECT id FROM [ALARMLINKDB].[dbo].[SubscriberGroup] WHERE name = 'Subscription group 1'), 
  (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] WHERE name = 'Subscriber 2'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroupsMember] (groupid, subscriberId) VALUES(
  (SELECT id FROM [ALARMLINKDB].[dbo].[SubscriberGroup] WHERE name = 'Subscription group 1'), 
  (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] WHERE name = 'Subscriber 3'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroupsMember] (groupid, subscriberId) VALUES(
  (SELECT id FROM [ALARMLINKDB].[dbo].[SubscriberGroup] WHERE name = 'Subscription group 1'), 
  (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] WHERE name = 'Subscriber 4'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroupsMember] (groupid, subscriberId) VALUES(
  (SELECT id FROM [ALARMLINKDB].[dbo].[SubscriberGroup] WHERE name = 'Subscription group 1'), 
  (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] WHERE name = 'Subscriber 5'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroupsMember] (groupid, subscriberId) VALUES(
  (SELECT id FROM [ALARMLINKDB].[dbo].[SubscriberGroup] WHERE name = 'Subscription group 1'), 
  (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] WHERE name = 'Subscriber 6'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroupsMember] (groupid, subscriberId) VALUES(
  (SELECT id FROM [ALARMLINKDB].[dbo].[SubscriberGroup] WHERE name = 'Subscription group 1'), 
  (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] WHERE name = 'Subscriber 7'));
GO

INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroupsMember] (groupid, subscriberId) VALUES(
  (SELECT id FROM [ALARMLINKDB].[dbo].[SubscriberGroup] WHERE name = 'Subscription group 3'), 
  (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] WHERE name = 'Subscriber 2'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroupsMember] (groupid, subscriberId) VALUES(
  (SELECT id FROM [ALARMLINKDB].[dbo].[SubscriberGroup] WHERE name = 'Subscription group 3'), 
  (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] WHERE name = 'Subscriber 3'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroupsMember] (groupid, subscriberId) VALUES(
  (SELECT id FROM [ALARMLINKDB].[dbo].[SubscriberGroup] WHERE name = 'Subscription group 3'), 
  (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] WHERE name = 'Subscriber 8'));
GO
INSERT INTO [ALARMLINKDB].[dbo].[SubscriberGroupsMember] (groupid, subscriberId) VALUES(
  (SELECT id FROM [ALARMLINKDB].[dbo].[SubscriberGroup] WHERE name = 'Subscription group 3'), 
  (SELECT id FROM [ALARMLINKDB].[dbo].[Subscriber] WHERE name = 'Subscriber 9'));
GO
