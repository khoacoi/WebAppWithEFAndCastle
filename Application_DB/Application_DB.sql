
/****** Object:  Table [dbo].[Profile]    Script Date: 01/07/2013 12:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[ProfileId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[Updated] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneType]    Script Date: 01/07/2013 12:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneType](
	[PhoneTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PhoneType] PRIMARY KEY CLUSTERED 
(
	[PhoneTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phone]    Script Date: 01/07/2013 12:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phone](
	[PhoneId] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](25) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[Updated] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressType]    Script Date: 01/07/2013 12:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressType](
	[AddressTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AddressType] PRIMARY KEY CLUSTERED 
(
	[AddressTypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 01/07/2013 12:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [nvarchar](100) NOT NULL,
	[AddressLine2] [nvarchar](100) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[ZipCode] [nvarchar](15) NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[Updated] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfilePhone]    Script Date: 01/07/2013 12:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfilePhone](
	[ProfilePhoneId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[PhoneId] [int] NOT NULL,
	[PhoneTypeId] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[Updated] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProfilePhone] PRIMARY KEY CLUSTERED 
(
	[ProfilePhoneId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfileAddress]    Script Date: 01/07/2013 12:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfileAddress](
	[ProfileAddressId] [int] IDENTITY(1,1) NOT NULL,
	[ProfileId] [int] NOT NULL,
	[AddressId] [int] NOT NULL,
	[AddressTypeId] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](50) NOT NULL,
	[Updated] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProfileAddress] PRIMARY KEY CLUSTERED 
(
	[ProfileAddressId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Profile_Created]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[Profile] ADD  CONSTRAINT [DF_Profile_Created]  DEFAULT (getdate()) FOR [Created]
GO
/****** Object:  Default [DF_Profile_CreatedBy]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[Profile] ADD  CONSTRAINT [DF_Profile_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
/****** Object:  Default [DF_Profile_Updated]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[Profile] ADD  CONSTRAINT [DF_Profile_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
/****** Object:  Default [DF_Profile_UpdatedBy]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[Profile] ADD  CONSTRAINT [DF_Profile_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO
/****** Object:  Default [DF_Phone_Created]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[Phone] ADD  CONSTRAINT [DF_Phone_Created]  DEFAULT (getdate()) FOR [Created]
GO
/****** Object:  Default [DF_Phone_CreatedBy]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[Phone] ADD  CONSTRAINT [DF_Phone_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
/****** Object:  Default [DF_Phone_Updated]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[Phone] ADD  CONSTRAINT [DF_Phone_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
/****** Object:  Default [DF_Phone_UpdatedBy]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[Phone] ADD  CONSTRAINT [DF_Phone_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO
/****** Object:  Default [DF_Address_Created]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[Address] ADD  CONSTRAINT [DF_Address_Created]  DEFAULT (getdate()) FOR [Created]
GO
/****** Object:  Default [DF_Address_CreatedBy]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[Address] ADD  CONSTRAINT [DF_Address_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
/****** Object:  Default [DF_Address_Updated]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[Address] ADD  CONSTRAINT [DF_Address_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
/****** Object:  Default [DF_Address_UpdatedBy]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[Address] ADD  CONSTRAINT [DF_Address_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO
/****** Object:  Default [DF_ProfilePhone_Created]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfilePhone] ADD  CONSTRAINT [DF_ProfilePhone_Created]  DEFAULT (getdate()) FOR [Created]
GO
/****** Object:  Default [DF_ProfilePhone_CreatedBy]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfilePhone] ADD  CONSTRAINT [DF_ProfilePhone_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
/****** Object:  Default [DF_ProfilePhone_Updated]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfilePhone] ADD  CONSTRAINT [DF_ProfilePhone_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
/****** Object:  Default [DF_ProfilePhone_UpdatedBy]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfilePhone] ADD  CONSTRAINT [DF_ProfilePhone_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO
/****** Object:  Default [DF_ProfileAddress_Created]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfileAddress] ADD  CONSTRAINT [DF_ProfileAddress_Created]  DEFAULT (getdate()) FOR [Created]
GO
/****** Object:  Default [DF_ProfileAddress_CreatedBy]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfileAddress] ADD  CONSTRAINT [DF_ProfileAddress_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
GO
/****** Object:  Default [DF_ProfileAddress_Updated]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfileAddress] ADD  CONSTRAINT [DF_ProfileAddress_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
/****** Object:  Default [DF_ProfileAddress_UpdatedBy]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfileAddress] ADD  CONSTRAINT [DF_ProfileAddress_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
GO
/****** Object:  ForeignKey [FK_ProfilePhone_Phone]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfilePhone]  WITH CHECK ADD  CONSTRAINT [FK_ProfilePhone_Phone] FOREIGN KEY([PhoneId])
REFERENCES [dbo].[Phone] ([PhoneId])
GO
ALTER TABLE [dbo].[ProfilePhone] CHECK CONSTRAINT [FK_ProfilePhone_Phone]
GO
/****** Object:  ForeignKey [FK_ProfilePhone_PhoneType]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfilePhone]  WITH CHECK ADD  CONSTRAINT [FK_ProfilePhone_PhoneType] FOREIGN KEY([PhoneTypeId])
REFERENCES [dbo].[PhoneType] ([PhoneTypeId])
GO
ALTER TABLE [dbo].[ProfilePhone] CHECK CONSTRAINT [FK_ProfilePhone_PhoneType]
GO
/****** Object:  ForeignKey [FK_ProfilePhone_Profile]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfilePhone]  WITH CHECK ADD  CONSTRAINT [FK_ProfilePhone_Profile] FOREIGN KEY([ProfileId])
REFERENCES [dbo].[Profile] ([ProfileId])
GO
ALTER TABLE [dbo].[ProfilePhone] CHECK CONSTRAINT [FK_ProfilePhone_Profile]
GO
/****** Object:  ForeignKey [FK_ProfileAddress_Address]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfileAddress]  WITH CHECK ADD  CONSTRAINT [FK_ProfileAddress_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[ProfileAddress] CHECK CONSTRAINT [FK_ProfileAddress_Address]
GO
/****** Object:  ForeignKey [FK_ProfileAddress_AddressType]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfileAddress]  WITH CHECK ADD  CONSTRAINT [FK_ProfileAddress_AddressType] FOREIGN KEY([AddressTypeId])
REFERENCES [dbo].[AddressType] ([AddressTypeId])
GO
ALTER TABLE [dbo].[ProfileAddress] CHECK CONSTRAINT [FK_ProfileAddress_AddressType]
GO
/****** Object:  ForeignKey [FK_ProfileAddress_Profile]    Script Date: 01/07/2013 12:54:42 ******/
ALTER TABLE [dbo].[ProfileAddress]  WITH CHECK ADD  CONSTRAINT [FK_ProfileAddress_Profile] FOREIGN KEY([ProfileId])
REFERENCES [dbo].[Profile] ([ProfileId])
GO
ALTER TABLE [dbo].[ProfileAddress] CHECK CONSTRAINT [FK_ProfileAddress_Profile]
GO




/******Master Table Entry ******/

INSERT INTO [dbo].[AddressType] ([Name])VALUES ('Billing Address')
INSERT INTO [dbo].[AddressType] ([Name])VALUES ('Shipping Address')

INSERT INTO [dbo].[PhoneType] ([Name]) VALUES ('Home Phone')
INSERT INTO [dbo].[PhoneType] ([Name]) VALUES ('Work Phone')
