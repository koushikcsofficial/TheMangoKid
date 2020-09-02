USE [master]
GO
/****** Object:  Database [TheMangoKid]    Script Date: 03-09-2020 02:48:08 ******/
CREATE DATABASE [TheMangoKid]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TheMangoKid', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TheMangoKid.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TheMangoKid_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TheMangoKid_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TheMangoKid] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TheMangoKid].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TheMangoKid] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TheMangoKid] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TheMangoKid] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TheMangoKid] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TheMangoKid] SET ARITHABORT OFF 
GO
ALTER DATABASE [TheMangoKid] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TheMangoKid] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TheMangoKid] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TheMangoKid] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TheMangoKid] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TheMangoKid] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TheMangoKid] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TheMangoKid] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TheMangoKid] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TheMangoKid] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TheMangoKid] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TheMangoKid] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TheMangoKid] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TheMangoKid] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TheMangoKid] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TheMangoKid] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TheMangoKid] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TheMangoKid] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TheMangoKid] SET  MULTI_USER 
GO
ALTER DATABASE [TheMangoKid] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TheMangoKid] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TheMangoKid] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TheMangoKid] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TheMangoKid] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TheMangoKid] SET QUERY_STORE = OFF
GO
USE [TheMangoKid]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [uniqueidentifier] NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Account_Creation_Date] [datetime] NOT NULL,
	[Account_Status] [tinyint] NOT NULL,
	[Account_Role] [int] NULL,
 CONSTRAINT [PK_dbo.Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[Id] [uniqueidentifier] NOT NULL,
	[Album_Name] [varchar](50) NOT NULL,
	[Album_Creation_Date] [datetime] NOT NULL,
	[Total_Track] [int] NOT NULL,
	[Submitted_Track] [int] NOT NULL,
	[PurchaseTrack_RefNo] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.Album] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlbumTrackMaster]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumTrackMaster](
	[Id] [uniqueidentifier] NOT NULL,
	[Album_Id] [uniqueidentifier] NOT NULL,
	[Track_Id] [uniqueidentifier] NOT NULL,
	[Submitted_At] [datetime] NOT NULL,
	[StoreSubmissionStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_dbo.AlbumTrackMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArtworkDetail]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArtworkDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Artwork_Link] [varchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.ArtworkDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankDetail]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankDetail](
	[Id] [uniqueidentifier] NOT NULL,
	[Account_Id] [uniqueidentifier] NULL,
	[PayeeFirstName] [varchar](50) NULL,
	[PayeeLastName] [varchar](50) NULL,
	[PayeeBankName] [varchar](max) NULL,
	[PayeeBankIfscNumber] [varchar](50) NULL,
	[PayeeBankBranch] [varchar](max) NULL,
	[PayeeBankAccountNumber] [varchar](50) NULL,
	[Detail_Submitted_At] [datetime] NULL,
 CONSTRAINT [PK_dbo.BankDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Coupon_Code] [varchar](50) NOT NULL,
	[Generated_At] [datetime] NOT NULL,
	[Expire_At] [datetime] NOT NULL,
	[Discount_Percentage] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Created_By] [uniqueidentifier] NULL,
	[TobeAppliedOnCategory] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.Coupon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EpTrackMaster]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EpTrackMaster](
	[Id] [uniqueidentifier] NOT NULL,
	[Ep_Id] [uniqueidentifier] NOT NULL,
	[Track_Id] [uniqueidentifier] NOT NULL,
	[Submitted_At] [datetime] NOT NULL,
	[StoreSubmissionStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_dbo.EpTrackMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExtendedPlay]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtendedPlay](
	[Id] [uniqueidentifier] NOT NULL,
	[Ep_Name] [varchar](50) NOT NULL,
	[Ep_Creation_Date] [datetime] NOT NULL,
	[Total_Track] [int] NOT NULL,
	[Submitted_Track] [int] NOT NULL,
	[PurchaseTrack_RefNo] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_dbo.ExtendedPlay] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceInfo]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category_Name] [varchar](50) NOT NULL,
	[BasePrice] [decimal](18, 2) NOT NULL,
	[Gst] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.PriceInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseRecord]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseRecord](
	[Id] [uniqueidentifier] NOT NULL,
	[Account_Id] [uniqueidentifier] NULL,
	[Purchased_Category] [varchar](15) NULL,
	[PurchaseDate] [datetime] NULL,
	[Usage_Date] [datetime] NULL,
	[Usage_Exp_Date] [datetime] NULL,
	[CouponCodeApplied] [int] NULL,
 CONSTRAINT [PK_dbo.PurchaseRecord] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SingleTrackDetail]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SingleTrackDetail](
	[Id] [uniqueidentifier] NOT NULL,
	[TrackTitle] [varchar](50) NULL,
	[ArtistName] [text] NULL,
	[ArtistAlreadyInSpotify] [tinyint] NULL,
	[ArtistSpotifyUrl] [varchar](max) NULL,
	[ReleaseDate] [date] NULL,
	[Genre] [varchar](50) NULL,
	[CopyrightClaimerName] [varchar](50) NULL,
	[AuthorName] [varchar](50) NULL,
	[ComposerName] [varchar](50) NULL,
	[ArrangerName] [varchar](50) NULL,
	[ProducerName] [varbinary](50) NULL,
	[AlreadyHaveAnISRC] [tinyint] NULL,
	[ISRC_Number] [varchar](50) NULL,
	[PriceTier] [int] NULL,
	[ExplicitContent] [tinyint] NULL,
	[IsTrackInstrumental] [tinyint] NULL,
	[LyricsLanguage] [varchar](50) NULL,
	[TrackZipFileLink] [text] NULL,
	[Artwork_Id] [int] NULL,
 CONSTRAINT [PK_dbo.SingleTrackDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoloTrackMaster]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoloTrackMaster](
	[Id] [uniqueidentifier] NOT NULL,
	[Track_Id] [uniqueidentifier] NOT NULL,
	[PurchaseTrack_RefNo] [uniqueidentifier] NOT NULL,
	[Submitted_At] [datetime] NOT NULL,
	[StoreSubmissionStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_dbo.SoloTrackMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetail]    Script Date: 03-09-2020 02:48:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetail](
	[User_Account_Id] [uniqueidentifier] NOT NULL,
	[User_First_Name] [varchar](50) NOT NULL,
	[User_Last_Name] [varchar](50) NOT NULL,
	[User_Mobile_Number] [varchar](13) NOT NULL,
	[User_Address] [text] NOT NULL,
 CONSTRAINT [PK_dbo.UserDetail] PRIMARY KEY CLUSTERED 
(
	[User_Account_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Account_Role]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_Account_Role] ON [dbo].[Account]
(
	[Account_Role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseTrack_RefNo]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseTrack_RefNo] ON [dbo].[Album]
(
	[PurchaseTrack_RefNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Album_Id]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_Album_Id] ON [dbo].[AlbumTrackMaster]
(
	[Album_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Track_Id]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_Track_Id] ON [dbo].[AlbumTrackMaster]
(
	[Track_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Account_Id]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_Account_Id] ON [dbo].[BankDetail]
(
	[Account_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Created_By]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_Created_By] ON [dbo].[Coupon]
(
	[Created_By] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Ep_Id]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_Ep_Id] ON [dbo].[EpTrackMaster]
(
	[Ep_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Track_Id]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_Track_Id] ON [dbo].[EpTrackMaster]
(
	[Track_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseTrack_RefNo]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseTrack_RefNo] ON [dbo].[ExtendedPlay]
(
	[PurchaseTrack_RefNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Account_Id]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_Account_Id] ON [dbo].[PurchaseRecord]
(
	[Account_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CouponCodeApplied]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_CouponCodeApplied] ON [dbo].[PurchaseRecord]
(
	[CouponCodeApplied] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Artwork_Id]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_Artwork_Id] ON [dbo].[SingleTrackDetail]
(
	[Artwork_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PurchaseTrack_RefNo]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_PurchaseTrack_RefNo] ON [dbo].[SoloTrackMaster]
(
	[PurchaseTrack_RefNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Track_Id]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_Track_Id] ON [dbo].[SoloTrackMaster]
(
	[Track_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Account_Id]    Script Date: 03-09-2020 02:48:08 ******/
CREATE NONCLUSTERED INDEX [IX_User_Account_Id] ON [dbo].[UserDetail]
(
	[User_Account_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Account_dbo.Role_Account_Role] FOREIGN KEY([Account_Role])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_dbo.Account_dbo.Role_Account_Role]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Album_dbo.PurchaseRecord_PurchaseTrack_RefNo] FOREIGN KEY([PurchaseTrack_RefNo])
REFERENCES [dbo].[PurchaseRecord] ([Id])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_dbo.Album_dbo.PurchaseRecord_PurchaseTrack_RefNo]
GO
ALTER TABLE [dbo].[AlbumTrackMaster]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AlbumTrackMaster_dbo.Album_Album_Id] FOREIGN KEY([Album_Id])
REFERENCES [dbo].[Album] ([Id])
GO
ALTER TABLE [dbo].[AlbumTrackMaster] CHECK CONSTRAINT [FK_dbo.AlbumTrackMaster_dbo.Album_Album_Id]
GO
ALTER TABLE [dbo].[AlbumTrackMaster]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AlbumTrackMaster_dbo.SingleTrackDetail_Track_Id] FOREIGN KEY([Track_Id])
REFERENCES [dbo].[SingleTrackDetail] ([Id])
GO
ALTER TABLE [dbo].[AlbumTrackMaster] CHECK CONSTRAINT [FK_dbo.AlbumTrackMaster_dbo.SingleTrackDetail_Track_Id]
GO
ALTER TABLE [dbo].[BankDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.BankDetail_dbo.Account_Account_Id] FOREIGN KEY([Account_Id])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[BankDetail] CHECK CONSTRAINT [FK_dbo.BankDetail_dbo.Account_Account_Id]
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Coupon_dbo.Account_Created_By] FOREIGN KEY([Created_By])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Coupon] CHECK CONSTRAINT [FK_dbo.Coupon_dbo.Account_Created_By]
GO
ALTER TABLE [dbo].[EpTrackMaster]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EpTrackMaster_dbo.ExtendedPlay_Ep_Id] FOREIGN KEY([Ep_Id])
REFERENCES [dbo].[ExtendedPlay] ([Id])
GO
ALTER TABLE [dbo].[EpTrackMaster] CHECK CONSTRAINT [FK_dbo.EpTrackMaster_dbo.ExtendedPlay_Ep_Id]
GO
ALTER TABLE [dbo].[EpTrackMaster]  WITH CHECK ADD  CONSTRAINT [FK_dbo.EpTrackMaster_dbo.SingleTrackDetail_Track_Id] FOREIGN KEY([Track_Id])
REFERENCES [dbo].[SingleTrackDetail] ([Id])
GO
ALTER TABLE [dbo].[EpTrackMaster] CHECK CONSTRAINT [FK_dbo.EpTrackMaster_dbo.SingleTrackDetail_Track_Id]
GO
ALTER TABLE [dbo].[ExtendedPlay]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ExtendedPlay_dbo.PurchaseRecord_PurchaseTrack_RefNo] FOREIGN KEY([PurchaseTrack_RefNo])
REFERENCES [dbo].[PurchaseRecord] ([Id])
GO
ALTER TABLE [dbo].[ExtendedPlay] CHECK CONSTRAINT [FK_dbo.ExtendedPlay_dbo.PurchaseRecord_PurchaseTrack_RefNo]
GO
ALTER TABLE [dbo].[PurchaseRecord]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PurchaseRecord_dbo.Account_Account_Id] FOREIGN KEY([Account_Id])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[PurchaseRecord] CHECK CONSTRAINT [FK_dbo.PurchaseRecord_dbo.Account_Account_Id]
GO
ALTER TABLE [dbo].[PurchaseRecord]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PurchaseRecord_dbo.Coupon_CouponCodeApplied] FOREIGN KEY([CouponCodeApplied])
REFERENCES [dbo].[Coupon] ([Id])
GO
ALTER TABLE [dbo].[PurchaseRecord] CHECK CONSTRAINT [FK_dbo.PurchaseRecord_dbo.Coupon_CouponCodeApplied]
GO
ALTER TABLE [dbo].[SingleTrackDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SingleTrackDetail_dbo.ArtworkDetail_Artwork_Id] FOREIGN KEY([Artwork_Id])
REFERENCES [dbo].[ArtworkDetail] ([Id])
GO
ALTER TABLE [dbo].[SingleTrackDetail] CHECK CONSTRAINT [FK_dbo.SingleTrackDetail_dbo.ArtworkDetail_Artwork_Id]
GO
ALTER TABLE [dbo].[SoloTrackMaster]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SoloTrackMaster_dbo.PurchaseRecord_PurchaseTrack_RefNo] FOREIGN KEY([PurchaseTrack_RefNo])
REFERENCES [dbo].[PurchaseRecord] ([Id])
GO
ALTER TABLE [dbo].[SoloTrackMaster] CHECK CONSTRAINT [FK_dbo.SoloTrackMaster_dbo.PurchaseRecord_PurchaseTrack_RefNo]
GO
ALTER TABLE [dbo].[SoloTrackMaster]  WITH CHECK ADD  CONSTRAINT [FK_dbo.SoloTrackMaster_dbo.SingleTrackDetail_Track_Id] FOREIGN KEY([Track_Id])
REFERENCES [dbo].[SingleTrackDetail] ([Id])
GO
ALTER TABLE [dbo].[SoloTrackMaster] CHECK CONSTRAINT [FK_dbo.SoloTrackMaster_dbo.SingleTrackDetail_Track_Id]
GO
ALTER TABLE [dbo].[UserDetail]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserDetail_dbo.Account_User_Account_Id] FOREIGN KEY([User_Account_Id])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[UserDetail] CHECK CONSTRAINT [FK_dbo.UserDetail_dbo.Account_User_Account_Id]
GO
USE [master]
GO
ALTER DATABASE [TheMangoKid] SET  READ_WRITE 
GO
