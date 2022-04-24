
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/27/2020 10:47:39
-- Generated from EDMX file: C:\Users\Brad\Desktop\Client-Websites\nwt_website\App_Code\NewWayModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [SQL2017_948528_newwaytrucks];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_TerritoryNewWayDealer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewWayDealers] DROP CONSTRAINT [FK_TerritoryNewWayDealer];
GO
IF OBJECT_ID(N'[dbo].[FK_NewWayEShowroomNewWayDealer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewWayEShowrooms] DROP CONSTRAINT [FK_NewWayEShowroomNewWayDealer];
GO
IF OBJECT_ID(N'[dbo].[FK_NewWayEShowroomNewWayEShowType]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewWayEShowrooms] DROP CONSTRAINT [FK_NewWayEShowroomNewWayEShowType];
GO
IF OBJECT_ID(N'[dbo].[FK_NewWayModelNewWayStyle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewWayModels] DROP CONSTRAINT [FK_NewWayModelNewWayStyle];
GO
IF OBJECT_ID(N'[dbo].[FK_NewWayEShowroomNewWayModel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewWayEShowrooms] DROP CONSTRAINT [FK_NewWayEShowroomNewWayModel];
GO
IF OBJECT_ID(N'[dbo].[FK_NewWayCapacityNewWayModel]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewWayCapacities] DROP CONSTRAINT [FK_NewWayCapacityNewWayModel];
GO
IF OBJECT_ID(N'[dbo].[FK_NewWayEShowroomNewWayChassisMake]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewWayEShowrooms] DROP CONSTRAINT [FK_NewWayEShowroomNewWayChassisMake];
GO
IF OBJECT_ID(N'[dbo].[FK_NewWaySaleStatusNewWayEShowroom]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewWayEShowrooms] DROP CONSTRAINT [FK_NewWaySaleStatusNewWayEShowroom];
GO
IF OBJECT_ID(N'[dbo].[FK_NewWayEShowPhotosNewWayEShowroom]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewWayEShowPhotos] DROP CONSTRAINT [FK_NewWayEShowPhotosNewWayEShowroom];
GO
IF OBJECT_ID(N'[dbo].[FK_NewWayCapacityNewWayEShowroom]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewWayEShowrooms] DROP CONSTRAINT [FK_NewWayCapacityNewWayEShowroom];
GO
IF OBJECT_ID(N'[dbo].[FK_ServiceSupportTypeServiceSupportManual]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ServiceSupportManuals] DROP CONSTRAINT [FK_ServiceSupportTypeServiceSupportManual];
GO
IF OBJECT_ID(N'[dbo].[FK_NewWayModelServiceSupportTruck]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ServiceSupportTrucks] DROP CONSTRAINT [FK_NewWayModelServiceSupportTruck];
GO
IF OBJECT_ID(N'[dbo].[FK_ServiceSupportTruckServiceSupportManual_ServiceSupportTruck]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ServiceSupportTruckServiceSupportManual] DROP CONSTRAINT [FK_ServiceSupportTruckServiceSupportManual_ServiceSupportTruck];
GO
IF OBJECT_ID(N'[dbo].[FK_ServiceSupportTruckServiceSupportManual_ServiceSupportManual]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ServiceSupportTruckServiceSupportManual] DROP CONSTRAINT [FK_ServiceSupportTruckServiceSupportManual_ServiceSupportManual];
GO
IF OBJECT_ID(N'[dbo].[FK_InquiryTypeWebsiteInquiry]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[WebsiteInquiries] DROP CONSTRAINT [FK_InquiryTypeWebsiteInquiry];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[UserProfiles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserProfiles];
GO
IF OBJECT_ID(N'[dbo].[Territories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Territories];
GO
IF OBJECT_ID(N'[dbo].[NewWayDealers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewWayDealers];
GO
IF OBJECT_ID(N'[dbo].[NewWayEShowrooms]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewWayEShowrooms];
GO
IF OBJECT_ID(N'[dbo].[NewWayEShowTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewWayEShowTypes];
GO
IF OBJECT_ID(N'[dbo].[NewWayModels]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewWayModels];
GO
IF OBJECT_ID(N'[dbo].[NewWayStyles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewWayStyles];
GO
IF OBJECT_ID(N'[dbo].[NewWayCapacities]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewWayCapacities];
GO
IF OBJECT_ID(N'[dbo].[NewWayChassisMakes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewWayChassisMakes];
GO
IF OBJECT_ID(N'[dbo].[NewWaySaleStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewWaySaleStatus];
GO
IF OBJECT_ID(N'[dbo].[NewWayEShowPhotos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewWayEShowPhotos];
GO
IF OBJECT_ID(N'[dbo].[ServiceSupportTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ServiceSupportTypes];
GO
IF OBJECT_ID(N'[dbo].[ServiceSupportManuals]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ServiceSupportManuals];
GO
IF OBJECT_ID(N'[dbo].[ServiceSupportTrucks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ServiceSupportTrucks];
GO
IF OBJECT_ID(N'[dbo].[signupSubscribers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[signupSubscribers];
GO
IF OBJECT_ID(N'[dbo].[WebsiteInquiries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[WebsiteInquiries];
GO
IF OBJECT_ID(N'[dbo].[InquiryTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InquiryTypes];
GO
IF OBJECT_ID(N'[dbo].[TruckWarranties]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TruckWarranties];
GO
IF OBJECT_ID(N'[dbo].[RSVPInquiries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RSVPInquiries];
GO
IF OBJECT_ID(N'[dbo].[ServiceSupportTruckServiceSupportManual]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ServiceSupportTruckServiceSupportManual];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'UserProfiles'
CREATE TABLE [dbo].[UserProfiles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [firstName] nvarchar(max)  NOT NULL,
    [lastName] nvarchar(max)  NOT NULL,
    [company] nvarchar(max)  NOT NULL,
    [address] nvarchar(max)  NOT NULL,
    [city] nvarchar(max)  NOT NULL,
    [state] nvarchar(max)  NOT NULL,
    [zipCode] nvarchar(max)  NOT NULL,
    [country] nvarchar(max)  NOT NULL,
    [phone] nvarchar(max)  NOT NULL,
    [website] nvarchar(max)  NULL,
    [userId] nvarchar(max)  NOT NULL,
    [NewWayDealerId] int  NULL,
    [titleRole] nvarchar(max)  NULL
);
GO

-- Creating table 'Territories'
CREATE TABLE [dbo].[Territories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [state] nvarchar(max)  NOT NULL,
    [abbreviation] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'NewWayDealers'
CREATE TABLE [dbo].[NewWayDealers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BusinessName] nvarchar(max)  NULL,
    [Address] nvarchar(max)  NULL,
    [City] nvarchar(max)  NULL,
    [TerritoryId] int  NOT NULL,
    [Zipcode] nvarchar(max)  NULL,
    [Phone] nvarchar(max)  NULL,
    [Fax] nvarchar(max)  NULL,
    [WebAddress] nvarchar(max)  NULL,
    [UserProfileId] int  NOT NULL
);
GO

-- Creating table 'NewWayEShowrooms'
CREATE TABLE [dbo].[NewWayEShowrooms] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NewWayDealerId] int  NOT NULL,
    [ShowTypeId] int  NOT NULL,
    [WorkOrder] nvarchar(max)  NULL,
    [ModelId] int  NOT NULL,
    [Hours] nvarchar(max)  NULL,
    [Year] int  NOT NULL,
    [ChassisMakeId] int  NOT NULL,
    [Transmission] nvarchar(max)  NULL,
    [GVM] nvarchar(max)  NULL,
    [GVWR] nvarchar(max)  NULL,
    [Mileage] int  NULL,
    [Comments] nvarchar(max)  NULL,
    [SaleStatusId] int  NOT NULL,
    [DateSubmitted] datetime  NULL,
    [DateSold] datetime  NULL,
    [DeclineNotes] nvarchar(max)  NULL,
    [CapacityId] int  NOT NULL,
    [NewListing] tinyint  NULL,
    [DateEmailNotificationSent] datetime  NULL,
    [EmailNotificationSent] tinyint  NULL,
    [Engine] nvarchar(max)  NULL
);
GO

-- Creating table 'NewWayEShowTypes'
CREATE TABLE [dbo].[NewWayEShowTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ShowType] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'NewWayModels'
CREATE TABLE [dbo].[NewWayModels] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Model] nvarchar(max)  NOT NULL,
    [StyleId] int  NOT NULL,
    [TruckImage] nvarchar(max)  NULL,
    [SpecSheetPath] nvarchar(max)  NULL,
    [YouTubeLink] nvarchar(max)  NULL
);
GO

-- Creating table 'NewWayStyles'
CREATE TABLE [dbo].[NewWayStyles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Style] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'NewWayCapacities'
CREATE TABLE [dbo].[NewWayCapacities] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Capacity] nvarchar(max)  NOT NULL,
    [NewWayModelId] int  NOT NULL
);
GO

-- Creating table 'NewWayChassisMakes'
CREATE TABLE [dbo].[NewWayChassisMakes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ChassisMake] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'NewWaySaleStatus'
CREATE TABLE [dbo].[NewWaySaleStatus] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Status] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'NewWayEShowPhotos'
CREATE TABLE [dbo].[NewWayEShowPhotos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [EShowroomId] int  NOT NULL,
    [PhotoPath] nvarchar(max)  NULL,
    [ThumbPath] nvarchar(max)  NULL,
    [Caption] nvarchar(max)  NULL,
    [isPrimaryPhoto] bit  NULL,
    [PDFPath] nvarchar(max)  NULL
);
GO

-- Creating table 'ServiceSupportTypes'
CREATE TABLE [dbo].[ServiceSupportTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SupportType] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ServiceSupportManuals'
CREATE TABLE [dbo].[ServiceSupportManuals] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Filename] nvarchar(max)  NOT NULL,
    [FileDescription] nvarchar(max)  NULL,
    [ServiceSupportTypeId] int  NOT NULL,
    [VideoLink] nvarchar(max)  NULL,
    [publicAccess] bit  NULL
);
GO

-- Creating table 'ServiceSupportTrucks'
CREATE TABLE [dbo].[ServiceSupportTrucks] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BuildDate] datetime  NULL,
    [SerialNumberText] nvarchar(max)  NULL,
    [VIN] nvarchar(max)  NULL,
    [DealerTruck] bit  NULL,
    [NewWayModelId] int  NOT NULL
);
GO

-- Creating table 'signupSubscribers'
CREATE TABLE [dbo].[signupSubscribers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [email] nvarchar(max)  NOT NULL,
    [subscribe] tinyint  NULL,
    [firstname] nvarchar(max)  NOT NULL,
    [lastname] nvarchar(max)  NOT NULL,
    [state] nvarchar(max)  NULL,
    [company] nvarchar(max)  NULL,
    [phone] nvarchar(max)  NULL,
    [country] nvarchar(max)  NULL,
    [nwtInterest] nvarchar(max)  NOT NULL,
    [comments] nvarchar(max)  NULL,
    [signupDate] datetime  NULL
);
GO

-- Creating table 'WebsiteInquiries'
CREATE TABLE [dbo].[WebsiteInquiries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [dateSubmitted] datetime  NOT NULL,
    [followUpCompleted] datetime  NULL,
    [firstName] nvarchar(max)  NULL,
    [lastName] nvarchar(max)  NULL,
    [email] nvarchar(max)  NULL,
    [phone] nvarchar(max)  NULL,
    [company] nvarchar(max)  NULL,
    [jobTitle] nvarchar(max)  NULL,
    [address] nvarchar(max)  NULL,
    [city] nvarchar(max)  NULL,
    [state] nvarchar(max)  NULL,
    [country] nvarchar(max)  NULL,
    [zip] nvarchar(max)  NULL,
    [testimonial] nvarchar(max)  NULL,
    [testimonialPhoto] tinyint  NULL,
    [comments] nvarchar(max)  NULL,
    [newWayInterest] nvarchar(max)  NULL,
    [kPacInterest] nvarchar(max)  NULL,
    [infoCustomApparel] tinyint  NULL,
    [cobraFlyer] tinyint  NULL,
    [cobraMagnumFlyer] tinyint  NULL,
    [kingCobraFlyer] tinyint  NULL,
    [diamonbackFlyer] tinyint  NULL,
    [viperFlyer] tinyint  NULL,
    [mambaFlyer] tinyint  NULL,
    [mammothFlyer] tinyint  NULL,
    [westernSeriesMammothFlyer] tinyint  NULL,
    [sidewinderFlyer] tinyint  NULL,
    [rotoPacFlyer] tinyint  NULL,
    [InquiryTypeId] int  NOT NULL,
    [eShowroomTruckInterest] nvarchar(max)  NULL,
    [archived] nvarchar(max)  NULL,
    [interestArea] nvarchar(max)  NULL,
    [qtyDesired] nvarchar(max)  NULL
);
GO

-- Creating table 'InquiryTypes'
CREATE TABLE [dbo].[InquiryTypes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TruckWarranties'
CREATE TABLE [dbo].[TruckWarranties] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DateSubmitted] datetime  NOT NULL,
    [NewWayDealerId] int  NOT NULL,
    [WarrantyJson] nvarchar(max)  NULL,
    [WarrantyPdf] varbinary(max)  NULL,
    [CustomerName] nvarchar(max)  NULL,
    [ChassisVIN] nvarchar(max)  NULL,
    [SellingDealer] nvarchar(max)  NULL
);
GO

-- Creating table 'RSVPInquiries'
CREATE TABLE [dbo].[RSVPInquiries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [firstName] nvarchar(max)  NULL,
    [lastName] nvarchar(max)  NULL,
    [company] nvarchar(max)  NULL,
    [email] nvarchar(max)  NULL,
    [attending] nvarchar(max)  NULL,
    [hotelAccommodations] nvarchar(max)  NULL,
    [phone] nvarchar(max)  NULL,
    [country] nvarchar(max)  NULL,
    [state] nvarchar(max)  NULL,
    [comments] nvarchar(max)  NULL,
    [dateSubmitted] datetime  NOT NULL
);
GO

-- Creating table 'ServiceSupportTruckServiceSupportManual'
CREATE TABLE [dbo].[ServiceSupportTruckServiceSupportManual] (
    [ServiceSupportTrucks_Id] int  NOT NULL,
    [ServiceSupportManuals_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'UserProfiles'
ALTER TABLE [dbo].[UserProfiles]
ADD CONSTRAINT [PK_UserProfiles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Territories'
ALTER TABLE [dbo].[Territories]
ADD CONSTRAINT [PK_Territories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewWayDealers'
ALTER TABLE [dbo].[NewWayDealers]
ADD CONSTRAINT [PK_NewWayDealers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewWayEShowrooms'
ALTER TABLE [dbo].[NewWayEShowrooms]
ADD CONSTRAINT [PK_NewWayEShowrooms]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewWayEShowTypes'
ALTER TABLE [dbo].[NewWayEShowTypes]
ADD CONSTRAINT [PK_NewWayEShowTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewWayModels'
ALTER TABLE [dbo].[NewWayModels]
ADD CONSTRAINT [PK_NewWayModels]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewWayStyles'
ALTER TABLE [dbo].[NewWayStyles]
ADD CONSTRAINT [PK_NewWayStyles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewWayCapacities'
ALTER TABLE [dbo].[NewWayCapacities]
ADD CONSTRAINT [PK_NewWayCapacities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewWayChassisMakes'
ALTER TABLE [dbo].[NewWayChassisMakes]
ADD CONSTRAINT [PK_NewWayChassisMakes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewWaySaleStatus'
ALTER TABLE [dbo].[NewWaySaleStatus]
ADD CONSTRAINT [PK_NewWaySaleStatus]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewWayEShowPhotos'
ALTER TABLE [dbo].[NewWayEShowPhotos]
ADD CONSTRAINT [PK_NewWayEShowPhotos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ServiceSupportTypes'
ALTER TABLE [dbo].[ServiceSupportTypes]
ADD CONSTRAINT [PK_ServiceSupportTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ServiceSupportManuals'
ALTER TABLE [dbo].[ServiceSupportManuals]
ADD CONSTRAINT [PK_ServiceSupportManuals]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ServiceSupportTrucks'
ALTER TABLE [dbo].[ServiceSupportTrucks]
ADD CONSTRAINT [PK_ServiceSupportTrucks]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'signupSubscribers'
ALTER TABLE [dbo].[signupSubscribers]
ADD CONSTRAINT [PK_signupSubscribers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'WebsiteInquiries'
ALTER TABLE [dbo].[WebsiteInquiries]
ADD CONSTRAINT [PK_WebsiteInquiries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'InquiryTypes'
ALTER TABLE [dbo].[InquiryTypes]
ADD CONSTRAINT [PK_InquiryTypes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TruckWarranties'
ALTER TABLE [dbo].[TruckWarranties]
ADD CONSTRAINT [PK_TruckWarranties]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RSVPInquiries'
ALTER TABLE [dbo].[RSVPInquiries]
ADD CONSTRAINT [PK_RSVPInquiries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ServiceSupportTrucks_Id], [ServiceSupportManuals_Id] in table 'ServiceSupportTruckServiceSupportManual'
ALTER TABLE [dbo].[ServiceSupportTruckServiceSupportManual]
ADD CONSTRAINT [PK_ServiceSupportTruckServiceSupportManual]
    PRIMARY KEY CLUSTERED ([ServiceSupportTrucks_Id], [ServiceSupportManuals_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TerritoryId] in table 'NewWayDealers'
ALTER TABLE [dbo].[NewWayDealers]
ADD CONSTRAINT [FK_TerritoryNewWayDealer]
    FOREIGN KEY ([TerritoryId])
    REFERENCES [dbo].[Territories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TerritoryNewWayDealer'
CREATE INDEX [IX_FK_TerritoryNewWayDealer]
ON [dbo].[NewWayDealers]
    ([TerritoryId]);
GO

-- Creating foreign key on [NewWayDealerId] in table 'NewWayEShowrooms'
ALTER TABLE [dbo].[NewWayEShowrooms]
ADD CONSTRAINT [FK_NewWayEShowroomNewWayDealer]
    FOREIGN KEY ([NewWayDealerId])
    REFERENCES [dbo].[NewWayDealers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewWayEShowroomNewWayDealer'
CREATE INDEX [IX_FK_NewWayEShowroomNewWayDealer]
ON [dbo].[NewWayEShowrooms]
    ([NewWayDealerId]);
GO

-- Creating foreign key on [ShowTypeId] in table 'NewWayEShowrooms'
ALTER TABLE [dbo].[NewWayEShowrooms]
ADD CONSTRAINT [FK_NewWayEShowroomNewWayEShowType]
    FOREIGN KEY ([ShowTypeId])
    REFERENCES [dbo].[NewWayEShowTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewWayEShowroomNewWayEShowType'
CREATE INDEX [IX_FK_NewWayEShowroomNewWayEShowType]
ON [dbo].[NewWayEShowrooms]
    ([ShowTypeId]);
GO

-- Creating foreign key on [StyleId] in table 'NewWayModels'
ALTER TABLE [dbo].[NewWayModels]
ADD CONSTRAINT [FK_NewWayModelNewWayStyle]
    FOREIGN KEY ([StyleId])
    REFERENCES [dbo].[NewWayStyles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewWayModelNewWayStyle'
CREATE INDEX [IX_FK_NewWayModelNewWayStyle]
ON [dbo].[NewWayModels]
    ([StyleId]);
GO

-- Creating foreign key on [ModelId] in table 'NewWayEShowrooms'
ALTER TABLE [dbo].[NewWayEShowrooms]
ADD CONSTRAINT [FK_NewWayEShowroomNewWayModel]
    FOREIGN KEY ([ModelId])
    REFERENCES [dbo].[NewWayModels]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewWayEShowroomNewWayModel'
CREATE INDEX [IX_FK_NewWayEShowroomNewWayModel]
ON [dbo].[NewWayEShowrooms]
    ([ModelId]);
GO

-- Creating foreign key on [NewWayModelId] in table 'NewWayCapacities'
ALTER TABLE [dbo].[NewWayCapacities]
ADD CONSTRAINT [FK_NewWayCapacityNewWayModel]
    FOREIGN KEY ([NewWayModelId])
    REFERENCES [dbo].[NewWayModels]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewWayCapacityNewWayModel'
CREATE INDEX [IX_FK_NewWayCapacityNewWayModel]
ON [dbo].[NewWayCapacities]
    ([NewWayModelId]);
GO

-- Creating foreign key on [ChassisMakeId] in table 'NewWayEShowrooms'
ALTER TABLE [dbo].[NewWayEShowrooms]
ADD CONSTRAINT [FK_NewWayEShowroomNewWayChassisMake]
    FOREIGN KEY ([ChassisMakeId])
    REFERENCES [dbo].[NewWayChassisMakes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewWayEShowroomNewWayChassisMake'
CREATE INDEX [IX_FK_NewWayEShowroomNewWayChassisMake]
ON [dbo].[NewWayEShowrooms]
    ([ChassisMakeId]);
GO

-- Creating foreign key on [SaleStatusId] in table 'NewWayEShowrooms'
ALTER TABLE [dbo].[NewWayEShowrooms]
ADD CONSTRAINT [FK_NewWaySaleStatusNewWayEShowroom]
    FOREIGN KEY ([SaleStatusId])
    REFERENCES [dbo].[NewWaySaleStatus]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewWaySaleStatusNewWayEShowroom'
CREATE INDEX [IX_FK_NewWaySaleStatusNewWayEShowroom]
ON [dbo].[NewWayEShowrooms]
    ([SaleStatusId]);
GO

-- Creating foreign key on [EShowroomId] in table 'NewWayEShowPhotos'
ALTER TABLE [dbo].[NewWayEShowPhotos]
ADD CONSTRAINT [FK_NewWayEShowPhotosNewWayEShowroom]
    FOREIGN KEY ([EShowroomId])
    REFERENCES [dbo].[NewWayEShowrooms]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewWayEShowPhotosNewWayEShowroom'
CREATE INDEX [IX_FK_NewWayEShowPhotosNewWayEShowroom]
ON [dbo].[NewWayEShowPhotos]
    ([EShowroomId]);
GO

-- Creating foreign key on [CapacityId] in table 'NewWayEShowrooms'
ALTER TABLE [dbo].[NewWayEShowrooms]
ADD CONSTRAINT [FK_NewWayCapacityNewWayEShowroom]
    FOREIGN KEY ([CapacityId])
    REFERENCES [dbo].[NewWayCapacities]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewWayCapacityNewWayEShowroom'
CREATE INDEX [IX_FK_NewWayCapacityNewWayEShowroom]
ON [dbo].[NewWayEShowrooms]
    ([CapacityId]);
GO

-- Creating foreign key on [ServiceSupportTypeId] in table 'ServiceSupportManuals'
ALTER TABLE [dbo].[ServiceSupportManuals]
ADD CONSTRAINT [FK_ServiceSupportTypeServiceSupportManual]
    FOREIGN KEY ([ServiceSupportTypeId])
    REFERENCES [dbo].[ServiceSupportTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ServiceSupportTypeServiceSupportManual'
CREATE INDEX [IX_FK_ServiceSupportTypeServiceSupportManual]
ON [dbo].[ServiceSupportManuals]
    ([ServiceSupportTypeId]);
GO

-- Creating foreign key on [NewWayModelId] in table 'ServiceSupportTrucks'
ALTER TABLE [dbo].[ServiceSupportTrucks]
ADD CONSTRAINT [FK_NewWayModelServiceSupportTruck]
    FOREIGN KEY ([NewWayModelId])
    REFERENCES [dbo].[NewWayModels]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewWayModelServiceSupportTruck'
CREATE INDEX [IX_FK_NewWayModelServiceSupportTruck]
ON [dbo].[ServiceSupportTrucks]
    ([NewWayModelId]);
GO

-- Creating foreign key on [ServiceSupportTrucks_Id] in table 'ServiceSupportTruckServiceSupportManual'
ALTER TABLE [dbo].[ServiceSupportTruckServiceSupportManual]
ADD CONSTRAINT [FK_ServiceSupportTruckServiceSupportManual_ServiceSupportTruck]
    FOREIGN KEY ([ServiceSupportTrucks_Id])
    REFERENCES [dbo].[ServiceSupportTrucks]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ServiceSupportManuals_Id] in table 'ServiceSupportTruckServiceSupportManual'
ALTER TABLE [dbo].[ServiceSupportTruckServiceSupportManual]
ADD CONSTRAINT [FK_ServiceSupportTruckServiceSupportManual_ServiceSupportManual]
    FOREIGN KEY ([ServiceSupportManuals_Id])
    REFERENCES [dbo].[ServiceSupportManuals]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ServiceSupportTruckServiceSupportManual_ServiceSupportManual'
CREATE INDEX [IX_FK_ServiceSupportTruckServiceSupportManual_ServiceSupportManual]
ON [dbo].[ServiceSupportTruckServiceSupportManual]
    ([ServiceSupportManuals_Id]);
GO

-- Creating foreign key on [InquiryTypeId] in table 'WebsiteInquiries'
ALTER TABLE [dbo].[WebsiteInquiries]
ADD CONSTRAINT [FK_InquiryTypeWebsiteInquiry]
    FOREIGN KEY ([InquiryTypeId])
    REFERENCES [dbo].[InquiryTypes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InquiryTypeWebsiteInquiry'
CREATE INDEX [IX_FK_InquiryTypeWebsiteInquiry]
ON [dbo].[WebsiteInquiries]
    ([InquiryTypeId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------