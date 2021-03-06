/****** Object:  Table [dbo].[AlarmEscalationPlan]    Script Date: 13-11-2015 09:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
USE ALARMLINKDB
GO
CREATE TABLE [dbo].[AlarmEscalationPlan](
	[alarmtag] [nvarchar](400) NOT NULL,
	[planid] [bigint] NULL,
	[subscribergroupid] [bigint] NULL,
 CONSTRAINT [PK_AlarmEscalationPlan] PRIMARY KEY CLUSTERED 
(
	[alarmtag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AlarmIdentification]    Script Date: 13-11-2015 09:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE AlarmIdentification(
	[alarmtag] [nvarchar](390) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Index [GetAlarmIdentificationsIndex]    Script Date: 24-06-2016 10:28:09 ******/
CREATE NONCLUSTERED INDEX [GetAlarmIdentificationsIndex] ON [dbo].[AlarmIdentification]
(
	[alarmtag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [UpdateAlarmIdentificationsIndex]    Script Date: 24-06-2016 10:29:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UpdateAlarmIdentificationsIndex] ON [dbo].[AlarmIdentification]
(
	[alarmtag] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[AlarmInstance]    Script Date: 13-11-2015 09:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlarmInstance](
	[alarmtag] [nvarchar](400) NOT NULL,
	[alarmstatusnumber] [nvarchar](64) NOT NULL,
	[alarmtype] [nvarchar](64) NOT NULL,
	[alarmgroup] [nvarchar](64) NOT NULL,
	[priority] [bigint] NOT NULL,
	[partname] [nvarchar](64) NOT NULL,
	[elementid] [nvarchar](64) NOT NULL,
	[level1view] [nvarchar](max) NULL,
	[level2view] [nvarchar](max) NULL,
	[extrataglist] [nvarchar](max) NOT NULL,
	[category] [nvarchar](50) NOT NULL,
	[technical] [bigint] NOT NULL,
	[cctvrecording] [nvarchar](64) NOT NULL,
	[dateon] [datetime2] NOT NULL,
	[dateoff] [datetime2] NULL,
	[dateack] [datetime2] NULL,
	[ackcomment] [nvarchar](max) NULL,
	[ackuser] [nvarchar](max) NULL,
	[occurrencecomment] [nvarchar](max) NULL,
	[generelcomment] [nvarchar](max) NULL,
	[replacevalue1] [nvarchar](200) NULL,
	[replacevalue2] [nvarchar](200) NULL,
	[replacevalue3] [nvarchar](200) NULL,
	[replacevalue4] [nvarchar](200) NULL,
	[replacevalue5] [nvarchar](200) NULL,
	[replacevalue6] [nvarchar](200) NULL,
	[replacevalue7] [nvarchar](200) NULL,
	[replacevalue8] [nvarchar](200) NULL,
	[replacevalue9] [nvarchar](200) NULL,
	[replacevalue10] [nvarchar](200) NULL,
	[replacevalue11] [nvarchar](200) NULL,
	[replacevalue12] [nvarchar](200) NULL,
	[replacevalue13] [nvarchar](200) NULL,
	[replacevalue14] [nvarchar](200) NULL,
	[replacevalue15] [nvarchar](200) NULL,
	[replacevalue16] [nvarchar](200) NULL,
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EscalationInstance]    Script Date: 13-11-2015 09:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EscalationInstance](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[escalationstepid] [bigint] NULL,
	[datestart] [datetime] NOT NULL,
	[dateend] [datetime] NULL,
 CONSTRAINT [PK_EscalationInstance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EscalationPlan]    Script Date: 13-11-2015 09:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EscalationPlan](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_EscalationPlan] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EscalationStep]    Script Date: 13-11-2015 09:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EscalationStep](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[planid] [bigint] NULL,
	[orderidx] [bigint] NOT NULL,
	[timeoutsecs] [bigint] NOT NULL,
	[name] [nvarchar](64) NOT NULL,
	[updated] [bit] NOT NULL,
 CONSTRAINT [PK_EscalationStep] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EscalationStepSubscriberGroup]    Script Date: 13-11-2015 09:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EscalationStepSubscriberGroup](
	[escalationstepid] [bigint] NOT NULL,
	[subscribergroupid] [bigint] NOT NULL,
 CONSTRAINT [PK_EscalationStepSubscriberGroup] PRIMARY KEY CLUSTERED 
(
	[escalationstepid] ASC,
	[subscribergroupid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MessengerLog]    Script Date: 13-11-2015 09:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessengerLog](
	[id] [nvarchar](64) NOT NULL,
	[escalationinstanceid] [bigint] NULL,
	[servicetype] [nvarchar](64) NULL,
	[address] [nvarchar](max) NULL,
	[sendtime] [datetime] NULL,
	[answer] [nvarchar](max) NULL,
 CONSTRAINT [PK_MessengerLog] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subscriber]    Script Date: 13-11-2015 09:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriber](
	[name] [nvarchar](64) NOT NULL,
	[language] [nvarchar](10) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Subscriber] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubscriberAddress]    Script Date: 13-11-2015 09:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriberAddress](
	[orderidx] [bigint] NOT NULL,
	[servicetype] [nvarchar](10) NOT NULL,
	[address] [nvarchar](max) NULL,
	[subscriberId] [bigint] NOT NULL,
 CONSTRAINT [PK_SubscriberAddress] PRIMARY KEY CLUSTERED 
(
	[orderidx] ASC,
	[subscriberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubscriberGroup]    Script Date: 13-11-2015 09:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriberGroup](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_SubscriberGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubscriberGroupsMember]    Script Date: 13-11-2015 09:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriberGroupsMember](
	[groupid] [bigint] NOT NULL,
	[subscriberId] [bigint] NOT NULL,
 CONSTRAINT [PK_SubscriberGroupsMember] PRIMARY KEY CLUSTERED 
(
	[groupid] ASC,
	[subscriberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[SubscriberSchedule]    Script Date: 26-01-2016 13:51:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriberSchedule](
	[Id] [uniqueidentifier] NOT NULL,
	[subscriberId] [bigint] NOT NULL,
	[startTicks] [bigint] NOT NULL,
	[endTicks] [bigint] NOT NULL,
	[startDatetime] [datetime] NOT NULL,
	[endDatetime] [datetime] NOT NULL,
	[recurId] [bigint] NULL,
 CONSTRAINT [PK_SubscriberSchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_SubscriberSchedule_endTicks]    Script Date: 26-01-2016 13:51:56 ******/
CREATE NONCLUSTERED INDEX [IX_SubscriberSchedule_endTicks] ON [dbo].[SubscriberSchedule]
(
	[endTicks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubscriberSchedule_startTicks]    Script Date: 26-01-2016 13:51:56 ******/
CREATE NONCLUSTERED INDEX [IX_SubscriberSchedule_startTicks] ON [dbo].[SubscriberSchedule]
(
	[startTicks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubscriberSchedule_subscriberId]    Script Date: 26-01-2016 13:51:56 ******/
CREATE NONCLUSTERED INDEX [IX_SubscriberSchedule_subscriberId] ON [dbo].[SubscriberSchedule]
(
	[subscriberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SubscriberSchedule] ADD  CONSTRAINT [DF_SubscriberSchedule_Id]  DEFAULT (newid()) FOR [Id]
GO

/****** Object:  Index [_index_AlarmInstance_DateOn]    Script Date: 13-11-2015 09:26:33 ******/
CREATE CLUSTERED INDEX [_index_AlarmInstance_DateOn] ON [dbo].[AlarmInstance]
(
	[dateon] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [_index_AlarmInstance_Category] ON [dbo].[AlarmInstance]
(
	[category] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_index_MessengerLog_Id]    Script Date: 13-11-2015 09:26:33 ******/
CREATE CLUSTERED INDEX [_index_MessengerLog_Id] ON [dbo].[MessengerLog]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AlarmEscalationPlan_planid]    Script Date: 13-11-2015 09:26:33 ******/
CREATE NONCLUSTERED INDEX [IX_AlarmEscalationPlan_planid] ON [dbo].[AlarmEscalationPlan]
(
	[planid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_AlarmEscalationPlan_subscribergroupid]    Script Date: 13-11-2015 09:26:33 ******/
CREATE NONCLUSTERED INDEX [IX_AlarmEscalationPlan_subscribergroupid] ON [dbo].[AlarmEscalationPlan]
(
	[subscribergroupid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EscalationInstance_datestart]    Script Date: 13-11-2015 09:26:33 ******/
CREATE NONCLUSTERED INDEX [IX_EscalationInstance_datestart] ON [dbo].[EscalationInstance]
(
	[datestart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EscalationInstance_escalationstepid]    Script Date: 13-11-2015 09:26:33 ******/
CREATE NONCLUSTERED INDEX [IX_EscalationInstance_escalationstepid] ON [dbo].[EscalationInstance]
(
	[escalationstepid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EscalationStep_planid]    Script Date: 13-11-2015 09:26:33 ******/
CREATE NONCLUSTERED INDEX [IX_EscalationStep_planid] ON [dbo].[EscalationStep]
(
	[planid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EscalationStepSubscriberGroup_escalationstepid]    Script Date: 13-11-2015 09:26:33 ******/
CREATE NONCLUSTERED INDEX [IX_EscalationStepSubscriberGroup_escalationstepid] ON [dbo].[EscalationStepSubscriberGroup]
(
	[escalationstepid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_EscalationStepSubscriberGroup_subscribergroupid]    Script Date: 13-11-2015 09:26:33 ******/
CREATE NONCLUSTERED INDEX [IX_EscalationStepSubscriberGroup_subscribergroupid] ON [dbo].[EscalationStepSubscriberGroup]
(
	[subscribergroupid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_index_MessengerLog_SendTime]    Script Date: 13-11-2015 09:26:33 ******/
CREATE NONCLUSTERED INDEX [_index_MessengerLog_SendTime] ON [dbo].[MessengerLog]
(
	[sendtime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubscriberAddress_subscriberid]    Script Date: 13-11-2015 09:26:33 ******/
CREATE NONCLUSTERED INDEX [IX_SubscriberAddress_subscriberid] ON [dbo].[SubscriberAddress]
(
	[subscriberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubscriberGroupsMember_groupid]    Script Date: 13-11-2015 09:26:33 ******/
CREATE NONCLUSTERED INDEX [IX_SubscriberGroupsMember_groupid] ON [dbo].[SubscriberGroupsMember]
(
	[groupid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_SubscriberGroupsMember_subscriberid]    Script Date: 13-11-2015 09:26:33 ******/
CREATE NONCLUSTERED INDEX [IX_SubscriberGroupsMember_subscriberid] ON [dbo].[SubscriberGroupsMember]
(
	[subscriberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EscalationStep] ADD  CONSTRAINT [DF__Escalation__name__25869641]  DEFAULT ('') FOR [name]
GO
ALTER TABLE [dbo].[EscalationStep] ADD  CONSTRAINT [DF_EscalationStep_updated]  DEFAULT ((1)) FOR [updated]
GO

CREATE TABLE [dbo].[ExtendedProperties](
	[alarmtag] [nvarchar](390) NOT NULL,
	[dateon] [datetime2] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[value] [nvarchar](max) NULL
) ON [PRIMARY] 
GO

/****** Object:  Index [GetExtendedPropertiesIndex]    Script Date: 24-06-2016 10:28:09 ******/
CREATE NONCLUSTERED INDEX [GetExtendedPropertiesIndex] ON [dbo].[ExtendedProperties]
(
	[alarmtag] ASC,
	[dateon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/****** Object:  Index [UpdateExtendedPropertyIndex]    Script Date: 24-06-2016 10:29:18 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UpdateExtendedPropertyIndex] ON [dbo].[ExtendedProperties]
(
	[alarmtag] ASC,
	[dateon] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


CREATE TABLE [dbo].[tblVersion](
	[productname] [nvarchar](45) NOT NULL,
	[version] [nvarchar](10) NOT NULL,
	[description] [nvarchar](45) NOT NULL,
	[applied] [datetime] NOT NULL CONSTRAINT [DF_tblVersion]  DEFAULT (getdate())
) ON [PRIMARY]
GO
INSERT INTO [dbo].[tblVersion] (productname,version,description) VALUES ('bgalarmlink', 7, 'updated to version 7')
GO
