USE [master]
GO
/****** Object:  Database [TLTY]    Script Date: 9/18/2017 9:17:54 PM ******/
CREATE DATABASE [TLTY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TLTY', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TLTY.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TLTY_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\TLTY_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TLTY] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TLTY].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TLTY] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TLTY] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TLTY] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TLTY] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TLTY] SET ARITHABORT OFF 
GO
ALTER DATABASE [TLTY] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TLTY] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TLTY] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TLTY] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TLTY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TLTY] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TLTY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TLTY] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TLTY] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TLTY] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TLTY] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TLTY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TLTY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TLTY] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TLTY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TLTY] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TLTY] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TLTY] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TLTY] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TLTY] SET  MULTI_USER 
GO
ALTER DATABASE [TLTY] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TLTY] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TLTY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TLTY] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [TLTY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 9/18/2017 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Account]    Script Date: 9/18/2017 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[AccountGroupID] [nvarchar](50) NULL,
	[FirstName] [nvarchar](250) NOT NULL,
	[LastName] [nvarchar](250) NULL,
	[Birthday] [date] NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[Avatar] [nvarchar](250) NULL,
	[Address] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountGroup]    Script Date: 9/18/2017 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountGroup](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_dbo.AccountGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 9/18/2017 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NULL,
 CONSTRAINT [PK_dbo.Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 9/18/2017 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[ViewCount] [int] NULL,
	[Detail] [ntext] NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Images] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
	[Category] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Content] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 9/18/2017 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [ntext] NOT NULL,
 CONSTRAINT [PK_dbo.Feedback] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupPath]    Script Date: 9/18/2017 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupPath](
	[AccountGroupID] [nvarchar](50) NOT NULL,
	[PathID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.GroupPath] PRIMARY KEY CLUSTERED 
(
	[AccountGroupID] ASC,
	[PathID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Instruction]    Script Date: 9/18/2017 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instruction](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[Detail] [ntext] NOT NULL,
	[Images] [nvarchar](250) NULL,
	[MoreImages] [xml] NULL,
 CONSTRAINT [PK_dbo.Instruction] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Path]    Script Date: 9/18/2017 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Path](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](250) NULL,
 CONSTRAINT [PK_dbo.Path] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request]    Script Date: 9/18/2017 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](250) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
	[ContentID] [bigint] NULL,
	[Detail] [ntext] NULL,
	[MoreImages] [xml] NULL,
 CONSTRAINT [PK_dbo.Request] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slider]    Script Date: 9/18/2017 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[DisplayOrder] [int] NOT NULL,
	[Link] [nvarchar](500) NULL,
	[ContentID] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_dbo.Slider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ticker]    Script Date: 9/18/2017 9:17:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticker](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CreateDate] [datetime] NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[Type] [bit] NOT NULL,
	[Quantity] [bigint] NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_dbo.Ticker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201709150801138_InitialCreate', N'EntityModel.EF.TLTYDBContext', 0x1F8B0800000000000400ED5CDD6EE3B815BE2FD077107459CC5A49A65B6C037B17192759049D4CD2383B68AF06B4C438C4E8C72B51D918459F6C2FF691FA0AA5244A22254A2225DAB233C6008398D2F948F1FC923C3CFFFBFD8FE94FAF9E6BBCC03042813F334F2727A6017D3B7090BF9A99317EFAEE07F3A71FFFFCA7E995E3BD1A9FF3F7DE27EF114A3F9A99CF18AFCF2D2BB29FA107A28987EC308882273CB103CF024E609D9D9CFCDD3A3DB52081300996614C1F621F230FA63FC8CF79E0DB708D63E0DE060E7423DA4E9E2C5254E313F060B406369C995784126FD2F72657D7A671E1224046B180EE936900DF0F30C0648CE7BF447081C3C05F2DD6A401B88F9B3524EF3D01378274ECE7E5EBB29F7172967C865512E650761CE1C053043C7D4FE7C5AA92F79A5DB398373273D93C255F9DCEDECCBCB0ED804CFBCF6110AF4DA3DAE1F9DC0D9397AB133C61C9DE19CCC377853810A949FEBD33E6B18BE310CE7C18E3109037EEE3A58BEC7FC0CD63F015FA333F765D76906498E419D7409AEEC3600D43BC79804F74E83797A661F1745695B0206368B20F226240A4D9346EC1EB47E8AFF0F3CCFC9E88EF357A854EDE40C5E2171F11D92734388CC9CF4F64BC60E9C2E2B9D5DA65F27F4BA76792BD563AF9045ED02AE551A53BCA99C8341EA09BBE103DA375A60A39DBBEF05CBF0E03EF21704B62EEF9974710AE20269F10B4BCB408E2D0AE0C736A95E2262384EAF27798A277E3E3BFFD552047CC772F7010C29FA10F4380A1730F308621B11E370E4CBFB74BE688990B35C99DA2B4DF8328FA2D089DDDF7CC8AA30E356FEFED1A85111E678A3F026D3DB777F40185F8D9019BBCA34B228B8FC8531FF19507903B822C3E077EDB2C9D7EAF61922E5E0006E1D67971E138218CA256B1D6D1CF3C8484CB09A7EB5C6FA75C10D3151703FC10105F01FC6E9E753932EAA37439B3DC4FB53AB3DCE3F57266246CC5C056716694E2609DD9FBB3AD3AB3369154B408E3F9C59EDAA16C05F4589B2ECBA9A5135D5EA1B79642A59093521CAC966E39E41C47AD6E21068F08BBDB0F868E56A840F98CE06FF36CC1C6F98076AA4BC2AA567D277F6EE39B2F616487689DED9F0C8E9E143BBFF1C00A6EDF5EDF12D5EDEC4A767E3BF48048FD2A08376A42246D97AF217496C0FEAA60987392A36516F7358EA979CB6B3E8DBE408F4596B3715A0CACB426A74B2922ACCF0AAA5CD08CA5CBD54D24AB9B24196E1F13A07BBF4A79A32E1BF656BB9516961B3F22707626C0D2E2C2501D8DBFB8AF718CFF31581E3DEC3DF4C853DA7428BA9831BDCBB77B6229CDCD07F86B0C23957D194A71983CDDFEEEE948C78087B481389E73D3E362E8CE642DACD89163DA7707B170910343058B92111CAC411937A2D4730C7989A2B50B367761CAB9765BD9715A8EFCAFDB3F356DD0C063D8BCDD1D8D3EDC93B61B8FC8FEAA64373282A3DDE865378EA7349A3528A11E8AF1CF1850DE2A0416F721B2CBE98736F2000933EE43F217CD27FEC1341636484671720086E1228A021BA53AC06FDDF19927FCA8AF7CC7904943C93E804967219F410C045A139340C63233FF529B900EE8225DB3064D336478FC93C9E4B4D605B12A304CD41AB8C4B545C44E211FD74D10F26DB406AEC4682AB492062CE149D14BF5C9255C433FB13D12F32CD37DE7D6AF55F458B1B25DB335B51811AABB9C34FD0711B39A2BEEC7C77F5F7E48438A57D142981826EA81222AC655F9485017100B3E8C589552C885D251133621580B4E27044D77124114B9531210503C8A22B1A303223F3514619487901D20C5798508853900E98061F6B14540DCE6780754D360A4C641B75244F4C5BE4C0744B6761221E4CBB00E802C881201E4F1580580D1AD9A985672039957DB7208AB8A2F69CB8B2F61B5A4664524AD771D2CD7DF6A8CC77FBFC09F15F6A57836B5B21B34B4616A355CB599DE82F59AB856E6EA0D6D3116D9BD9BF9770BF54B295E8661D991E06E4A31DAA22712768215AC3C4D6C8003D32C6C12E18125489CFBDCF16AAFF1D6B441F6F2BE4406B3CEC05C2E73AAE46FBA23D57C4B46E08328FD35F93C2FF1636980DDC0F83AB991DC83022E080531FD3C7063CF6F76ABCDD459C4CBD2672D7584A955197FCD5FD666AA22B9D5E957618E0EBEF467C9AEB851AE41588CB2551EA9BC97C12295ADF248D53889C5EB8AA19A5199FB142C20D32C8F555E9060A1CA5679A4F206048B54B6CA23D1BD6A16863629F030DB54E718983529708F5E57E0B846DB1450F23C640E266F94C76197EB2C14DB2E8F96AF9B59A4BC6D6FEC5711FD0EB05F7998AC6EBF1A29B763BFF4F2579F355493946D6B810EBD56B12F234A3E1CE8B9F3D55D3FC917528E1D47352130A9ED2C0CD37CD4C38C82C9476781986679ACFC549405CADB5450984D4A1E8A79208F971FA072F248DB14248A398AE5448A695790A922119C93A8A2756FEC4EB9D333C0F0145B42EA96A799745F4DCFBE04AB638687BA557B24E167762807487FB995A92EFE2DB4BB5D62E619CFFC025894BC3D22BFB8ADE0011C63F78CD579D64ABDAF56EB6D07397A029331038991346AB0F1EB69F7D44CDE1BDFB52D4E9606F0213F8252674523E5D8DCD8971D81430AC0985C3B6E4865F3AE8DEA4199C3FC80768022D2935C753D6C22DC5735E4B3503921E19E281C4DA4D9A8DCB144DA328EF8BFF588E9A0566A79E2C300C5A41912EA8AD944B8AF8AF9B60537CBDC6431B2167984326F9345295B1522912C99938B44B2A60357C45A764CF595A277DA52FC2EB26368664A7775DA5AAA4AF64A92141BBC242E9148C926C2D09B242F4C16BFBA7317A5496CF90BB7C0474F2484CD52C4CDB393D3B34A91DBFD29386B4591C365B077549DE579B6835C77FF0584F67372E25DB99136E09EA410F38C071D7017419877B28BB95AA2154A04B133F97F6076BDCCFCF52A40AA0D585CAFA184AFE5E9DEF80E7C9D99FF49E9CF8D9B7F7DE121DE1969F8786E9C18FF6D11C55ED548B57D75B5D8683F39AFE3566B8B3AA9CF1E5263469F04B1775785A8491119B5CFE5AB84EA9AC44A39C006BBA60C5BBF44937007572ED1C820F137599608EBAA1722CC63D9853DDC8A31949BF071EDAA2A2BFB496B0F25E85657754C65C3A2A112E59B71ED5B11BF5AA1475DE2F36DE85EAD6463CA79B599E20B06D0DB49C36FEFC978AD1E156F74C947BD7E015912290B59A568A2464F28CE2E39DA8F830D15351AA4E17643A4AF128ADFA348600FF11DBD589FAE8D04BE165F3FD45EA5F68E36E3181AE870EB7BE37AD5AAC61D771EE50BB2BD8D95F676B61CF76105BA6B8B36DCF0D48A26E5CE41EBB2646C4323CA7978D39EB6C786A3A8DA574512946B7D69DB0CED96D2633031747D3FBC4AD7B7A35FC73DAE06842C49A23F7DB5D8553F77C455BF727650FD4AAF7EE9297645EBAD6403EC5782AA86D9AF58D6904A564D753B644C89D1A374D56195A9AAD75FA932902FECC34B40297D4201C9126488022D03C2F74C88FBD4A96A2B53D5D247277C51A8AA065F3C11C12BD6B76A2B6FD5040F156A5FB596BE1275A05E18ABBD2E96A88F5E65B3BAAA66893A522DABD558554B04AE526FABADDC96085BAD16574B292E11B85299AE962A5D22ECFDA9E0C559A17AB1A5BA5515B8A33A713D9ED4519CAB9E66486C39E98D846FD92F1214A055093125983EB4392B5EBC73E33F05B953A98C287F4570F24AC245701162F4448C17796CC3284A2B6E7E066E9C6E562CA173E3DFC5781D63F2C9D05BBA5C9669E294DAFA4F2B90F1639EDEA5514EA4E313C8305112F1DEF91F62E43AC5B8AF05DBE80D1089B7A3517EC24B9C44FBAB4D81F4A97639A709884E5FE1A41FA147D6BE184677FE02BCC03E632331F947B802F626CF166D06E966043FEDD34B045621F0228A51D2939F44861DEFF5C7FF0379BA65E931820000, N'6.1.3-40302')
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [UserName], [Password], [AccountGroupID], [FirstName], [LastName], [Birthday], [Email], [Phone], [Avatar], [Address], [CreateDate], [Status]) VALUES (1, N'admin', N'e00cf25ad42683b3df678c61f42c6bda', N'ADMIN', N'Vinh', N'Sang Khánh', CAST(N'1995-01-01' AS Date), N'khanhvinhit@gmail.com', N'01634141300', N'/DATA/images/Avatar/10l.jpg', N'Đà Lạt', CAST(N'2017-09-15 00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[AccountGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[AccountGroup] ([ID], [Name]) VALUES (N'MEMBER', N'Thành viên')
INSERT [dbo].[AccountGroup] ([ID], [Name]) VALUES (N'MOD', N'Điều hành')
INSERT [dbo].[AccountGroup] ([ID], [Name]) VALUES (N'SERVICES', N'Chăm sóc khách hàng')
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [CreateDate], [UserName], [Status], [Address], [Phone], [Email]) VALUES (1, CAST(N'2017-09-15 00:00:00.000' AS DateTime), N'admin', 1, N'Thung Lũng Tình Yêu', N'123456', N'khanhvinhit@gmail.com')
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (1, N'VẬN CHUYỂN TRONG KHU DU LỊCH', N'VAN-CHUYEN-TRONG-KHU-DU-LICH', CAST(N'2017-09-15 00:00:00.000' AS DateTime), N'admin', 1, 18, N'<p>Tr&ecirc;n Cao nguy&ecirc;n với độ cao hơn 1500m so với mặt nước biển, du kh&aacute;ch vẫn c&oacute; thể du ngoạn bằng xe Lửa cổ, xe Jeep, xe Điện<strong>.&nbsp;</strong>H&agrave;nh tr&igrave;nh tham quan bắt đầu từ Khu Trung t&acirc;m, đi qua những con đường quanh co rợp b&oacute;ng m&aacute;t sẽ đưa du kh&aacute;ch đến Cầu kh&oacute;a T&igrave;nh y&ecirc;u, V&ograve;i nước tr&ecirc;n kh&ocirc;ng, Phố hoa, tham quan Vườn Ươm, Thung lũng hoa Cẩm T&uacute; Cầu. Đặc biệt l&agrave; tham quan &ldquo;Đồi Vọng Cảnh&rdquo; &ndash;&nbsp;nơi c&oacute; vườn bon sai với nhiều c&acirc;y kiểng qu&yacute; hiếm, Vườn T&igrave;nh nh&acirc;n, Tiểu cảnh Adam &amp; Eva&hellip; c&ugrave;ng với Linh vật Rồng &ndash; C&ocirc;ng (được chế t&aacute;c bằng đ&aacute; qu&yacute;, mạ v&agrave;ng) với ước muốn người đến tham quan sẽ gặp được nhiều điều may mắn trong cuộc sống v&agrave; th&agrave;nh đạt trong kinh doanh. Từ đ&acirc;y, du kh&aacute;ch c&oacute; thể ph&oacute;ng tầm mắt bao qu&aacute;t, ngắm to&agrave;n cảnh TTC World &ndash; Thung lũng T&igrave;nh Y&ecirc;u ngập&nbsp;tr&agrave;n&nbsp;hoa. Du kh&aacute;ch sẽ được tham quan trong khoảng thời gian k&eacute;o d&agrave;i 30 ph&uacute;t, sau đ&oacute; xe sẽ đ&oacute;n du kh&aacute;ch về lại Khu Trung t&acirc;m &ndash; kết th&uacute;c cuộc h&agrave;nh tr&igrave;nh.</p>
', N'Trên Cao nguyên với độ cao hơn 1500m so với mặt nước biển, du khách vẫn có thể du ngoạn bằng xe Lửa cổ, xe Jeep, xe Điện.', N'/DATA/images/Instruction/2.jpg', N'<Images><Image>/DATA/images/Slider/XE-DIEN.jpg</Image><Image>/DATA/images/Slider/XE-LUA.jpg</Image></Images>', 0)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (2, N'TRÒ CHƠI VẬN ĐỘNG', N'TRO-CHOI-VAN-DONG', CAST(N'2017-09-18 00:00:00.000' AS DateTime), N'admin', 1, 4, N'<p><em><strong>Highwire&nbsp;</strong>&ndash;</em>&nbsp;tr&ograve; chơi thể thao cảm gi&aacute;c mạnh đ&atilde; xuất hiện l&acirc;u ở c&aacute;c nước ch&acirc;u &Acirc;u nhưng vẫn c&ograve;n lạ lẫm tại Việt Nam đ&atilde; c&oacute; mặt tại TTC World &ndash;&nbsp;Thung lũng T&igrave;nh y&ecirc;u.&nbsp;<em><strong>Highwire&nbsp;</strong></em>l&agrave; tr&ograve; chơi ngo&agrave;i trời được cấu tạo bởi nhiều tấm gỗ gắn tr&ecirc;n sợi c&aacute;p v&agrave; buộc v&agrave;o c&acirc;y to. Điểm th&uacute; vị nhất của tr&ograve; chơi n&agrave;y l&agrave; qu&yacute; kh&aacute;ch sẽ phải vượt l&ecirc;n ch&iacute;nh sự sợ h&atilde;i của m&igrave;nh để chinh phục c&aacute;c thử th&aacute;ch ở độ cao 9m so với mặt đất.</p>

<p><em><strong>Highwire</strong></em>&nbsp;c&oacute; 2 chặng với mức độ từ dễ tới kh&oacute;. Tổng chiều d&agrave;i tr&ecirc;n 250m, được l&agrave;m từ 850 cấu kiện gỗ, gồm 21 thử th&aacute;ch. Gồm 02 chặng:</p>

<p><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&ndash; Chặng thứ nhất:</em>&nbsp;được thiết kế để trẻ em cao tr&ecirc;n 1,1m c&oacute; thể trải nghiệm v&agrave; ho&agrave;n thiện kỹ năng bản th&acirc;n</p>

<p><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</em><em>&ndash; Chặng thứ hai:</em>&nbsp;đ&ograve;i hỏi độ tập trung cao với nhiều thử th&aacute;ch kh&oacute; d&agrave;nh cho người lớn như: vượt qua &ldquo;Cầu d&acirc;y văng&rdquo;; &ldquo; Cầu d&acirc;y v&otilde;ng&rdquo;; chinh phục &ldquo;Ống tử thần&rdquo;; &ldquo;V&aacute;ch ngăn khổng lồ&rdquo;&hellip;</p>

<p>Thử th&aacute;ch lớn nhất đối với người chơi ch&iacute;nh l&agrave; tr&ograve; chơi&nbsp;<em><strong>&ldquo;Đu d&acirc;y mạo hiểm tự do &ndash; Zipline&rdquo;</strong></em>&nbsp;với hệ thống c&aacute;p bắt đầu từ độ cao 9m, băng qua một qu&atilde;ng đường rừng th&ocirc;ng d&agrave;i. Qu&yacute; kh&aacute;ch sẽ phải chinh phục cảm gi&aacute;c sợ h&atilde;i độ cao của những chướng ngại vật l&agrave;m mất thăng bằng, tạo cảm gi&aacute;c th&uacute; vị cho Qu&yacute; kh&aacute;ch khi tham gia.</p>
', N'Highwire – trò chơi thể thao cảm giác mạnh đã xuất hiện lâu ở các nước châu Âu nhưng vẫn còn lạ lẫm tại Việt Nam đã có mặt tại TTC World – Thung lũng Tình yêu.', N'/DATA/images/Instruction/4.jpg', N'<Images><Image>/DATA/images/Express/IMG_1546.jpg</Image><Image>/DATA/images/Express/IMG_1651.jpg</Image></Images>', 0)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (3, N'CANO – PEDALO', N'CANO-–-PEDALO', CAST(N'2017-09-18 00:00:00.000' AS DateTime), N'admin', 1, 0, N'<p>Đ&acirc;y l&agrave; dịch vụ vui chơi giải tr&iacute; hấp dẫn kh&ocirc;ng thể bỏ qua tại Thung lũng T&igrave;nh y&ecirc;u. Với mặt hồ rộng tho&aacute;ng, kh&ocirc;ng kh&iacute; m&aacute;t mẻ, cảnh sắc tuyệt mỹ, Qu&yacute; kh&aacute;ch sẽ trải qua những gi&acirc;y ph&uacute;t bồng bềnh tr&ecirc;n Cano, Pedalo tham quan một v&ograve;ng hồ Đa Thiện với khung cảnh thi&ecirc;n nhi&ecirc;n trữ t&igrave;nh, thơ mộng tạo cho du kh&aacute;ch một cảm gi&aacute;c m&aacute;t mẻ sảng kho&aacute;i. Những ph&uacute;t tự t&igrave;nh b&ecirc;n cạnh người y&ecirc;u thương tr&ecirc;n mặt hồ Thung lũng T&igrave;nh y&ecirc;u sẽ đọng lại trong l&ograve;ng du kh&aacute;ch&nbsp;những kỷ niệm kh&oacute; phai.</p>

<p>&nbsp;</p>
', N'Đây là dịch vụ vui chơi giải trí hấp dẫn không thể bỏ qua tại Thung lũng Tình yêu.', N'/DATA/images/Instruction/1.png', N'<Images><Image>/DATA/images/Express/CANO-PEDALO-1.jpg</Image><Image>/DATA/images/Express/CANO-PEDALO.jpg</Image></Images>', 0)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (4, N'GIẢI KHÁT VALLEY D’AMOUR – FASTFOOD', N'GIAI-KHAT-VALLEY-D’AMOUR-–-FASTFOOD', CAST(N'2017-09-18 00:00:00.000' AS DateTime), N'admin', 1, 1, N'<p>Để đ&aacute;p ứng nhu cầu của Du kh&aacute;ch, KDL Thung lũng T&igrave;nh y&ecirc;u đ&atilde; x&acirc;y dựng cửa h&agrave;ng thức ăn nhanh ngay tại khu&ocirc;n vi&ecirc;n trung t&acirc;m, với c&aacute;c m&oacute;n ăn nhanh hấp dẫn như x&uacute;c x&iacute;ch, c&aacute; vi&ecirc;n chi&ecirc;n, b&ograve; vi&ecirc;n chi&ecirc;n, g&agrave; r&aacute;n&hellip; v&agrave; c&aacute;c loại nước uống như c&agrave; ph&ecirc;, tr&agrave;, c&aacute;c loại nước giải kh&aacute;t phục vụ nhu cầu ăn uống của Du kh&aacute;ch khi tham quan tại đ&acirc;y.</p>

<p>&nbsp;</p>
', N'Để đáp ứng nhu cầu của Du khách, KDL Thung lũng Tình yêu đã xây dựng cửa hàng thức ăn nhanh ngay tại khuôn viên trung tâm.', N'/DATA/images/Instruction/1.png', N'<Images><Image>/DATA/images/Express/FASTFOOD.jpg</Image></Images>', 0)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (5, N'HỘI NGHỊ “QUẢNG BÁ, XÚC TIẾN, LIÊN KẾT PHÁT TRIỂN SẢN PHẨM DU LỊCH ĐẶC TRƯNG VÙNG TÂY BẮC 2017”', N'hoi-nghi-“quang-ba-xuc-tien-lien-ket-phat-trien-san-pham-du-lich-dac-trung-vung-tay-bac-2017”', CAST(0x0000A7F200000000 AS DateTime), N'admin', 1, 0, N'<p>Hội nghị<strong>&nbsp;&ldquo;Quảng b&aacute;, x&uacute;c tiến, li&ecirc;n kết ph&aacute;t triển sản phẩm du lịch đặc trưng v&ugrave;ng T&acirc;y Bắc năm 2017&rdquo;</strong>&nbsp;c&oacute; sự tham dự của khoảng 200 đại biểu đại diện: L&atilde;nh đạo c&aacute;c cơ quan Trung ương; l&atilde;nh đạo UBND tỉnh; Sở VHTTDL; Hiệp hội du lịch 14 tỉnh trong v&ugrave;ng T&acirc;y Bắc; c&aacute;c Vụ, Văn ph&ograve;ng, đơn vị thuộc Ban Chỉ đạo T&acirc;y Bắc, Bộ VHTTDL; Hiệp hội Du lịch Việt Nam; Viện Nghi&ecirc;n cứu ph&aacute;t triển du lịch; c&aacute;c doanh nghiệp, tổ chức, chuy&ecirc;n gia hoạt động trong lĩnh vực du lịch, lữ h&agrave;nh trong v&agrave; ngo&agrave;i nước,&hellip;</p>

<p>Hội nghị &ldquo;Quảng b&aacute;, x&uacute;c tiến, li&ecirc;n kết ph&aacute;t triển sản phẩm du lịch đặc trưng v&ugrave;ng T&acirc;y Bắc năm 2017&rdquo; tập trung v&agrave;o c&aacute;c nội dungch&iacute;nh, gồm:</p>

<p>Đ&aacute;nh gi&aacute; thực trạng việc quảng b&aacute;, x&uacute;c tiến, li&ecirc;n kết ph&aacute;t triển sản phẩm du lịch thời gian qua tr&ecirc;n địa b&agrave;n v&ugrave;ng T&acirc;y Bắc; những tồn tại, hạn chế, nguy&ecirc;n nh&acirc;n; b&agrave;n giải ph&aacute;p, đề xuất cơ chế, ch&iacute;nh s&aacute;ch th&uacute;c đẩy quảng b&aacute;, x&uacute;c tiến, li&ecirc;n kết ph&aacute;t triển sản phẩm du lịch đặc trưng v&ugrave;ng T&acirc;y Bắc.</p>

<p>Giới thiệu về một số sản phẩm đ&atilde; c&oacute;; gợi &yacute; giới thiệu v&agrave; b&agrave;n về x&acirc;y dựng một số sản phẩm du lịch mới mang t&iacute;nh li&ecirc;n kết đặc trưng v&ugrave;ng T&acirc;y Bắc (chuỗi sản phẩm li&ecirc;n kết dọc s&ocirc;ng Hồng, s&ocirc;ng L&ocirc;, s&ocirc;ng Đ&agrave; gắn với&nbsp;<em>văn h&oacute;a đặc trưng</em>&nbsp;của c&aacute;c v&ugrave;ng, miền; chinh phục đỉnh cao c&aacute;c c&aacute;nh đồng mang bản sắc của đồng b&agrave;o d&acirc;n tộc Th&aacute;i; văn h&oacute;a ruộng bậc thang; di t&iacute;ch lịch sử&hellip;).</p>

<p>Đối thoại giữa c&aacute;c doanh nghiệp, đơn vị lữ h&agrave;nh với c&aacute;c Bộ, ng&agrave;nh, cơ quan Trung ương, c&aacute;c địa phương nhằm đồng thuận, th&aacute;o gỡ kh&oacute; khăn trong li&ecirc;n kết ph&aacute;t triển sản phẩm du lịch (nhất l&agrave; c&aacute;c tỉnh liền kề theo chỉ dẫn địa l&yacute;, c&aacute;c tiểu v&ugrave;ng v&agrave; mở rộng&hellip;).</p>

<p>B&aacute;o c&aacute;o kết quả triển khai thực hiện Thỏa thuận về ph&aacute;t triển du lịch v&ugrave;ng T&acirc;y Bắc giữa Hiệp hội Du lịch Việt Nam, Tổng C&ocirc;ng ty H&agrave;ng kh&ocirc;ng Việt Nam v&agrave; Ban Chỉ đạo T&acirc;y Bắc.</p>

<p>Khen thưởng c&aacute;c doanh nghiệp c&oacute; nhiều đ&oacute;ng g&oacute;p trong đầu tư, li&ecirc;n kết ph&aacute;t triển sản phẩm du lịch trong v&ugrave;ng thời gian qua&hellip;</p>

<p>C&ugrave;ng với đ&oacute;, trong khu&ocirc;n khổ hội nghị, c&ograve;n diễn ra một số hoạt động như: Khảo s&aacute;t thực tế một số m&ocirc; h&igrave;nh du lịch của tỉnh L&agrave;o Cai; Trưng b&agrave;y giới thiệu tiềm năng, thế mạnh v&agrave; c&aacute;c sản phẩm li&ecirc;n kết du lịch đặc trưng của v&ugrave;ng theo 3 tuyến dọc s&ocirc;ng Hồng, s&ocirc;ng L&ocirc;, s&ocirc;ng Đ&agrave;</p>

<p><em>Theo Bộ Văn H&oacute;a Thể Thao v&agrave; Du lịch</em></p>
', N'Hôi nghị “Quảng bá, xúc tiến, liên kết phát triển sản phẩm du lịch đặc trưng vùng Tây Bắc năm 2017” dự kiến sẽ diễn ra tại thành phố Lào Cai (tỉnh Lào Cai) vào dịp Bế mạc Năm Du lịch quốc gia 2017.', N'/DATA/images/News/sp-du-lich-tay-nguyen.jpg', NULL, 1)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (6, N'THỪA THIÊN HUẾ TĂNG CƯỜNG KẾT NỐI DU LỊCH VỚI TPHCM', N'THUA-THIEN-HUE-TANG-CUONG-KET-NOI-DU-LICH-VOI-TPHCM', CAST(0x0000A7F200000000 AS DateTime), N'admin', 1, 0, N'<p>&Ocirc;ng Nguyễn Văn Ph&uacute;c, Ph&oacute; gi&aacute;m đốc Sở Du lịch Thừa Thi&ecirc;n Huế cho biết: &ldquo;Nhờ t&iacute;ch cực kết nối với c&aacute;c trung t&acirc;m du lịch, lữ h&agrave;nh lớn n&ecirc;n du lịch cố đ&ocirc; li&ecirc;n tục ph&aacute;t triển trong những năm gần đ&acirc;y. Đầu năm tới nay Huế đ&atilde; đ&oacute;n 2,7 triệu lươt du kh&aacute;ch, trong đ&oacute; khoảng 1 triệu du kh&aacute;ch nước ngo&agrave;i. Năm 2017, tỉnh dự kiến đ&oacute;n 3,7 triệu lượt du kh&aacute;ch. Ng&agrave;nh du lịch Thừa Thi&ecirc;n Huế b&agrave;y tỏ sự tri &acirc;n với c&aacute;c đối t&aacute;c tại TPHCM v&agrave; mong c&oacute; sự hợp t&aacute;c ng&agrave;y c&agrave;ng chặt chẽ hơn, tăng lượng kh&aacute;ch v&agrave; thời gian lưu tr&uacute; của du kh&aacute;ch đến từ TPHCM&rdquo;.</p>

<p>B&agrave; T&ocirc;n Nữ Thị Ninh, Chủ tịch Quỹ H&ograve;a b&igrave;nh v&agrave; Ph&aacute;t triển TPHCM, một người con của Huế v&agrave; cũng đang t&iacute;ch cực tổ chức nhiều hoạt động quảng b&aacute; văn h&oacute;a du lịch Việt Nam ra nước ngo&agrave;i cho biết: &ldquo;Sở dĩ du kh&aacute;ch t&igrave;m tới Huế ng&agrave;y c&agrave;ng nhiều l&agrave; v&igrave; Huế c&oacute; những n&eacute;t đặc trưng ri&ecirc;ng, nhất l&agrave; những n&eacute;t văn h&oacute;a trầm mặc chậm r&atilde;i s&acirc;u sắc, phong cảnh cổ k&iacute;nh gần gũi với thi&ecirc;n nhi&ecirc;n. Huế kh&ocirc;ng n&ecirc;n đi theo con đường c&ocirc;ng nghiệp h&oacute;a, thương mại h&oacute;a m&agrave; phải ph&aacute;t huy nền kinh tế &ldquo;kh&ocirc;ng kh&oacute;i&rdquo;, ph&aacute;t huy những gi&aacute; trị văn h&oacute;a vật thể v&agrave; phi vật thể, trong đ&oacute; chủ lực l&agrave; ph&aacute;t triển du lịch&rdquo;.</p>

<p><img alt="Tiết mục văn nghệ xứ Huế" src="http://www.ttcgroup.vn/media/7612/tiet-muc-hat-hue-2017.jpg" /></p>

<p><em>Thừa Thi&ecirc;n Huế tăng cường kết nối du lịch với TPHCM</em></p>

<p>Trong buổi Gala, nhiều dự &aacute;n v&agrave; chương tr&igrave;nh phối hợp ph&aacute;t triển du lịch giữa hiệp hội du lịch Thừa Thi&ecirc;n Huế v&agrave; Hiệp hội du lịch TPHCM đ&atilde; được khởi động. Ng&agrave;nh du lịch TPHCM cũng đang muốn ph&aacute;t triển du lịch theo hướng khai th&aacute;c tiềm năng văn h&oacute;a vật thể v&agrave; phi vật thể để k&eacute;o d&agrave;i thời gian lưu tr&uacute; m&agrave; Huế ch&iacute;nh l&agrave; một điển h&igrave;nh. Du lịch Thừa Thi&ecirc;n Huế cũng mong muốn du lịch cố đ&ocirc; sẽ được quảng b&aacute; nhiều hơn tại TPHCM.</p>

<p><em>Theo Tiền Phong</em></p>
', N'Tối 8/9/2017 tại Khách sạn Rex, TPHCM, Sở Du lịch tỉnh Thừa Thiên Huế đã tổ chức buổi Gala tăng cường gặp gỡ kết nối với ngành du lịch TPHCM. Gala đã thu hút nhiều doanh nghiệp du lịch hàng đầu của Thừa Thiên Huế và TPHCM và các hiệp hội du lịch tham dự.', N'/DATA/images/News/trinh-dien-thoi-trang-hue2017.jpg', NULL, 1)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (7, N'TOUR ĐI BỘ MIỄN PHÍ CHO KHÁCH NƯỚC NGOÀI ĐẾN VIỆT NAM', N'TOUR-DI-BO-MIEN-PHI-CHO-KHACH-NUOC-NGOAI-DEN-VIET-NAM', CAST(0x0000A7F200000000 AS DateTime), N'admin', 1, 0, N'<p>M&ocirc; h&igrave;nh du lịch miễn ph&iacute; được Vietravel triển khai ban đầu ở c&aacute;c th&agrave;nh phố du lịch lớn: H&agrave; Nội, Hạ Long, Huế, Đ&agrave; Nẵng, Hội An, TP HCM, Cần Thơ v&agrave;o ba ng&agrave;y cuối tuần. Du kh&aacute;ch quốc tế sẽ đăng k&yacute; theo tuyến tour được tư vấn để t&igrave;m hiểu về lịch sử, văn h&oacute;a, con người, ẩm thực Việt Nam. Dự kiến sắp tới, m&ocirc; h&igrave;nh được nh&acirc;n rộng ra c&aacute;c điểm kh&aacute;c như: Quy Nhơn, Nha Trang, Đ&agrave; Lạt, Vinh, C&agrave; Mau, Rạch Gi&aacute;, Ph&uacute; Quốc,&hellip; để tạo n&ecirc;n một mạng lưới gi&uacute;p du kh&aacute;ch c&oacute; th&ecirc;m nhiều trải nghiệm hơn khi đến Việt Nam.</p>

<p>Ở mỗi địa phương, tuyến tour được thiết kế ri&ecirc;ng biệt theo đặc trưng nơi đ&oacute; để du kh&aacute;ch t&igrave;m hiểu kỹ v&agrave; trải nghiệm, v&iacute; dụ c&aacute;c di t&iacute;ch lịch sử, chợ, ẩm thực đường phố&hellip; Mỗi tour đi bộ k&eacute;o d&agrave;i trong 2-3 tiếng, t&ugrave;y thuộc v&agrave;o từng điểm đến cụ thể, c&oacute; hướng dẫn vi&ecirc;n đi c&ugrave;ng.Với c&aacute;c điểm tham quan c&oacute; thu ph&iacute; hay b&aacute;n v&eacute;, hướng dẫn vi&ecirc;n chỉ cho kh&aacute;ch tham quan b&ecirc;n ngo&agrave;i.</p>

<p>TP HCM l&agrave; trọng điểm của m&ocirc; h&igrave;nh n&agrave;y, với nhiều lựa chọn về tuyến đường tham quan. Theo đ&oacute;, tuyến &ldquo;H&ograve;n Ngọc Viễn Đ&ocirc;ng&rdquo; đi qua c&aacute;c điểm tham quan biểu trưng như: chợ Bến Th&agrave;nh, nh&agrave; thờ Đức B&agrave;, bưu điện th&agrave;nh phố, nh&agrave; h&aacute;t th&agrave;nh phố, đại lộ Nguyễn Huệ, Ủy ban Nh&acirc;n d&acirc;n th&agrave;nh phố, đường s&aacute;ch. Tuyến &ldquo;Nhộn nhịp khu phố người Hoa&rdquo; qua ch&ugrave;a &Ocirc;ng Bổn, chợ vải So&aacute;i K&igrave;nh L&acirc;m, ch&ugrave;a Quan &Acirc;m, Tuệ Th&agrave;nh Hội Qu&aacute;n, Tam Sơn Hội Qu&aacute;n, đường Hải Thượng L&atilde;n &Ocirc;ng.</p>

<p>Ở H&agrave; Nội, tuyến &ldquo;Khi phố cổ l&ecirc;n đ&egrave;n&rdquo; bao gồm c&aacute;c điểm tham quan: Nh&agrave; h&aacute;t lớn H&agrave; Nội, trung t&acirc;m Hội chợ Triển l&atilde;m Quảng c&aacute;o H&agrave; Nội, vườn hoa L&yacute; Th&aacute;i Tổ, đền Ngọc Sơn &ndash; cầu Th&ecirc; H&uacute;c, đền B&agrave; Kiệu, Nh&agrave; lưu niệm Hồ Ch&iacute; Minh, &Ocirc; Quan Chưởng, cụm phố Nh&agrave; Thờ &ndash; L&yacute; Quốc Sư &ndash; Ấu Triệu.</p>

<p>B&agrave; Huỳnh Thị Đoan Th&ugrave;y, đại diện ban tổ chức cho biết đơn vị x&acirc;y dựng dự &aacute;n tour phi lợi nhuận để quảng b&aacute; h&igrave;nh ảnh Việt Nam với du kh&aacute;ch nước ngo&agrave;i, nhất l&agrave; những kh&aacute;ch lẻ muốn trải nghiệm văn h&oacute;a &ndash; ẩm thực nhưng kh&ocirc;ng nắm r&otilde; về tuyến điểm đến ph&ugrave; hợp.</p>

<p><em>Theo vietnammoi</em></p>
', N'Du khách sẽ tham gia tour khám phá bằng hình thức đi bộ, theo từng chủ đề ở TP HCM, Hà Nội, Đà Nẵng, Cần Thơ… từ giữa tháng 9.', N'/DATA/images/News/du-khach-di-bo.jpg', NULL, 1)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (8, N'THÊM 2 TRƯỜNG KHÁNH THÀNH VÀ KHAI GIẢNG NĂM HỌC MỚI', N'THEM-2-TRUONG-KHANH-THANH-VA-KHAI-GIANG-NAM-HOC-MOI', CAST(0x0000A7F200000000 AS DateTime), N'admin', 1, 0, N'<p>Đ&acirc;y là ng&ocirc;i trường ch&acirc;́t lượng cao thứ 6 và là ng&ocirc;i trường thứ 7 thu&ocirc;̣c kh&ocirc;́i ph&ocirc;̉ th&ocirc;ng của TTC EDU. Trường được x&acirc;y dựng gồm các phòng học ti&ecirc;u chu&acirc;̉n, trang bị máy lạnh, màn hình LCD, h&ocirc;̀ bơi, s&acirc;n bóng đá mini, nhà thi đ&acirc;́u th&ecirc;̉ thao đa năng&hellip; Ngo&agrave;i ra, trường c&ograve;n có các phòng thí nghi&ecirc;̣m, phòng tin học, phòng nghe nhìn phục vụ học sinh thực hành, làm thí nghi&ecirc;̣m các m&ocirc;n học và học ngoại ngữ.</p>

<p><img alt="Các đại biểu cùng các em học sinh Trường Lê Quý Đôn Long Bình Tân thả bóng bay chào đón năm học mới" src="http://www.ttcgroup.vn/media/7583/11-09-2017-2.jpg" /><br />
<em>Các đại bi&ecirc;̉u cùng các em học sinh Trường L&ecirc; Quý Đ&ocirc;n Long Bình T&acirc;n thả bóng bay chào đón năm học mới (ảnh: C&ocirc;ng Nghĩa)</em></p>

<p>Theo Ban giám đ&ocirc;́c TTC EDU, do được thành l&acirc;̣p sau n&ecirc;n Trường L&ecirc; Quý Đ&ocirc;n Long Bình T&acirc;n có nhi&ecirc;̀u lợi th&ecirc;́ khi được ti&ecirc;́p nh&acirc;̣n toàn b&ocirc;̣ chương trình học ti&ecirc;n ti&ecirc;́n của các trường trong h&ecirc;̣ th&ocirc;́ng TTC EDU, trong đó có chương trình ti&ecirc;́ng Anh chu&acirc;̉n ch&acirc;u &Acirc;u, tin học qu&ocirc;́c t&ecirc;́, kỹ năng s&ocirc;́ng theo chuy&ecirc;n đ&ecirc;̀ cho từng c&acirc;́p học&hellip;</p>

<p><img alt="Quang cảnh" src="http://www.ttcgroup.vn/media/7584/11-09-2017-3.jpg" /><br />
<em>Một g&oacute;cTrường THPT L&ecirc; Qúy Đ&ocirc;n Long Bình T&acirc;n (ảnh: C&ocirc;ng Nghĩa)</em></p>

<p>Ngay trong năm học đ&acirc;̀u ti&ecirc;n 2017-2018, Trường THPT L&ecirc; Qúy Đ&ocirc;n Long Bình T&acirc;n đã có 15 lớp từ kh&ocirc;́i 10 và 11, với t&ocirc;̉ng s&ocirc;́ 625 học sinh.</p>

<p>* S&aacute;ng c&ugrave;ng ng&agrave;y, Trường tiểu học Hưng Lộc (huyện Thống Nhất) cũng đ&atilde; tổ chức lễ kh&aacute;nh th&agrave;nh v&agrave; khai giảng năm học mới 2017-2018.<br />
<img alt="Chủ tịch UBND huyện Trần Văn Chiến và các đại biểu cắt băng khánh thành trường tiểu học Hưng Lộc" src="http://www.ttcgroup.vn/media/7585/11-09-2017-4.jpg" /><br />
<em>C&aacute;c đại biểu cắt băng kh&aacute;nh th&agrave;nh Trường tiểu học Hưng Lộc (ảnh: Tiến Thụ)</em></p>

<p>Trường tiểu học Hưng Lộc được x&acirc;y dựng với kết cấu 1 trệt, 2 lầu tr&ecirc;n khu đất rộng hơn 16.000 m2, gồm 18 ph&ograve;ng học, nh&agrave; hiệu bộ v&agrave; c&aacute;c ph&ograve;ng chức năng&hellip;với tổng kinh ph&iacute; đầu tư tr&ecirc;n 34 tỷ đồng từ ng&acirc;n s&aacute;ch huyện.<br />
<img alt="Trường" src="http://www.ttcgroup.vn/media/7586/11-09-2017-5.jpg" /><br />
<em>Trường tiểu học Hưng Lộc khai giảng năm học mới (ảnh: Tiến Thụ)</em></p>

<p>Ngay sau lễ kh&aacute;nh th&agrave;nh, nh&agrave; trường đ&atilde; tổ chức khai giảng năm học mới 2017-2018. Trong năm học n&agrave;y, nh&agrave; trường c&oacute; 35 c&aacute;n bộ, gi&aacute;o vi&ecirc;n v&agrave; hơn 600 em học sinh với 20 lớp học.</p>

<p>&nbsp;</p>

<p><strong>Theo B&aacute;o Đồng Nai</strong></p>
', N'Sáng 6-9, Công ty cổ phần giáo dục Thành Thành Công (TTC EDU) tổ chức lễ khánh thành Trường THPT Lê Quý Đôn Long Bình Tân (KCN Biên Hòa 2, phường Long Bình Tân, TP.Biên Hòa) và khai giảng năm học đầu tiên 2017-2018.', N'/DATA/images/News/11-09-2017-1jpg1.jpg', NULL, 1)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (9, N'5 NƯỚC ACMECS ĐẨY MẠNH HỢP TÁC PHÁT TRIỂN DU LỊCH', N'5-NUOC-ACMECS-DAY-MANH-HOP-TAC-PHAT-TRIEN-DU-LICH', CAST(0x0000A7F200000000 AS DateTime), N'admin', 1, 0, N'<p>Hội nghị bộ trưởng du lịch ACMECS l&agrave; sự kiện nằm trong khu&ocirc;n khổ của hội chợ du lịch quốc tế TPHCM lần thứ 13 năm 2017.</p>

<p>Ph&aacute;t biểu khai mạc hội nghị, Bộ trưởng Văn ho&aacute; Thể thao v&agrave; Du lịch Nguyễn Ngọc Thiện cho biết, hợp t&aacute;c du lịch ACMECS đ&atilde; đạt được một số kết quả quan trọng trong việc n&acirc;ng cao h&igrave;nh ảnh c&aacute;c điểm du lịch trong khu vực v&agrave; kết nối c&aacute;c điểm đến trong khu vực trở th&agrave;nh một điểm đến chung.</p>

<p>&ldquo;Nhiều tuyến du lịch chung đ&atilde; được h&igrave;nh th&agrave;nh, ti&ecirc;u biểu l&agrave; tuyến h&agrave;nh lang ven biển ph&iacute;a Nam v&agrave; h&agrave;nh lang kinh tế Đ&ocirc;ng &ndash; T&acirc;y, kết nối hầu hết c&aacute;c nước trong khu vực với nhau v&agrave; với thị trường nguồn. Rất nhiều hoạt động hợp t&aacute;c du lịch đ&atilde; được triển khai giữa c&aacute;c nước th&agrave;nh vi&ecirc;n một c&aacute;ch hiệu quả&rdquo;, &ocirc;ng Nguyễn Ngọc Thiện nhận định.</p>

<p>Tr&ecirc;n tinh thần x&acirc;y dựng 5 quốc gia th&agrave;nh &ldquo;một điểm đến chung&rdquo;, thời gian qua, c&aacute;c quốc gia đ&atilde; c&ugrave;ng nhau ph&aacute;t triển c&aacute;c sản phẩm du lịch, đầu tư tăng cường hạ tầng du lịch, gắn với bảo tồn v&agrave; ph&aacute;t huy gi&aacute; trị văn ho&aacute; d&acirc;n tộc cũng như giữ g&igrave;n cảnh quan, bảo vệ m&ocirc;i trường.</p>

<p>Cụ thể, năm 2016, 5 nước Campuchia, Th&aacute;i Lan, Myanmar, L&agrave;o v&agrave; Việt Nam đ&oacute;n 54,8 triệu lượt kh&aacute;ch quốc tế, tăng 4,9% so với năm 2015. Số lượng kh&aacute;ch du lịch nội v&ugrave;ng giữa 5 nước đạt 8,95 triệu lượt, chiếm 16% tổng số kh&aacute;ch quốc tế đến, tăng 5% so với năm 2015.</p>

<p>Thay mặt cho th&agrave;nh phố chủ nh&agrave; của Hội nghị bộ trưởng du lịch ACMECS 2017, Chủ tịch UBND TPHCM Nguyễn Th&agrave;nh Phong b&agrave;y tỏ, với vai tr&ograve; l&agrave; đầu mối du lịch, giao lưu quốc tế của Việt Nam cũng như của c&aacute;c nước trong khu vực, TPHCM đang nỗ lực thực hiện chiến lược ph&aacute;t triển du lịch tới năm 2025.</p>

<p>&ldquo;TPHCM tự h&agrave;o khi kh&aacute;ch quốc tế đến th&agrave;nh phố giai đoạn 2006 -2016 tăng trưởng b&igrave;nh qu&acirc;n 10% mỗi năm, chiếm tỉ trọng 56% lượng kh&aacute;ch quốc tế đến Việt Nam. Doanh thu du lịch tăng trưởng b&igrave;nh qu&acirc;n 30% mỗi năm, chiếm 43% doanh thu du lịch của cả nước. Ri&ecirc;ng trong năm 2016, TPHCM đ&atilde; đ&oacute;n hơn 5,2 triệu lượt kh&aacute;ch quốc tế. Về d&agrave;i hạn, TPHCM đặt mục ti&ecirc;u đến năm 2020, du lịch sẽ trở th&agrave;nh ng&agrave;nh kinh tế mũi nhọn&rdquo;, &ocirc;ng Nguyễn Th&agrave;nh Phong cho biết.</p>

<p>Để tăng cường hợp t&aacute;c du lịch ACMECS, c&aacute;c vị bộ trưởng v&agrave; trưởng đo&agrave;n du lịch 5 nước đ&atilde; thảo luận nhiều biện ph&aacute;p, trong đ&oacute; tập trung v&agrave;o c&aacute;c nội dung x&uacute;c tiến v&agrave; quảng b&aacute; du lịch trong giai đoạn 2016 &ndash; 2018. Đại diện c&aacute;c nước cũng đồng thuận đẩy mạnh ph&aacute;t triển sản phẩm du lịch, tăng cường sự tham gia của khối tư nh&acirc;n v&agrave; cộng đồng địa phương, tạo điều kiện đi lại thuận lợi v&agrave; ph&aacute;t triển nguồn nh&acirc;n lực du lịch.</p>

<p>Ngo&agrave;i ra, trong bối cảnh thế giới v&agrave; khu vực ASEAN đang c&oacute; nhiều chuyển biến mạnh mẽ, c&aacute;c bộ trưởng ACMECS cũng b&agrave;n thảo về việc điều chỉnh để hợp t&aacute;c giữa c&aacute;c nước đạt hiệu quả thực chất hơn.</p>

<p>&nbsp;</p>

<p><strong>Theo Cổng điện tử Ch&iacute;nh phủ TP.HCM</strong></p>
', N'Ngay sau lễ khai mạc hội chợ du lịch quốc tế TPHCM, Hội nghị bộ trưởng du lịch ACMECS lần thứ 3 của 5 nước Camphuchia, Lào, Myanmar, Thái Lan và Việt Nam đã diễn ra.', N'/DATA/images/News/12-09-2017-14.jpg', NULL, 1)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (10, N'TP.HCM SẼ LÀ “ĐIỂM NÓNG” CỦA DU LỊCH MICE', N'TP-HCM-SE-LA-“DIEM-NONG”-CUA-DU-LICH-MICE', CAST(0x0000A7F200000000 AS DateTime), N'admin', 1, 0, N'<p>Trong khu&ocirc;n khổ Hội chợ Du lịch Quốc tế TP.HCM 2017, chiều 6/9, tại Trung t&acirc;m hội nghi Gem Center (Q.1, TP.HCM), Sở Du lịch TP.HCM đ&atilde; phối hợp với Tổng cục Du lịch tổ chức Hội thảo về du lịch MICE với chủ đề &ldquo;TP.HCM &ndash; Trung t&acirc;m quốc tế mới về MICE tại Đ&ocirc;ng Nam &Aacute;&rdquo;. Hội thảo thu h&uacute;t sự quan t&acirc;m, tham gia của khoảng 300 doanh nghiệp lữ h&agrave;nh trong nước v&agrave; quốc tế.</p>

<p>Tại b&aacute;o c&aacute;o đề dẫn, Vụ trưởng Vụ lữ h&agrave;nh (Tổng cục Du lịch) Vũ Qu&yacute; Phương, cho biết, với 2.7 triệu lượt kh&aacute;ch quốc tế đến với TP.HCM trong 6 th&aacute;ng đầu năm, tăng 14% so với c&ugrave;ng kỳ l&agrave; một con số mang nhiều &yacute; nghĩa. Sự tăng trưởng t&iacute;ch cực của ng&agrave;nh du lịch Th&agrave;nh phố c&oacute; đ&oacute;ng g&oacute;p quan trọng của thị trường kh&aacute;ch hội nghị, triển l&atilde;m, khuyến thưởng. V&agrave; đ&acirc;y ch&iacute;nh l&agrave; cơ hội cho du lịch TP.HCM trở th&agrave;nh một điểm đến mới của Đ&ocirc;ng Nam &Aacute;.</p>

<p><img alt="Các đại biểu tham dự tọa đàm" src="http://www.ttcgroup.vn/media/7595/12-09-2017-13.jpg" /></p>

<p>Với vị tr&iacute; thuận lợi, từ l&acirc;u, TP.HCM đ&atilde; l&agrave; một trong những Th&agrave;nh phố trung t&acirc;m trung chuyển kh&aacute;ch quốc tế lớn nhất ở Việt Nam. Hiện s&acirc;n bay T&acirc;n Sơn Nhất đang phục vụ khai th&aacute;c vận chuyển 4 h&atilde;ng h&agrave;ng kh&ocirc;ng nội địa, 43 h&atilde;ng h&agrave;ng kh&ocirc;ng quốc tế, bay tới 42 s&acirc;n bay cả trong lẫn ngo&agrave;i nước. C&ugrave;ng với sự đa dạng về sản phẩm du lịch, với nhiều loại h&igrave;nh dịch vụ, nguồn nh&acirc;n lực tương đối ho&agrave;n thiện với chất lượng cao&hellip; Đ&acirc;y l&agrave; thuận lợi lớn để thu h&uacute;t kh&aacute;ch MICE đến với TP.HCM.</p>

<p>Đ&aacute;ng ch&uacute; &yacute;, số liệu b&aacute;o c&aacute;o năm 2017 của tập đo&agrave;n tư vấn h&agrave;ng đầu thế giới McKinsey cho thấy, c&oacute; đến 17% du kh&aacute;ch đến TP.HCM v&igrave; mục đ&iacute;ch c&ocirc;ng việc; cao hơn so với mức b&igrave;nh qu&acirc;n 14% &ndash; 15% của khu vực. Điều n&agrave;y khẳng định TP.HCM đang c&oacute; sức h&uacute;t đặc biệt đối với thị trường kh&aacute;ch MICE v&agrave; điểm đến n&agrave;y hội tụ đầy đủ tiềm năng cũng như yếu tố để ph&aacute;t triển một c&aacute;ch to&agrave;n diện du lịch MICE; g&oacute;p phần v&agrave;o việc n&acirc;ng cao hơn nữa gi&aacute; trị kinh tế của ng&agrave;nh du lịch n&oacute;i ri&ecirc;ng v&agrave; đ&oacute;ng g&oacute;p v&agrave;o sự ph&aacute;t triển bền vững của th&agrave;nh phố n&oacute;i chung.</p>

<p>&Ocirc;ng B&ugrave;i T&aacute; Ho&agrave;ng Vũ, Gi&aacute;m đốc Sở Du lịch TP.HCM cho rằng, trong những năm gần đ&acirc;y, du lịch TP.HCM kh&ocirc;ng ngừng ho&agrave;n thiện về cơ sở hạ tầng, đội ngũ c&aacute;n bộ nguồn nh&acirc;n lực v&agrave; ph&aacute;t triển đa dạng c&aacute;c sản phẩm để cạnh tranh với c&aacute;c nước trong khu vực về du lịch MICE. To&agrave;n TP hiện c&oacute; hơn 80 kh&aacute;ch sạn từ 3-5 sao với tổng cộng 200 ph&ograve;ng hội nghị c&oacute; quy m&ocirc; kh&aacute;c nhau, c&oacute; thể tổ chức những sự kiện lớn trong nước v&agrave; quốc tế. Vấn đề c&ograve;n lại l&agrave; thu h&uacute;t kh&aacute;ch từ c&aacute;c thị trường mạnh về du lịch MICE.</p>

<p>Cũng theo &ocirc;ng Vũ, dự kiến v&agrave;o năm sau, trung t&acirc;m hội nghị triển l&atilde;m quốc tế rộng khoảng 14 ha, với đầy đủ c&aacute;c dịch vụ cho c&aacute;c sự kiện hội họp, lưu tr&uacute; v&agrave; kh&aacute;ch tham gia sẽ được khởi c&ocirc;ng tại Khu đ&ocirc; thị mới Thủ Thi&ecirc;m. Trung t&acirc;m n&agrave;y c&oacute; thể sẽ bắt đầu đ&oacute;n kh&aacute;ch v&agrave;o năm 2020. Một số dự &aacute;n lớn tại Cần Giờ, Củ Chi cũng đang được quy hoạch. Th&ecirc;m v&agrave;o đ&oacute;, hệ thống kh&aacute;ch sạn cũng sẽ th&ecirc;m nhiều kh&aacute;ch sạn cao cấp, phục vụ cho nhu cầu ở v&agrave; tổ chức sự kiện cho kh&aacute;ch MICE.</p>

<p>Để ph&aacute;t triển du lịch một c&aacute;ch hiệu quả với chất lượng l&agrave; trọng t&acirc;m, TP.HCM x&aacute;c định du lịch MICE l&agrave; một trong những sản phẩm ch&iacute;nh cần được triển khai trong chương tr&igrave;nh h&agrave;nh động thực hiện Nghị quyết 08 của Bộ Ch&iacute;nh trị về ph&aacute;t triển du lịch th&agrave;nh ng&agrave;nh kinh tế mũi nhọn v&agrave; Chỉ thị số 07 của Th&agrave;nh ủy TP.HCM về nhiệm vụ ph&aacute;t triển ng&agrave;nh du lịch TP.HCM đến năm 2020.</p>

<p>&nbsp;</p>

<p><strong>Theo Tổ Quốc</strong></p>
', N'Theo báo cáo năm 2017 của Tập đoàn tư vấn McKinsey, có đến 17% du khách đến TP.HCM vì mục đích công việc, cao hơn so với mức bình quân của khu vực 14-15%. Điều này khẳng định TP.HCM đang có sức hút đặc biệt đối với thị trường khách MICE (du lịch kết hợp hội thảo, hội nghị…).', N'/DATA/images/News/12-09-2017-13.jpg', NULL, 1)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (11, N'SỨC HẤP DẪN CỦA DU LỊCH TRÀ VINH', N'SUC-HAP-DAN-CUA-DU-LICH-TRA-VINH', CAST(0x0000A7F200000000 AS DateTime), N'admin', 1, 0, N'<p>L&agrave; một tỉnh duy&ecirc;n hải, được bao bọc bởi s&ocirc;ng Tiền, s&ocirc;ng Hậu, Tr&agrave; Vinh c&oacute; cảnh quan kh&aacute; đa dạng với hệ thống k&ecirc;nh, rạch, s&ocirc;ng nước, ao hồ c&ugrave;ng b&atilde;i biển đẹp chạy d&agrave;i, tạo th&agrave;nh những danh thắng c&oacute; một kh&ocirc;ng hai của v&ugrave;ng đồng bằng s&ocirc;ng Cửu Long. Một trong những điểm đến như vậy được nhiều du kh&aacute;ch t&igrave;m hiểu l&agrave; b&atilde;i biển Ba &ETH;ộng thuộc thị x&atilde; Duy&ecirc;n Hải, c&aacute;ch trung t&acirc;m th&agrave;nh phố Tr&agrave; Vinh khoảng 55 km. B&atilde;i biển d&agrave;i hơn 10 km, từ V&agrave;m L&aacute;ng Nước đến V&agrave;m Kh&acirc;u Lầu vẫn mang vẻ đẹp nguy&ecirc;n sơ c&ugrave;ng những đụn c&aacute;t trải d&agrave;i v&agrave; h&agrave;ng phi lao xanh ng&agrave;y đ&ecirc;m du dương c&ugrave;ng nắng gi&oacute;. &ETH;ến đ&acirc;y nghỉ dưỡng, kh&aacute;ch c&ograve;n được thưởng thức c&aacute;c loại hải sản tươi ngon v&agrave; h&ograve;a m&igrave;nh v&agrave;o thi&ecirc;n nhi&ecirc;n ngập tr&agrave;n vị mặn m&ograve;i của phương nam.</p>

<p>Một thắng cảnh kh&ocirc;ng k&eacute;m phần l&ocirc;i cuốn, điểm xuyết v&agrave;o vẻ đẹp độc đ&aacute;o của du lịch s&ocirc;ng nước miền T&acirc;y l&agrave; ao B&agrave; Om nằm ngay cạnh th&agrave;nh phố Tr&agrave; Vinh về hướng t&acirc;y nam dọc theo quốc lộ 53. Ao kh&aacute; rộng với một chiều 300 m, một chiều 500 m. Mặt nước ao phẳng lặng, lững lờ từng cụm hoa sen, hoa s&uacute;ng bung nở tr&ecirc;n nền m&acirc;y trời in b&oacute;ng nước c&ugrave;ng tiếng chim r&iacute;u r&iacute;t tr&ecirc;n những rặng c&acirc;y sao cổ thụ cao v&uacute;t, bao bọc ven hồ. Ao B&agrave; Om l&agrave; điểm đến được du kh&aacute;ch, nhất l&agrave; thanh ni&ecirc;n, học sinh, sinh vi&ecirc;n lựa chọn khi đi d&atilde; ngoại, cắm trại v&agrave;o những ng&agrave;y nghỉ cuối tuần hay dịp nghỉ lễ, nghỉ h&egrave;. Ngo&agrave;i hai danh thắng n&ecirc;u tr&ecirc;n, thi&ecirc;n nhi&ecirc;n v&agrave; kiến tạo địa chất cũng ưu &aacute;i mang lại cho Tr&agrave; Vinh mỏ nước kho&aacute;ng n&oacute;ng Cồn &Ocirc;ng &ndash; Long Thạnh ở thị x&atilde; Duy&ecirc;n Hải c&oacute; khả năng khai th&aacute;c 240 m3/ng&agrave;y đ&ecirc;m, thuận lợi cho dịch vụ nghỉ dưỡng tắm kho&aacute;ng n&oacute;ng.</p>

<p>B&ecirc;n cạnh tiềm năng tự nhi&ecirc;n vốn c&oacute;, Tr&agrave; Vinh c&ograve;n c&oacute; nhiều di t&iacute;ch lịch sử, kiến tr&uacute;c cổ xưa v&agrave; c&aacute;c di sản văn h&oacute;a ph&ugrave; hợp để ph&aacute;t triển du lịch văn h&oacute;a, t&acirc;m linh. Tr&ecirc;n địa b&agrave;n to&agrave;n tỉnh hiện c&oacute; mười di t&iacute;ch lịch sử, kiến tr&uacute;c v&agrave; di sản văn h&oacute;a phi vật thể cấp quốc gia c&ugrave;ng một bảo vật quốc gia, 143 ng&ocirc;i ch&ugrave;a Khmer Nam Bộ c&oacute; kiến tr&uacute;c cổ xưa độc đ&aacute;o, ti&ecirc;u biểu l&agrave; c&aacute;c ch&ugrave;a: N&ocirc;dol, Hang, Giồng Lớn, &Acirc;ng&hellip; &ETH;&acirc;y l&agrave; c&aacute;c ng&ocirc;i ch&ugrave;a cổ, mang kiến tr&uacute;c đặc trưng của Phật gi&aacute;o Khmer Nam Bộ, trong đ&oacute; c&oacute; ch&ugrave;a &Acirc;ng thuộc h&agrave;ng cổ nhất của v&ugrave;ng đồng bằng s&ocirc;ng Cửu Long thường được kh&aacute;ch du lịch v&agrave; nh&acirc;n d&acirc;n địa phương thăm viếng.</p>

<p>Tr&ecirc;n cơ sở tiềm năng du lịch phong ph&uacute; đ&atilde; v&agrave; đang được khai th&aacute;c, du lịch Tr&agrave; Vinh trong những năm qua đ&atilde; c&oacute; sự ph&aacute;t triển, hằng năm đ&oacute;n khoảng gần 600 ngh&igrave;n lượt kh&aacute;ch, tổng doanh thu ước đạt gần 160 tỷ đồng. Tuy nhi&ecirc;n, sự ph&aacute;t triển n&agrave;y chưa tương xứng v&agrave; chưa tạo được sự đột ph&aacute; để đạt mức tăng trưởng bền vững. Sản phẩm du lịch c&ograve;n thiếu v&agrave; chưa thật hấp dẫn khiến lượng kh&aacute;ch lưu tr&uacute; v&agrave; số ng&agrave;y lưu tr&uacute;<br />
c&ograve;n thấp, chỉ đạt b&igrave;nh qu&acirc;n 1,5 người/ng&agrave;y. Cơ sở hạ tầng v&agrave; hệ thống dịch vụ du lịch c&ograve;n yếu, chưa mời gọi được sự đầu tư lớn. X&aacute;c định du lịch l&agrave; ng&agrave;nh kinh tế mũi nhọn, vừa qua, Tỉnh ủy v&agrave; l&atilde;nh đạo tỉnh Tr&agrave; Vinh đ&atilde; đề ra chương tr&igrave;nh ưu ti&ecirc;n ph&aacute;t triển du lịch với mục ti&ecirc;u tập trung x&acirc;y dựng hạ tầng thiết yếu bảo đảm khả năng đ&oacute;n kh&aacute;ch v&agrave; tổ chức c&aacute;c sự kiện văn h&oacute;a, du lịch, thể thao quy m&ocirc; cấp v&ugrave;ng v&agrave; cấp quốc gia, hướng tới đ&oacute;n 2,5 triệu lượt kh&aacute;ch du lịch v&agrave;o năm 2025, trong đ&oacute; phấn đấu tăng lượng kh&aacute;ch quốc tế l&ecirc;n 85 ngh&igrave;n lượt, đạt mức doanh thu từ du lịch l&agrave; 1.600 tỷ đồng.</p>

<p>Một trong những giải ph&aacute;p trọng t&acirc;m để đạt c&aacute;c mục ti&ecirc;u n&ecirc;u tr&ecirc;n l&agrave; tập trung x&acirc;y dựng quy hoạch, cơ chế ch&iacute;nh s&aacute;ch ưu đ&atilde;i để thu h&uacute;t đầu tư, x&acirc;y dựng hạ tầng, cơ sở vật chất kỹ thuật phục vụ du lịch, tăng cường li&ecirc;n kết, x&uacute;c tiến quảng b&aacute;. Trước mắt, tỉnh sẽ huy động v&agrave; mời gọi c&aacute;c nguồn vốn đầu tư x&acirc;y dựng quần thể Khu di t&iacute;ch văn h&oacute;a ao B&agrave; Om trở th&agrave;nh điểm du lịch cấp quốc gia; thực hiện đầu tư c&aacute;c dự &aacute;n: khu du lịch sinh th&aacute;i rừng đước N&ocirc;ng trường Tỉnh đội, khu du lịch sinh th&aacute;i rừng ngập mặn biển Ba &ETH;ộng v&agrave; khu du lịch kho&aacute;ng n&oacute;ng Duy&ecirc;n Hải. Từ nay đến năm 2020, UBND tỉnh Tr&agrave; Vinh sẽ d&agrave;nh khoảng 14 tỷ đồng để thực hiện chương tr&igrave;nh x&uacute;c tiến, quảng b&aacute; du lịch.</p>

<p>&nbsp;</p>

<p><strong>Theo Nh&acirc;n D&acirc;n</strong></p>
', N'Cách TP Hồ Chí Minh khoảng 130 km, Trà Vinh là vùng đất có nguồn tài nguyên du lịch tự nhiên và nhân văn phong phú, một trong những điểm đến hấp dẫn, thu hút du khách miền Tây Nam Bộ.', N'/DATA/images/News/12-09-2017-12.jpg', NULL, 1)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (12, N'ĐÀ NẴNG QUYẾT TIẾN HÀNH DỰ ÁN DU LỊCH Ở SƠN TRÀ', N'DA-NANG-QUYET-TIEN-HANH-DU-AN-DU-LICH-O-SON-TRA', CAST(0x0000A7F200000000 AS DateTime), N'admin', 1, 0, N'<p>Một nh&agrave; bất đồng ch&iacute;nh kiến ở Đ&agrave; Nẵng n&oacute;i &ocirc;ng phản đối việc x&acirc;y dựng ở Sơn Tr&agrave; bất kể l&agrave; ở quy m&ocirc; n&agrave;o, v&agrave; b&aacute;n đảo Sơn Tr&agrave; n&ecirc;n được giữ nguy&ecirc;n trạng.</p>

<p>B&aacute;o ch&iacute; trong nước đưa tin, trong b&aacute;o c&aacute;o gửi Thủ tướng Nguyễn Xu&acirc;n Ph&uacute;c h&ocirc;m 5/9, ch&iacute;nh quyền Đ&agrave; Nẵng đưa ra đề xuất năm điểm về c&aacute;ch xử l&yacute; đối với c&aacute;c khu du lịch ở Sơn Tr&agrave; trước những &yacute; kiến kh&ocirc;ng đồng t&igrave;nh trong thời gian qua.</p>

<p>Theo b&aacute;o c&aacute;o của ch&iacute;nh quyền Đ&agrave; Nẵng, th&igrave; th&agrave;nh phố n&agrave;y vẫn muốn ph&aacute;t triển Sơn Tr&agrave; th&agrave;nh khu du lịch quốc gia theo hướng du lịch sinh th&aacute;i, thể thao v&agrave; nghỉ dưỡng cao cấp. L&yacute; do m&agrave; ch&iacute;nh quyền Đ&agrave; Nẵng đưa ra l&agrave; v&igrave; dự &aacute;n đ&oacute; &ldquo;ph&ugrave; hợp với quy hoạch tổng thể ph&aacute;t triển du lịch Việt Nam&rdquo;, &ldquo;g&oacute;p phần chuyển dịch cơ cấu kinh tế của địa phương&rdquo; v&agrave; được nghị quyết của Bộ Ch&iacute;nh trị cho ph&eacute;p với phương ch&acirc;m &ldquo;bảo tồn đi đ&ocirc;i với ph&aacute;t triển&rdquo;.</p>

<p>B&aacute;n đảo Sơn Tr&agrave; được cho l&agrave; c&oacute; vị trị trọng yếu về an ninh quốc ph&ograve;ng v&agrave; nơi đ&acirc;y cũng l&agrave; nơi cư tr&uacute; của nhiều lo&agrave;i động thực vật đặc hữu, trong đ&oacute; c&oacute; lo&agrave;i voọc ch&agrave; v&aacute;. Ch&iacute;nh quyền Đ&agrave; Nẵng đồng &yacute; rằng ph&aacute;t triển du lịch tại Sơn Tr&agrave; phải đảm bảo an ninh quốc ph&ograve;ng v&agrave; bảo tồn đa dạng sinh học.</p>

<p>Để đảm bảo c&aacute;c mục ti&ecirc;u n&agrave;y, Ủy ban nh&acirc;n d&acirc;n Đ&agrave; Nẵng đ&atilde; đưa ra một số đề xuất, trong đ&oacute; nổi bật l&agrave; chỉ cho x&acirc;y dựng từ độ cao 100 m&eacute;t trở xuống v&agrave; c&aacute;c c&ocirc;ng tr&igrave;nh được x&acirc;y dựng chỉ phục vụ mục đ&iacute;ch lưu tr&uacute; chứ kh&ocirc;ng cho ph&eacute;p cư tr&uacute;.</p>

<p>Ngo&agrave;i ra Đ&agrave; Nẵng cũng đặt ra y&ecirc;u cầu chỉ cho c&aacute;c nh&agrave; đầu tư trong nước thực hiện để đảm bảo an ninh- quốc ph&ograve;ng. C&aacute;c dự &aacute;n đ&atilde; ho&agrave;n chỉnh v&agrave; đ&atilde; đưa v&agrave;o hoạt động được Đ&agrave; Nẵng đề nghị Ch&iacute;nh phủ cho ph&eacute;p giữ lại.</p>

<p>X&eacute;t tr&ecirc;n c&aacute;c ti&ecirc;u ch&iacute; n&agrave;y th&igrave; trong số 18 dự &aacute;n đ&atilde; được Ủy ban nh&acirc;n d&acirc;n Đ&agrave; Nẵng cấp ph&eacute;p x&acirc;y dựng ở Sơn Tr&agrave; đến thời điểm cuối năm 2012, c&oacute; 6 dự &aacute;n kh&ocirc;ng ph&ugrave; hợp, 10 dự &aacute;n cần phải cắt giảm quy m&ocirc; v&agrave; hai dự &aacute;n được kiến nghị cho giữ nguy&ecirc;n, theo tường thuật của b&aacute;o Người Lao Động. Tuy nhi&ecirc;n, kh&ocirc;ng r&otilde; 6 dự &aacute;n kh&ocirc;ng ph&ugrave; hợp sẽ được xử l&yacute; như thế n&agrave;o.</p>

<p>Trao đổi với VOA, blogger Huỳnh Ngọc Ch&ecirc;nh ở Đ&agrave; Nẵng, n&oacute;i &ocirc;ng &ldquo;phản đối ho&agrave;n to&agrave;n mọi c&ocirc;ng tr&igrave;nh x&acirc;y dựng ở Sơn Tr&agrave; d&ugrave; l&agrave; 100 m&eacute;t trở xuống&rdquo;.</p>

<p>&ldquo;Chỉ x&acirc;y ở 100 m&eacute;t trở xuống cũng l&agrave;m hỏng Sơn Tr&agrave;. Sơn Tr&agrave; phải giữ cho nguy&ecirc;n vẹn. Ngo&agrave;i đoạn đường b&ecirc;n giới được khai th&aacute;c du lịch th&igrave; kh&ocirc;ng cho x&acirc;y dựng g&igrave; th&ecirc;m. Giữa th&agrave;nh phố c&oacute; một ngọn n&uacute;i đẹp như vậy, một khu rừng đẹp như vậy th&igrave; cần phải giữ,&rdquo; &ocirc;ng Ch&ecirc;nh n&oacute;i.</p>

<p>&ldquo;Sơn Tr&agrave; đ&uacute;ng nghĩa l&agrave; để ngắm. Nếu x&acirc;y dựng tr&ecirc;n th&igrave; sẽ l&agrave;m mất đi sự hấp dẫn đối với du kh&aacute;ch,&rdquo; &ocirc;ng n&oacute;i th&ecirc;m.</p>

<p>&Ocirc;ng Ch&ecirc;nh n&oacute;i rằng những người d&acirc;n ở Đ&agrave; Nẵng m&agrave; &ocirc;ng quen biết v&agrave; tiếp x&uacute;c &ldquo;hầu hết đều n&oacute;i phải giữ Sơn Tr&agrave; cho nguy&ecirc;n vẹn v&agrave; phải dọn hết c&aacute;c c&ocirc;ng tr&igrave;nh&rdquo;.</p>

<p>Nh&agrave; hoạt động n&agrave;y n&oacute;i rằng việc x&acirc;y dựng tr&ecirc;n b&aacute;n đảo Sơn Tr&agrave; l&agrave; &ldquo;của c&aacute;c nh&oacute;m lợi &iacute;ch c&oacute; thế lực rất mạnh&rdquo; khiến cho Ch&iacute;nh phủ v&agrave; ch&iacute;nh quyền Đ&agrave; Nẵng đ&aacute; qua đ&aacute; lại &ndash; kh&ocirc;ng ai d&aacute;m &lsquo;đụng đến&rsquo;.</p>

<p>&ldquo;Chắc chắn một điều l&agrave; c&aacute;c c&ocirc;ng ty hoạt động về địa ốc ở Việt Nam phần đ&ocirc;ng đều l&agrave; c&aacute;c nh&oacute;m lợi &iacute;ch, đều c&oacute; vốn hoặc c&oacute; sự đỡ đầu của &ocirc;ng n&agrave;y &ocirc;ng kh&aacute;c,&rdquo; &ocirc;ng Ch&ecirc;nh n&oacute;i, &ldquo;C&aacute;c c&ocirc;ng ty mua được đất, lấy được dự &aacute;n ở Sơn Tr&agrave; chắc chắn phải c&oacute; thế lực đỡ đầu.&rdquo;</p>

<p>&ldquo;C&aacute;c dự &aacute;n ở Sơn Tr&agrave; l&agrave; do từ thời &ocirc;ng Nguyễn B&aacute; Thanh để lại. Ch&iacute;nh quyền mới của Đ&agrave; Nẵng mới l&ecirc;n kh&ocirc;ng d&aacute;m đụng đến c&aacute;c nh&oacute;m lợi &iacute;ch.&rdquo;</p>

<p>&Ocirc;ng Ch&ecirc;nh cho biết ch&iacute;nh &ocirc;ng Nguyễn B&aacute; Thanh, cố B&iacute; thư Th&agrave;nh ủy Đ&agrave; Nẵng, l&agrave; người vận động để cho ph&eacute;p x&acirc;y dựng đến độ cao 200 m&eacute;t ở Sơn Tr&agrave;, để &ldquo;b&aacute;n được nhiều đất&rdquo; v&agrave; thu được nhiều tiền.</p>

<p><strong>Theo VOA</strong></p>
', N'Chính quyền Đà Nẵng thể hiện quyết tâm phát triển cơ sở hạ tầng phục vụ du lịch trên bán đảo Sơn Trà, tuy nhiên đồng ý giảm bớt quy mô xây dựng để đảm bảo an ninh quốc phòng và đa dạng sinh học của nơi này trước sức phản kháng mạnh mẽ của dư luận.', N'/DATA/images/News/12-09-2017-11.jpg', NULL, 1)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (13, N'CẦN THƠ ĐẨY MẠNH XÚC TIẾN PHÁT TRIỂN DU LỊCH VỚI NHẬT BẢN', N'CAN-THO-DAY-MANH-XUC-TIEN-PHAT-TRIEN-DU-LICH-VOI-NHAT-BAN', CAST(0x0000A7F200000000 AS DateTime), N'admin', 1, 0, N'<p>Đ&acirc;y l&agrave; chia sẻ của &ocirc;ng Trương Quang Ho&agrave;i Nam, Ph&oacute; Chủ tịch UBND TP Cần Thơ tại buổi l&agrave;m việc với Cơ quan X&uacute;c tiến du lịch Nhật Bản về việc th&uacute;c đẩy du lịch giữa Nhật Bản với TP Cần Thơ, ng&agrave;y 5/9.</p>

<p>Du kh&aacute;ch Quốc tế muốn đến đ&acirc;y phải th&ecirc;m một v&agrave;i chặng trung chuyển vừa mất thời gian, lại tốn th&ecirc;m chi ph&iacute;. C&oacute; những địa phương m&agrave; ch&uacute;ng t&ocirc;i đi khảo s&aacute;t th&igrave; phong cảnh kh&ocirc;ng hơn g&igrave; Cần Thơ nhưng họ c&oacute; đường bay n&ecirc;n thu h&uacute;t kh&aacute;ch du lịch đến nhiều hơn &ndash; &ocirc;ng Nam n&oacute;i.</p>

<p>Mặc d&ugrave; TP Cần Thơ c&oacute; l&agrave;ng du lịch Mỹ Kh&aacute;nh được đầu tư kh&aacute; quy m&ocirc; v&agrave; b&agrave;i bản, thu h&uacute;t đ&ocirc;ng đảo du kh&aacute;ch, nhưng h&igrave;nh thức du lịch n&agrave;y rất &iacute;t c&ograve;n lại đều ở mức độ nhỏ lẻ, manh m&uacute;n. L&agrave;m du lịch c&ograve;n thiếu t&iacute;nh chuy&ecirc;n nghiệp, đội ngũ nh&acirc;n sự chủ yếu lấy từ c&aacute;c quận, huyện, &iacute;t tiếp x&uacute;c với c&aacute;c hoạt động du lịch quốc tế&hellip; Th&agrave;nh phố Cần Thơ c&ograve;n thiếu khu du lịch mang tầm cỡ quốc tế.</p>

<p>&Ocirc;ng Takahashi Ayumi &ndash; Trưởng đại diện Cơ quan X&uacute;c tiến du lịch Nhật Bản tại Việt Nam cho biết: &Ocirc;ng nhiều lần đến Việt Nam v&agrave; Cần Thơ nhưng vẫn chưa c&oacute; nhiều th&ocirc;ng tin về c&aacute;c điểm du lịch cũng như quy hoạch ph&aacute;t triển của địa phương, c&aacute;c doanh nghiệp của Nhật cũng vậy mặc d&ugrave; trong số họ nhiều người đ&atilde; c&oacute; mặt tại H&agrave; Nội v&agrave; TP HCM.</p>

<p>&Ocirc;ng Takahashi Ayumi chia sẻ kinh nghiệm: L&agrave;m du lịch, c&ocirc;ng t&aacute;c quảng b&aacute; th&ocirc;ng tin cực kỳ quan trọng. Đồng thời &ocirc;ng Takahashi mong muốn được c&ugrave;ng th&agrave;nh phố Cần Thơ cung cấp nhiều th&ocirc;ng tin của địa phương cho đơn vị &ocirc;ng để x&uacute;c tiến đến c&aacute;c doanh nghiệp, hiệp hội cũng như người d&acirc;n Nhật Bản biết v&agrave; đến với Cần Thơ.</p>

<p>Cũng theo th&ocirc;ng tin từ &ocirc;ng Takahashi: Hiện Nhật Bản khai th&aacute;c 3 đường bay trực tiếp đến Việt Nam tại c&aacute;c địa phương như H&agrave; Nội, Đ&agrave; Nẵng v&agrave; TP HCM. Năm 2016, c&oacute; 740.000 du kh&aacute;ch Nhật Bản đến Việt Nam, ở chiều ngược lại c&oacute; 230.000 du kh&aacute;ch Việt Nam sang Nhật Bản.</p>

<p>Theo Sở Văn ho&aacute; thể thao v&agrave; Du lịch (VHTT&amp;DL) TP Cần Thơ, 8 th&aacute;ng đầu năm 2017, Cần Thơ đ&oacute;n hơn 5,2 triệu lượt kh&aacute;ch, tăng 43% so c&ugrave;ng kỳ 2016. Tổng doanh thu du lịch 8 th&aacute;ng ước đạt gần 1.500 tỷ đồng, tăng 17% so c&ugrave;ng kỳ năm 2016.</p>

<p>&nbsp;</p>

<p><strong>Theo Đại Đo&agrave;n Kết</strong></p>
', N'Du lịch của TP Cần Thơ chưa phát triển xứng tầm với vị thế của thủ phủ miền Tây là do không có đường bay quốc tế và chưa có khu du lịch mang tầm cỡ quốc tế…', N'/DATA/images/News/12-09-2017-1.jpg', NULL, 1)
INSERT [dbo].[Content] ([ID], [Name], [MetaTitle], [CreateDate], [UserName], [Status], [ViewCount], [Detail], [Description], [Images], [MoreImages], [Category]) VALUES (14, N'VIỆT NAM LỌT TOP 10 ĐỊA ĐIỂM TRĂNG MẬT RẺ NHẤT THẾ GIỚI', N'VIET-NAM-LOT-TOP-10-DIA-DIEM-TRANG-MAT-RE-NHAT-THE-GIOI', CAST(0x0000A7F200000000 AS DateTime), N'admin', 1, 0, N'<p><strong>Maroc</strong><br />
<img alt="Việt Nam lọt top 10 địa điểm trăng mật rẻ nhất thế giới - 1" src="http://www.ttcgroup.vn/media/7505/dulich-29-07-1.jpg" />Đất nước Ả Rập xa lạ thơm lừng m&ugrave;i hương liệu v&agrave; gia vị, với giả cả thấp đến kinh ngạc. Kh&oacute; c&oacute; nơi n&agrave;o đ&aacute;nh bại được Maroc về những chuyến phi&ecirc;u lưu l&atilde;ng mạn kh&ocirc;ng tốn k&eacute;m. Marrakesh, Fez v&agrave; Essaouira l&agrave; những th&agrave;nh phố xinh đẹp kh&ocirc;ng ngủ với đầy c&aacute;c qu&aacute;n c&agrave; ph&ecirc; gi&aacute; rẻ.<br />
<strong>Ấn Độ</strong><br />
<img alt="Việt Nam lọt top 10 địa điểm trăng mật rẻ nhất thế giới - 2" src="http://www.ttcgroup.vn/media/7506/dulich-29-07-2.jpg" />Từ l&acirc;u đ&atilde; được những du kh&aacute;ch theo chủ nghĩa tiết kiệm ưu &aacute;i, nay Ấn Độ đang dần trở n&ecirc;n đắt đỏ hơn, nhưng vẫn rẻ đến kh&ocirc;ng tin được. Ngay cả những người binh thường nhất cũng c&oacute; thể mua được v&eacute; hạng nhất tr&ecirc;n chuyến t&agrave;u hỏa xuy&ecirc;n Ấn, tuyến t&agrave;u đ&ecirc;m Delhi-Udaipur chỉ tốn khoảng 30 USD (khoảng 700.000 VND) cho buồng ngủ ở khoang hạng nhất.<br />
<strong>Việt Nam</strong><br />
<img alt="Việt Nam lọt top 10 địa điểm trăng mật rẻ nhất thế giới - 3" src="http://www.ttcgroup.vn/media/7507/dulich-29-07-3.jpg" />D&ugrave; chỉ c&oacute; &iacute;t hơn 10 USD (khoảng 230.000 VND) một ng&agrave;y, du kh&aacute;ch c&oacute; thể đi du lịch ở Việt Nam m&agrave; vẫn ăn chơi &ldquo;sang chảnh&rdquo; như vua ch&uacute;a , bởi nơi đ&acirc;y l&agrave; thi&ecirc;n đường của ẩm thực đường phố. H&atilde;y nhớ l&ecirc;n danh s&aacute;ch v&agrave; thưởng thức hết c&aacute;c m&oacute;n ăn đặc sản của th&agrave;nh phố nơi bạn thăm th&uacute;: phở b&ograve;, b&uacute;n chả, nhất l&agrave; bạn c&oacute; thể vừa lang thang đi dạo ngắm phố phường tay trong tay với người bạn đời vừa nhấm nh&aacute;p m&oacute;n b&aacute;nh m&igrave;. Một chuyến đi tầm trung cũng sẽ kh&ocirc;ng g&acirc;y ph&aacute; sản, m&agrave; lại gi&uacute;p du kh&aacute;ch được nghỉ ngơi ở những nơi đặc trưng hơn (v&iacute; dụ như khu phố cổ), hay đi du thuyền tr&ecirc;n những con t&agrave;u thăm vịnh Hạ Long hạng sang hơn v&agrave; th&ecirc;m những dịch vụ cho trải nghiệm đ&aacute;ng nhớ hơn (một lớp học nấu ăn, một chuyến thăm quan tr&ecirc;n xe đạp quanh phố cổ Hội An) với tiền lẻ vẫn đủ cho một ng&agrave;y nghỉ ngơi tr&ecirc;n b&atilde;i biển ở đảo Ph&uacute; Quốc xinh đẹp.<br />
<strong>Bồ Đ&agrave;o Nha</strong><br />
<img alt="Việt Nam lọt top 10 địa điểm trăng mật rẻ nhất thế giới - 4" src="http://www.ttcgroup.vn/media/7508/dulich-29-07-4.jpg" /><br />
Bồ Đ&agrave;o Nha l&agrave; một đất nước tự do. Ngay cả trong c&aacute;c qu&aacute;n ăn sang trọng nhất, một ly c&agrave; ph&ecirc; vẫn c&oacute; gi&aacute; dưới 1 USD (23.000VND), một vại bia cũng kh&ocirc;ng qu&aacute; 2 USD (45.000VND). C&oacute; rất nhiều khu nghỉ dưỡng nhỏ xinh dễ thương v&agrave; những trang trại được cải tạo tuyệt đẹp d&agrave;nh cho c&aacute;c cặp đ&ocirc;i chỉ dưới 100USD (khoảng 2.000.000 VND).<br />
<strong>Indonesia</strong><br />
<img alt="Việt Nam lọt top 10 địa điểm trăng mật rẻ nhất thế giới - 6" src="http://www.ttcgroup.vn/media/7509/dulich-29-07-5.jpg" /><br />
Bali l&agrave; lựa chọn nổi bật nhất với những b&atilde;i biển tuyệt vời, kh&aacute;ch sạn đẹp như tranh vẽ, văn h&oacute;a Ubud phong ph&uacute;, v&agrave; những khu lướt s&oacute;ng ho&agrave;nh tr&aacute;ng với gi&aacute; cả phải chăng. Nhưng Indonesia c&ograve;n c&oacute; tới 17.000 h&ograve;n đảo, như Lombok v&agrave; quần đảo Gili cũng l&agrave; những điểm du lịch trăng mật l&yacute; tưởng đ&aacute;ng được c&acirc;n nhắc.<br />
<strong>Đảo Honduras</strong><br />
<img alt="Việt Nam lọt top 10 địa điểm trăng mật rẻ nhất thế giới - 7" src="http://www.ttcgroup.vn/media/7510/dulich-29-07-6.jpg" /><br />
Honduras l&agrave; sự lựa chọn ng&acirc;n s&aacute;ch hợp l&yacute; của Trung Mỹ, rất dễ t&igrave;m được đồ ăn v&agrave; chỗ trọ gi&aacute; rẻ. Đ&acirc;y cũng l&agrave; một trong những nơi rẻ nhất để học lặn. H&atilde;y đến những cồn c&aacute;t trắng của Utila để lặn biển hay chỉ đơn giản l&agrave; thư gi&atilde;n ở v&ugrave;ng biển Caribean xinh đẹp; những h&ograve;n đảo gần Cayos Cochinos l&agrave; điểm trăng mật l&atilde;ng mạn nhất.<br />
<strong>Campuchia</strong><br />
<img alt="Việt Nam lọt top 10 địa điểm trăng mật rẻ nhất thế giới - 8" src="http://www.ttcgroup.vn/media/7512/dulich-29-07-7.jpg" /><br />
Chỉ với 72USD (khoảng 1.600.000VND) cho một người, c&aacute;c cặp đ&ocirc;i c&oacute; thể tận hưởng 7 ng&agrave;y kh&aacute;m ph&aacute; vẻ đẹp quyến rũ của&nbsp; Angkor Wat, khu di sản đền thờ v&agrave; rừng rậm được UNESCO c&ocirc;ng nhận. Th&ecirc;m v&agrave;o đ&oacute;, chi ph&iacute; sinh hoạt ở đ&acirc;y cũng si&ecirc;u rẻ, bia v&agrave; c&aacute;c bữa ăn chỉ khoảng 2USD (45.000VND) v&agrave; kh&aacute;ch sạn hạng sang cũng kh&ocirc;ng hề đắt.<br />
<strong>Bungari</strong><img alt="Việt Nam lọt top 10 địa điểm trăng mật rẻ nhất thế giới - 9" src="http://www.ttcgroup.vn/media/7513/dulich-29-07-8.jpg" /><br />
Quốc gia n&agrave;y c&oacute; thể kh&ocirc;ng phải l&agrave; lựa chọn du lịch trăng mật m&agrave; c&aacute;c cặp đ&ocirc;i thường nghĩ tới đầu ti&ecirc;n, nhưng lại l&agrave; địa điểm gi&aacute; rẻ bất kể m&ugrave;a n&agrave;o trong năm với d&acirc;n du lịch. Thủ đ&ocirc; Sofia c&oacute; đủ danh thắng để thu h&uacute;t d&acirc;n th&agrave;nh thị. Người muốn nghỉ h&egrave; c&oacute; thể gh&eacute; qua Biển Đen: nắng v&agrave;ng biển xanh, bia m&aacute;t gi&aacute; rẻ. C&ograve;n muốn nghỉ đ&ocirc;ng, h&atilde;y tới khu trượt tuyết tuyệt nhất nhất của ch&acirc;u &Acirc;u: Bansko v&agrave; Borovets, l&yacute; tưởng cho cả gia đ&igrave;nh với c&aacute;c qu&aacute;n ăn gi&aacute; rẻ m&agrave; thịnh soạn.<br />
<strong>Nam Phi</strong><br />
<img alt="Việt Nam lọt top 10 địa điểm trăng mật rẻ nhất thế giới - 10" src="http://www.ttcgroup.vn/media/7511/dulich-29-07-9.jpg" /><br />
Ẩm thực v&agrave; chỗ ở tr&ecirc;n khắp mọi miền đất nước xinh đẹp xa x&ocirc;i n&agrave;y đều c&oacute; gi&aacute; rẻ m&agrave; chất lượng lại tuyệt vời. Đặc biệt, c&aacute;c cặp đ&ocirc;i c&oacute; thể thăm th&uacute; những kh&aacute;ch sạn ki&ecirc;m nh&agrave; vườn sản xuất rượu vang ở Western Cape, vừa c&oacute; gi&aacute; phải chăng, lại tuyệt kh&ocirc;ng k&eacute;m so với những vườn nho nổi tiếng kh&aacute;c tr&ecirc;n thế giới. Đặc biệt, chuyến t&agrave;u chậm Shosholoza Meyl chạy gần như c&ugrave;ng một tuyến đường c&oacute; cảnh quan ngoạn mục giữa Johannesburg v&agrave; Cape Town như&nbsp; con t&agrave;u Blue Train hạng sang, nhưng gi&aacute; lại chỉ bằng một phần hai mươi.<br />
<strong>Puerto Rico</strong><br />
<img alt="Việt Nam lọt top 10 địa điểm trăng mật rẻ nhất thế giới - 11" src="http://www.ttcgroup.vn/media/7514/dulich-29-07-10.jpg" /><br />
C&oacute; c&ugrave;ng khung cảnh với thi&ecirc;n đường Caribbean đắt đỏ, nhưng quần đảo T&acirc;y Ban Nha n&agrave;y lại c&oacute; kh&aacute;ch sạn v&agrave; khu nghỉ dưỡng gi&aacute; cả phải chăng, lịch sử gi&agrave;u c&oacute;. C&ograve;n nếu muốn một tuần trăng mật l&atilde;ng mạn đến diệu kỳ, c&aacute;c cặp đ&ocirc;i c&oacute; thể ch&egrave;o thuyền kayak v&agrave;o ban đ&ecirc;m, chi&ecirc;m ngưỡng mặt biển lấp l&aacute;nh s&aacute;ng rực sinh vật ph&ugrave; du trong Vịnh Bioluminescent. Để tiết kiệm hơn nữa, h&atilde;y đi v&agrave;o tầm th&aacute;ng 5, gi&aacute; cả sẽ rẻ hơn khoảng 40% do m&ugrave;a b&atilde;o (th&aacute;ng 6-11 hằng năm), nhưng v&agrave;o th&aacute;ng 5 thời tiết vẫn rất đẹp.</p>

<p>&nbsp;</p>

<p><strong>Theo 24h</strong></p>
', N'Trang du lịch nổi tiếng Lonely Planet vừa công bố danh sách 10 địa điểm trăng có giá phải chăng nhất thế giới, trong đó có Việt Nam.', N'/DATA/images/Express/k-du-lich-nuoc-ngoai-den-vn-370x250.jpg', NULL, 1)
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([ID], [Name], [Email], [Phone], [CreateDate], [Status], [Description]) VALUES (1, N'Vinh', N'khanhvinhit', N'123456', CAST(N'2017-09-15 00:00:00.000' AS DateTime), 1, N'Sống tốt')
INSERT [dbo].[Feedback] ([ID], [Name], [Email], [Phone], [CreateDate], [Status], [Description]) VALUES (2, N'aesfrafase', N'zczvczdvdzxv@gmail.com', N'123456789', CAST(N'2017-09-15 00:00:00.000' AS DateTime), 1, N'zsczsvcfszacfv')
SET IDENTITY_INSERT [dbo].[Feedback] OFF
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'CHANGE_ACCOUNT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'CREATE_CONTENT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'CREATE_INSTRUCTION')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'CREATE_SLIDER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'CREATE_TICKER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'DELETE_CONTENT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'DELETE_INSTRUCTION')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'DELETE_SLIDER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'DELETE_TICKER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'DETAILS_ACCOUNT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'DETAILS_CONTENT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'DETAILS_INSTRUCTION')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'DETAILS_SLIDER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'DETAILS_TICKER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'EDIT_ACCOUNT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'EDIT_CONTENT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'EDIT_INSTRUCTION')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'EDIT_SLIDER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'EDIT_TICKER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'VIEW_CONTENT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'VIEW_INSTRUCTION')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'VIEW_SLIDER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MEMBER', N'VIEW_TICKER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'CHANGE_ACCOUNT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'CREATE_CONTACT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'CREATE_CONTENT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'CREATE_INSTRUCTION')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'CREATE_SLIDER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'CREATE_TICKER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DELETE_CONTACT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DELETE_CONTENT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DELETE_FEEDBACK')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DELETE_INSTRUCTION')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DELETE_REQUEST')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DELETE_SLIDER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DELETE_TICKER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DETAILS_ACCOUNT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DETAILS_CONTACT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DETAILS_CONTENT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DETAILS_FEEDBACK')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DETAILS_INSTRUCTION')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DETAILS_REQUEST')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DETAILS_SLIDER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'DETAILS_TICKER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'EDIT_ACCOUNT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'EDIT_CONTACT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'EDIT_CONTENT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'EDIT_FEEDBACK')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'EDIT_INSTRUCTION')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'EDIT_REQUEST')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'EDIT_SLIDER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'EDIT_TICKER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'VIEW_CONTACT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'VIEW_CONTENT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'VIEW_FEEDBACK')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'VIEW_INSTRUCTION')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'VIEW_REQUEST')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'VIEW_SLIDER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'MOD', N'VIEW_TICKER')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'CHANGE_ACCOUNT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'CREATE_CONTACT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'DELETE_CONTACT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'DELETE_FEEDBACK')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'DELETE_REQUEST')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'DETAILS_ACCOUNT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'DETAILS_CONTACT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'DETAILS_FEEDBACK')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'DETAILS_REQUEST')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'EDIT_ACCOUNT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'EDIT_CONTACT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'EDIT_FEEDBACK')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'EDIT_REQUEST')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'VIEW_CONTACT')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'VIEW_FEEDBACK')
INSERT [dbo].[GroupPath] ([AccountGroupID], [PathID]) VALUES (N'SERVICES', N'VIEW_REQUEST')
SET IDENTITY_INSERT [dbo].[Instruction] ON 

INSERT [dbo].[Instruction] ([ID], [Name], [CreateDate], [UserName], [Status], [Detail], [Images], [MoreImages]) VALUES (1, N'Đi Đà Lạt', CAST(N'2017-09-18 00:00:00.000' AS DateTime), N'admin', 1, N'<p>Đ&agrave; Lạt được nhiều người y&ecirc;u th&iacute;ch bởi kh&iacute; hậu m&aacute;t mẻ, danh lam thắng cảnh thơ mộng v&agrave; ngh&igrave;n hoa đua sắc quanh năm. Du kh&aacute;ch vẫn thường n&oacute;i Đ&agrave; Lạt l&agrave; nơi chưa đi th&igrave; mong chờ, đến rồi th&igrave; lưu luyến v&agrave; d&ugrave; chưa rời khỏi đ&atilde; muốn quay lại.</p>

<p>Du lịch Đ&agrave; Lạt lu&ocirc;n l&agrave; điểm đến thu h&uacute;t nhiều du kh&aacute;ch kh&ocirc;ng chỉ bởi kh&iacute; hậu m&agrave; c&ograve;n l&agrave; quang cảnh thi&ecirc;n nhi&ecirc;n tuyệt vời.Trong số c&aacute;c cảnh đẹp của Đ&agrave; Lạt,&nbsp;<strong>Thung lũng T&igrave;nh y&ecirc;u&nbsp;</strong>l&agrave; một trong những thắng cảnh Du lịch nổi tiếng đ&atilde; đi v&agrave;o tiềm thức của mỗi người d&acirc;n cũng như c&aacute;c du kh&aacute;ch từ mọi miền đất nước.&nbsp;<strong>Thung lũng t&igrave;nh y&ecirc;u</strong>&nbsp;c&aacute;ch Trung t&acirc;m th&agrave;nh phố Đ&agrave; Lạt khoảng 6 km về hướng Đ&ocirc;ng Bắc với tổng diện t&iacute;ch gần 140 ha.</p>

<hr/>
', N'/DATA/images/Instruction/1.png', NULL)
INSERT [dbo].[Instruction] ([ID], [Name], [CreateDate], [UserName], [Status], [Detail], [Images], [MoreImages]) VALUES (2, N'Đến Thung Lũng Tình Yêu', CAST(N'2017-09-18 00:00:00.000' AS DateTime), N'admin', 1, N'<p>Từ trung t&acirc;m th&agrave;nh phố Đ&agrave; Lạt, Qu&yacute; kh&aacute;ch c&oacute; thể đi xe hơi, xe m&aacute;y khoảng 15 ph&uacute;t theo hướng đường Nguyễn Văn Trỗi &ndash; B&ugrave;i Thị Xu&acirc;n ( hoặc Phan Bội Ch&acirc;u &ndash; B&ugrave;i Thị Xu&acirc;n, hoặc Phan Bội Ch&acirc;u &ndash; B&ugrave;i Thị Xu&acirc;n &ndash; Đinh Ti&ecirc;n Ho&agrave;ng ) đến Ng&atilde; 5 Đại học rồi đi hết đường Ph&ugrave; Đổng Thi&ecirc;n Vương v&agrave; rẽ phải theo đường Mai Anh Đ&agrave;o 500 m&eacute;t sẽ tới Khu Du lịch.</p>

<hr/>
', N'/DATA/images/Instruction/2.jpg', NULL)
INSERT [dbo].[Instruction] ([ID], [Name], [CreateDate], [UserName], [Status], [Detail], [Images], [MoreImages]) VALUES (3, N'Vallée D’ Amour', CAST(N'2017-09-18 00:00:00.000' AS DateTime), N'admin', 1, N'<p>Xưa kia, nơi đ&acirc;y l&agrave; một thắng cảnh hoang sơ nhưng đầy thơ mộng, với những d&ograve;ng suối nhỏ, những thảm cỏ xanh mướt v&agrave; những đồi th&ocirc;ng chập ch&ugrave;ng .., đ&acirc;y ch&iacute;nh l&agrave; nơi hẹn h&ograve; l&yacute; tưởng cho những đ&ocirc;i t&igrave;nh nh&acirc;n. V&igrave; vậy người Ph&aacute;p khi ngự trị tại Đ&agrave; Lạt đ&atilde; đặt t&ecirc;n bằng tiếng Ph&aacute;p cho thắng cảnh n&agrave;y l&agrave; Vall&eacute;e D&rsquo; Amour. Năm 1953, Thị trưởng của Đ&agrave; Lạt l&uacute;c bấy giờ đ&atilde; quyết định lấy t&ecirc;n thắng cảnh n&agrave;y bằng tiếng Việt gọi l&agrave;&nbsp;<strong>Thung lũng T&igrave;nh y&ecirc;u,&nbsp;</strong>t&ecirc;n gọi n&agrave;y tồn tại cho đến b&acirc;y giờ.</p>
<hr/>
', N'/DATA/images/Instruction/1.png', NULL)
INSERT [dbo].[Instruction] ([ID], [Name], [CreateDate], [UserName], [Status], [Detail], [Images], [MoreImages]) VALUES (4, N'Hiện nay', CAST(N'2017-09-18 00:00:00.000' AS DateTime), N'admin', 1, N'<p>Ng&agrave;y nay,&nbsp;<strong>Thung lũng T&igrave;nh y&ecirc;u</strong>&nbsp;đ&atilde; trở th&agrave;nh một trong những địa điểm Du lịch hấp dẫn v&agrave; l&yacute; tưởng nhờ được bao quanh bởi hồ nước v&agrave; đồi th&ocirc;ng lộng gi&oacute; tạo th&agrave;nh những mảng kh&ocirc;ng gian thực thực hư hư. Sự hấp dẫn của v&ugrave;ng Thung lũng n&agrave;y vốn l&agrave; n&eacute;t l&atilde;ng mạn tự nhi&ecirc;n của một kh&ocirc;ng gian xanh, non nước hữu t&igrave;nh.</p>

<p>Tại đ&acirc;y, c&oacute; h&igrave;nh ảnh đ&ocirc;i b&agrave;n tay c&ugrave;ng trao nhẫn, Đ&ocirc;i bướm hoa t&igrave;nh nh&acirc;n, Vườn c&ocirc;ng khoe sắc thắm, Phố hoa, tiểu cảnh Adam &amp; Eva độc đ&aacute;o, ấn tượng. Thung lũng T&igrave;nh Y&ecirc;u c&ograve;n l&agrave; nơi tổ chức sự kiện ng&agrave;y T&igrave;nh Nh&acirc;n (14/02) h&agrave;ng năm. Ng&agrave;y T&igrave;nh Nh&acirc;n được diễn ra tại c&acirc;y cầu t&igrave;nh y&ecirc;u nằm tr&ecirc;n Hồ Đa thiện. C&acirc;y cầu c&ograve;n l&agrave; nơi d&agrave;nh cho những đ&ocirc;i t&igrave;nh nh&acirc;n thề non, hẹn ước, gắn những chiếc ổ kh&oacute;a t&igrave;nh y&ecirc;u thể hiện sự gắn kết, bền chặt của c&aacute;c cặp đ&ocirc;i y&ecirc;u nhau. Đặc biệt Qu&yacute; kh&aacute;ch c&oacute; cơ hội chinh phục M&ecirc; Cung T&igrave;nh Y&ecirc;u với h&igrave;nh tr&aacute;i tim được xem l&agrave; M&ecirc; Cung Sinh Th&aacute;i lớn nhất Việt Nam.</p>
<hr/>
', N'/DATA/images/Instruction/3.png', NULL)
INSERT [dbo].[Instruction] ([ID], [Name], [CreateDate], [UserName], [Status], [Detail], [Images], [MoreImages]) VALUES (5, N'Điểm nhấn', CAST(N'2017-09-18 00:00:00.000' AS DateTime), N'admin', 1, N'<p>Đến với&nbsp;<strong>Thung lũng t&igrave;nh y&ecirc;u</strong>, ngo&agrave;i việc thưởng ngoạn c&aacute;c thắng cảnh thi&ecirc;n nhi&ecirc;n thơ mộng hữu t&igrave;nh với mu&ocirc;n ng&agrave;n hoa khoe sắc. Qu&yacute; kh&aacute;ch c&ograve;n được tham gia vui chơi, giải tr&iacute; với nhiều loại h&igrave;nh đa dạng v&agrave; hấp dẫn như: Đi Cano, Pedalo tr&ecirc;n hồ, Cưỡi ngựa, hoạt động cắm trại, bắn s&uacute;ng sơn, tr&ograve; chơi &ldquo;Giữ thăng bằng tr&ecirc;n d&acirc;y c&aacute;p &ndash; Highwire&rdquo;. Hiện tại,&nbsp;<strong>Thung lũng T&igrave;nh Y&ecirc;u</strong>&nbsp;c&oacute;&nbsp;<strong>xe lửa, xe s&acirc;n golf,&nbsp;</strong>xe sẽ đưa du kh&aacute;ch tham quan ho&agrave;n to&agrave;n miễn ph&iacute; tất cả những cảnh đẹp của Thung Lũng t&igrave;nh y&ecirc;u, v&agrave; l&ecirc;n ngọn đồi cao nhất l&agrave;&nbsp;<strong>&ldquo;Đồi Vọng cảnh</strong>&nbsp;&ndash; Từ đ&acirc;y du kh&aacute;ch c&oacute; thể ph&oacute;ng tầm mắt bao qu&aacute;t, ngắm to&agrave;n cảnh&nbsp;<strong>Thung lũng T&igrave;nh Y&ecirc;u</strong>&nbsp;tr&agrave;n ngập hoa&rdquo;.</p>
<hr/>
', N'/DATA/images/Instruction/4.jpg', NULL)
INSERT [dbo].[Instruction] ([ID], [Name], [CreateDate], [UserName], [Status], [Detail], [Images], [MoreImages]) VALUES (6, N'TTC World – Thung Lũng Tình Yêu', CAST(N'2017-09-18 00:00:00.000' AS DateTime), N'admin', 1, N'<p>Với sự quản l&yacute; của<em>&nbsp;</em><strong>C&ocirc;ng ty CPDL&nbsp;Th&agrave;nh Th&agrave;nh C&ocirc;ng L&acirc;m Đồng</strong><em>,&nbsp;</em>bộ mặt của Khu Du lịch đ&atilde; từng bước thay đổi theo hướng xanh &ndash; sạch &ndash; đẹp,&nbsp;<strong>Thung Lũng T&igrave;nh Y&ecirc;u</strong>&nbsp;giờ đ&acirc;y đ&atilde; trở th&agrave;nh một trong những địa điểm tham quan, d&atilde; ngoại, vui chơi giải tr&iacute; kh&ocirc;ng thể thiếu trong chương tr&igrave;nh&nbsp;Tour&nbsp; Du lịch Đ&agrave; Lạt&nbsp;của du kh&aacute;ch từ mọi miền đất nước đến với Th&agrave;nh phố Đ&agrave; Lạt Mộng Mơ.</p>
<hr/>', N'/DATA/images/Instruction/21.png', NULL)
SET IDENTITY_INSERT [dbo].[Instruction] OFF
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'CHANGE_ACCOUNT', N'Thay đổi mật khẩu')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'CREATE_ACCOUNT', N'Thêm tài khoản')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'CREATE_CONTACT', N'Thêm liên hệ')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'CREATE_CONTENT', N'Thêm nội dung')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'CREATE_INSTRUCTION', N'Thêm giới thiệu')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'CREATE_SLIDER', N'Thêm trình ảnh')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'CREATE_TICKER', N'Thêm bảng giá')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DELETE_ACCOUNT', N'Xóa tài khoản')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DELETE_CONTACT', N'Xóa liên hệ')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DELETE_CONTENT', N'Xóa nội dung')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DELETE_FEEDBACK', N'Xóa yêu cầu')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DELETE_INSTRUCTION', N'Xóa giới thiệu')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DELETE_REQUEST', N'Xóa phản hồi')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DELETE_SLIDER', N'Xóa trình ảnh')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DELETE_TICKER', N'Xóa bảng giá')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DETAILS_ACCOUNT', N'Xem chi tiết tài khoản')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DETAILS_CONTACT', N'Xem chi tiết liên hệ')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DETAILS_CONTENT', N'Xem chi tiết nội dung')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DETAILS_FEEDBACK', N'Xem chi tiết yêu cầu')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DETAILS_INSTRUCTION', N'Xem chi tiết giới thiệu')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DETAILS_REQUEST', N'Xem chi tiết phản hồi')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DETAILS_SLIDER', N'Xem chi tiết trình ảnh')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'DETAILS_TICKER', N'Xem chi tiết bảng giá')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'EDIT_ACCOUNT', N'Sửa tài khoản')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'EDIT_CONTACT', N'Sửa liên hệ')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'EDIT_CONTENT', N'Sửa nội dung')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'EDIT_FEEDBACK', N'Xem chi tiết yêu cầu')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'EDIT_INSTRUCTION', N'Sửa giới thiệu')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'EDIT_REQUEST', N'Xóa phản hồi')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'EDIT_SLIDER', N'Sửa trình ảnh')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'EDIT_TICKER', N'Sửa bảng giá')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'VIEW_ACCOUNT', N'Xem tài khoản')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'VIEW_CONTACT', N'Xem liên hệ')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'VIEW_CONTENT', N'Xem nội dung')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'VIEW_FEEDBACK', N'Xem chi tiết yêu cầu')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'VIEW_INSTRUCTION', N'Xem giới thiệu')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'VIEW_REQUEST', N'Xem chi tiết phản hồi')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'VIEW_SLIDER', N'Xem trình ảnh')
INSERT [dbo].[Path] ([ID], [Name]) VALUES (N'VIEW_TICKER', N'Xem bảng giá')
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([ID], [Name], [Phone], [Email], [CreateDate], [Status], [ContentID], [Detail], [MoreImages]) VALUES (1, N'Vinh', N'123456', N'khanhvinhit@gmail.com', CAST(N'2017-09-15 00:00:00.000' AS DateTime), 1, 1, N'Trên Cao nguyên với độ cao hơn 1500m so với mặt nước biển, du khách vẫn có thể du ngoạn bằng xe Lửa cổ, xe Jeep, xe Điện.', N'<Images><Image>/DATA/Upload/1-k-du-lich-nuoc-ngoai-den-vn-370x250.jpg</Image><Image>/DATA/Upload/1-XE-LUA.jpg</Image></Images>')
INSERT [dbo].[Request] ([ID], [Name], [Phone], [Email], [CreateDate], [Status], [ContentID], [Detail], [MoreImages]) VALUES (2, N'Vinh ka', N'123456789', N'khanhvinhit@gmail.com', CAST(N'2017-09-15 00:00:00.000' AS DateTime), 1, 1, N'Ahihi Đẹp lắm', N'<Images><Image>/DATA/Upload/2-anh-quan-oi-dung-so-v-1504763467-400.jpg</Image><Image>/DATA/Upload/2-chuyen-do-hoi-kho-1504880395-400.jpg</Image></Images>')
INSERT [dbo].[Request] ([ID], [Name], [Phone], [Email], [CreateDate], [Status], [ContentID], [Detail], [MoreImages]) VALUES (3, N'Vinh', N'01634141300', N'khanhvinhit@gmail.com', CAST(N'2017-09-18 00:00:00.000' AS DateTime), 1, 2, N'Thú vị, thử thách người chơi!', N'<Images><Image>/DATA/Upload/3-21557793_1945664422425482_5881026006499851471_n.jpg</Image></Images>')
SET IDENTITY_INSERT [dbo].[Request] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([ID], [Name], [DisplayOrder], [Link], [ContentID], [CreateDate], [UserName], [Status], [Description]) VALUES (1, N'VẬN CHUYỂN TRONG KHU DU LỊCH BẰNG XE LỬA', 1, N'/DATA/images/Slider/XE-LUA.jpg', 1, CAST(N'2017-09-15 00:00:00.000' AS DateTime), N'admin', 1, N'Trên Cao nguyên với độ cao hơn 1500m so với mặt nước biển, du khách vẫn có thể du ngoạn bằng xe Lửa cổ, xe Jeep, xe Điện.')
INSERT [dbo].[Slider] ([ID], [Name], [DisplayOrder], [Link], [ContentID], [CreateDate], [UserName], [Status], [Description]) VALUES (2, N'VẬN CHUYỂN TRONG KHU DU LỊCH BẰNG XE JEEP', 2, N'/DATA/images/Slider/XE-DIEN.jpg', 1, CAST(N'2017-09-15 00:00:00.000' AS DateTime), N'admin', 1, N'Trên Cao nguyên với độ cao hơn 1500m so với mặt nước biển, du khách vẫn có thể du ngoạn bằng xe Lửa cổ, xe Jeep, xe Điện.')
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[Ticker] ON 

INSERT [dbo].[Ticker] ([ID], [Name], [CreateDate], [UserName], [Status], [Type], [Quantity], [Price], [Description]) VALUES (1, N'Du lịch bằng xe Jeep.', CAST(N'2017-09-15 00:00:00.000' AS DateTime), N'admin', 1, 1, 5, CAST(1500000 AS Decimal(18, 0)), N'5 người trên một xe, quý khách có thể được chở vòng quanh hồ!')
SET IDENTITY_INSERT [dbo].[Ticker] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AccountGroupID]    Script Date: 9/18/2017 9:17:54 PM ******/
CREATE NONCLUSTERED INDEX [IX_AccountGroupID] ON [dbo].[Account]
(
	[AccountGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Account_dbo.AccountGroup_AccountGroupID] FOREIGN KEY([AccountGroupID])
REFERENCES [dbo].[AccountGroup] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_dbo.Account_dbo.AccountGroup_AccountGroupID]
GO
USE [master]
GO
ALTER DATABASE [TLTY] SET  READ_WRITE 
GO
