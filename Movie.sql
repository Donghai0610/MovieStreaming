USE [master]
GO
/****** Object:  Database [movie]    Script Date: 3/14/2024 11:22:15 AM ******/
CREATE DATABASE [movie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'movie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DONGHAI\MSSQL\DATA\movie.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'movie_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.DONGHAI\MSSQL\DATA\movie_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [movie] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [movie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [movie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [movie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [movie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [movie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [movie] SET ARITHABORT OFF 
GO
ALTER DATABASE [movie] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [movie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [movie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [movie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [movie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [movie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [movie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [movie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [movie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [movie] SET  ENABLE_BROKER 
GO
ALTER DATABASE [movie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [movie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [movie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [movie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [movie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [movie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [movie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [movie] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [movie] SET  MULTI_USER 
GO
ALTER DATABASE [movie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [movie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [movie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [movie] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [movie] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [movie] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'movie', N'ON'
GO
ALTER DATABASE [movie] SET QUERY_STORE = OFF
GO
USE [movie]
GO
/****** Object:  Schema [mydb]    Script Date: 3/14/2024 11:22:15 AM ******/
CREATE SCHEMA [mydb]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/14/2024 11:22:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/14/2024 11:22:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[comment] [nvarchar](max) NOT NULL,
	[commentDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 3/14/2024 11:22:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[price] [float] NULL,
	[image] [varchar](50) NULL,
	[describe] [nvarchar](max) NULL,
	[actor] [nvarchar](100) NULL,
	[director] [nvarchar](max) NULL,
	[release] [date] NULL,
	[linkmovie] [nvarchar](max) NULL,
	[view] [int] NULL,
	[cid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/14/2024 11:22:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[movie_id] [int] NULL,
	[userID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/14/2024 11:22:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[phonenum] [nvarchar](10) NULL,
	[avatar] [varchar](50) NULL,
	[role] [int] NULL,
	[password] [varchar](36) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vn_Pay]    Script Date: 3/14/2024 11:22:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vn_Pay](
	[userID] [int] NULL,
	[movieID] [int] NULL,
	[Vn_gd] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Vn_gd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 3/14/2024 11:22:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[u_id] [int] NOT NULL,
	[wishlistDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishListItem]    Script Date: 3/14/2024 11:22:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishListItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[movieId] [int] NOT NULL,
	[w_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Action')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Adventure')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Anime')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'Comedy')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Drama')
INSERT [dbo].[Category] ([id], [name]) VALUES (10, N'Honor')
INSERT [dbo].[Category] ([id], [name]) VALUES (19, N'Romantic')
INSERT [dbo].[Category] ([id], [name]) VALUES (20, N'Sport')
INSERT [dbo].[Category] ([id], [name]) VALUES (21, N'Sci-Action')
INSERT [dbo].[Category] ([id], [name]) VALUES (22, N'Amimation')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (12, 2003, 4, N'Phim con nhót mót chồng này quá anh em ơi
', CAST(N'2023-07-18T21:33:28.263' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (13, 2003, 5, N'Phim này hay lắm nha nên em nha anh em
', CAST(N'2023-07-18T22:02:05.467' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (14, 2004, 6, N'Trời ơi ước gì được xem phim này sớm hơn', CAST(N'2023-07-18T22:02:20.837' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (15, 2005, 7, N'Phim này đệ nhứt số một rồi ', CAST(N'2023-07-18T22:07:03.747' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (16, 2005, 8, N'Doraemon ơi
', CAST(N'2023-07-18T22:53:24.503' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (17, 2004, 7, N'Ước gì doraemon có ngoài đời hihi', CAST(N'2023-07-18T23:53:08.163' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (21, 2008, 8, N'Yêu Doraemon quá đi thoaiiiii ', CAST(N'2023-07-19T13:09:35.057' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (22, 2, 7, N'Phim này hay lắm nè chồ ô', CAST(N'2023-07-19T13:30:38.757' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (23, 1003, 5, N'xem phim này đi hay lắm nha mng ', CAST(N'2023-07-19T13:31:00.587' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (24, 1006, 4, N'Phim này đỉnh lắm nha anh em
', CAST(N'2023-07-19T22:23:48.630' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (26, 1006, 8, N'Tôi yêu phim Việt Nam quá đi mất 
', CAST(N'2023-07-19T22:26:40.953' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (29, 1003, 11, N'Vinh râu diễn hay quá ạ ', CAST(N'2023-07-19T23:22:08.253' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (31, 2008, 12, N'Ribi sachi sao mà đỉnh quá dị nè', CAST(N'2023-07-19T23:24:19.953' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (32, 2008, 13, N'Yêu phim quá', CAST(N'2023-07-19T23:24:25.980' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (33, 2008, 15, N'Thích nhất là thái vũ đó nha', CAST(N'2023-07-19T23:24:41.997' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (34, 2008, 15, N'Coi phim hơi sợ ma nha ', CAST(N'2023-07-19T23:39:13.180' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (35, 1008, 13, N'Nhìn thái vũ ghét quá', CAST(N'2023-07-19T23:40:50.413' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (36, 1008, 12, N'Video này thật tuyệt vời! Cảm ơn tác giả đã chia sẻ kiến thức bổ ích này với chúng ta.

', CAST(N'2023-07-21T01:40:06.387' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (37, 1008, 13, N'Tôi thực sự cảm phục sự cống hiến và nỗ lực của nhà làm video. Đây là một tác phẩm đáng để xem', CAST(N'2023-07-21T01:40:32.593' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (38, 1008, 15, N'Người thực hiện video đã thể hiện rõ sự chuyên nghiệp và tâm huyết trong mỗi khung hình. Rất thích!', CAST(N'2023-07-21T01:41:02.870' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (39, 1006, 16, N'Nội dung video rất thú vị và hấp dẫn. Tôi đã học được nhiều điều bổ ích từ nó.', CAST(N'2023-07-21T01:41:18.667' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (40, 2005, 17, N'Video này đưa ra cái nhìn rất sáng suốt về vấn đề. Hy vọng nó sẽ được lan truyền rộng rãi.', CAST(N'2023-07-21T01:41:52.427' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (41, 1008, 4, N'Phim này hay lắm giờ mới được xem hihi
', CAST(N'2023-07-24T00:23:36.903' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (78, 1008, 4, N'Phim mắc quá ', CAST(N'2023-08-03T15:38:23.233' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (80, 1008, 4, N'Phim miễn phí lại còn hay ahh ~~', CAST(N'2023-08-04T18:03:37.530' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (81, 1006, 5, N'Phim hay quá ', CAST(N'2023-08-05T02:34:28.490' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (82, 1006, 7, N'Ôi phim hay quá ', CAST(N'2023-08-05T02:34:43.250' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (83, 1008, 8, N'Trời ơi ghiền ghê luôn ', CAST(N'2023-08-05T02:35:04.870' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (85, 2004, 11, N'Phim hay quá
', CAST(N'2023-08-08T17:03:37.300' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (86, 2004, 4, N'fafaefae', CAST(N'2023-08-08T17:03:45.607' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (88, 1, 24, N'dddd', CAST(N'2023-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (93, 2023, 11, N'yeah', CAST(N'2023-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (94, 2019, 8, N'sfsfs
', CAST(N'2023-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (95, 2019, 4, N'<p><strong>Nice</strong></p>

<div id="tudienjp">
<div class="o-search-mobile" style="top: 0px; left: 0px; display: none;"><svg height="32px" version="1.1" viewbox="0 0 40 40" width="32px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g id="surface1"><path d="M 39.085938 34.664062 L 29.734375 25.3125 C 31.859375 22.15625 32.910156 18.210938 32.347656 14.007812 C 31.390625 6.859375 25.53125 1.039062 18.375 0.132812 C 7.734375 -1.210938 -1.210938 7.734375 0.132812 18.375 C 1.039062 25.535156 6.859375 31.398438 14.007812 32.351562 C 18.210938 32.914062 22.15625 31.863281 25.3125 29.738281 L 34.664062 39.089844 C 35.886719 40.308594 37.863281 40.308594 39.085938 39.089844 C 40.304688 37.867188 40.304688 35.882812 39.085938 34.664062 Z M 6.179688 16.25 C 6.179688 10.734375 10.664062 6.25 16.179688 6.25 C 21.695312 6.25 26.179688 10.734375 26.179688 16.25 C 26.179688 21.765625 21.695312 26.25 16.179688 26.25 C 10.664062 26.25 6.179688 21.765625 6.179688 16.25 Z M 6.179688 16.25 " style="stroke: none; fill-rule: nonzero; fill: rgb(0, 0, 0); fill-opacity: 1;"></path></g></svg></div>

<div class="o-popup-tag o-bg-white o-border o-rounded o-shadow" style="width: 400px; top: 0px; left: 0px; display: none;">
<div><button aria-label="Close" class="btn-sm o-btn-close o-position-absolute o-top-0 o-end-0 o-mt-1 o-me-1" type="button"></button>

<ul class="o-nav o-nav-tabs o-pop-nav" role="tablist"><svg aria-hidden="true" class="o-pop-speak o-svg-inline--fa" data-icon="volume-high" focusable="false" role="img" viewbox="0 0 640 512" xmlns="http://www.w3.org/2000/svg"><span><path d="M533.6 32.5C598.5 85.3 640 165.8 640 256s-41.5 170.8-106.4 223.5c-10.3 8.4-25.4 6.8-33.8-3.5s-6.8-25.4 3.5-33.8C557.5 398.2 592 331.2 592 256s-34.5-142.2-88.7-186.3c-10.3-8.4-11.8-23.5-3.5-33.8s23.5-11.8 33.8-3.5zM473.1 107c43.2 35.2 70.9 88.9 70.9 149s-27.7 113.8-70.9 149c-10.3 8.4-25.4 6.8-33.8-3.5s-6.8-25.4 3.5-33.8C475.3 341.3 496 301.1 496 256s-20.7-85.3-53.2-111.8c-10.3-8.4-11.8-23.5-3.5-33.8s23.5-11.8 33.8-3.5zm-60.5 74.5C434.1 199.1 448 225.9 448 256s-13.9 56.9-35.4 74.5c-10.3 8.4-25.4 6.8-33.8-3.5s-6.8-25.4 3.5-33.8C393.1 284.4 400 271 400 256s-6.9-28.4-17.7-37.3c-10.3-8.4-11.8-23.5-3.5-33.8s23.5-11.8 33.8-3.5zM301.1 34.8C312.6 40 320 51.4 320 64V448c0 12.6-7.4 24-18.9 29.2s-25 3.1-34.4-5.3L131.8 352H64c-35.3 0-64-28.7-64-64V224c0-35.3 28.7-64 64-64h67.8L266.7 40.1c9.4-8.4 22.9-10.4 34.4-5.3z" fill="currentColor"></path></span></svg>
	<li class="o-nav-item" role="presentation">
	<div aria-selected="true" class="o-nav-link active" data-bs-toggle="tab">Từ vựng</div>
	</li>
	<li class="o-nav-item" role="presentation">
	<div aria-selected="false" class="o-nav-link" data-bs-toggle="tab">H&aacute;n tự</div>
	</li>
	<li class="o-nav-item" role="presentation">
	<div aria-selected="false" class="o-nav-link" data-bs-toggle="tab">Dịch</div>
	</li>
</ul>

<div class="o-selected-result o-pt-1">
<div>Đang t&igrave;m kiếm ...</div>

<div class="o-fs-6 o-mt-2" style="line-height: 1.7;">
<div class="o-float-start">
<div class="o-form-check"><input class="o-form-check-input" id="flexCheckTudienjpLang" type="checkbox" /><label for="flexCheckTudienjpLang"> Tiếng Anh </label></div>
</div>

<div class="o-float-end o-me-1"><a class="o-link-secondary o-text-decoration-none" href="https://tudienjp.com/" target="_blank">Từ điển JP</a></div>
</div>
</div>
</div>
</div>
</div>

<div id="tudienjpOff">&nbsp;</div>
', CAST(N'2023-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (96, 1, 9, N'<p>fff</p>
', CAST(N'2023-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (97, 1, 17, N'<p>yeah hay qua</p>

<div id="tudienjp">
<div class="o-search-mobile" style="top: 0px; left: 0px; display: none;"><svg height="32px" version="1.1" viewbox="0 0 40 40" width="32px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"><g id="surface1"><path d="M 39.085938 34.664062 L 29.734375 25.3125 C 31.859375 22.15625 32.910156 18.210938 32.347656 14.007812 C 31.390625 6.859375 25.53125 1.039062 18.375 0.132812 C 7.734375 -1.210938 -1.210938 7.734375 0.132812 18.375 C 1.039062 25.535156 6.859375 31.398438 14.007812 32.351562 C 18.210938 32.914062 22.15625 31.863281 25.3125 29.738281 L 34.664062 39.089844 C 35.886719 40.308594 37.863281 40.308594 39.085938 39.089844 C 40.304688 37.867188 40.304688 35.882812 39.085938 34.664062 Z M 6.179688 16.25 C 6.179688 10.734375 10.664062 6.25 16.179688 6.25 C 21.695312 6.25 26.179688 10.734375 26.179688 16.25 C 26.179688 21.765625 21.695312 26.25 16.179688 26.25 C 10.664062 26.25 6.179688 21.765625 6.179688 16.25 Z M 6.179688 16.25 " style="stroke: none; fill-rule: nonzero; fill: rgb(0, 0, 0); fill-opacity: 1;"></path></g></svg></div>

<div class="o-popup-tag o-bg-white o-border o-rounded o-shadow" style="width: 400px; top: 0px; left: 0px; display: none;">
<div><button aria-label="Close" class="btn-sm o-btn-close o-position-absolute o-top-0 o-end-0 o-mt-1 o-me-1" type="button"></button>

<ul class="o-nav o-nav-tabs o-pop-nav" role="tablist"><svg aria-hidden="true" class="o-pop-speak o-svg-inline--fa" data-icon="volume-high" focusable="false" role="img" viewbox="0 0 640 512" xmlns="http://www.w3.org/2000/svg"><span><path d="M533.6 32.5C598.5 85.3 640 165.8 640 256s-41.5 170.8-106.4 223.5c-10.3 8.4-25.4 6.8-33.8-3.5s-6.8-25.4 3.5-33.8C557.5 398.2 592 331.2 592 256s-34.5-142.2-88.7-186.3c-10.3-8.4-11.8-23.5-3.5-33.8s23.5-11.8 33.8-3.5zM473.1 107c43.2 35.2 70.9 88.9 70.9 149s-27.7 113.8-70.9 149c-10.3 8.4-25.4 6.8-33.8-3.5s-6.8-25.4 3.5-33.8C475.3 341.3 496 301.1 496 256s-20.7-85.3-53.2-111.8c-10.3-8.4-11.8-23.5-3.5-33.8s23.5-11.8 33.8-3.5zm-60.5 74.5C434.1 199.1 448 225.9 448 256s-13.9 56.9-35.4 74.5c-10.3 8.4-25.4 6.8-33.8-3.5s-6.8-25.4 3.5-33.8C393.1 284.4 400 271 400 256s-6.9-28.4-17.7-37.3c-10.3-8.4-11.8-23.5-3.5-33.8s23.5-11.8 33.8-3.5zM301.1 34.8C312.6 40 320 51.4 320 64V448c0 12.6-7.4 24-18.9 29.2s-25 3.1-34.4-5.3L131.8 352H64c-35.3 0-64-28.7-64-64V224c0-35.3 28.7-64 64-64h67.8L266.7 40.1c9.4-8.4 22.9-10.4 34.4-5.3z" fill="currentColor"></path></span></svg>
	<li class="o-nav-item" role="presentation">
	<div aria-selected="true" class="o-nav-link active" data-bs-toggle="tab">Từ vựng</div>
	</li>
	<li class="o-nav-item" role="presentation">
	<div aria-selected="false" class="o-nav-link" data-bs-toggle="tab">H&aacute;n tự</div>
	</li>
	<li class="o-nav-item" role="presentation">
	<div aria-selected="false" class="o-nav-link" data-bs-toggle="tab">Dịch</div>
	</li>
</ul>

<div class="o-selected-result o-pt-1">
<div>Đang t&igrave;m kiếm ...</div>

<div class="o-fs-6 o-mt-2" style="line-height: 1.7;">
<div class="o-float-start">
<div class="o-form-check"><input class="o-form-check-input" id="flexCheckTudienjpLang" type="checkbox" /><label for="flexCheckTudienjpLang"> Tiếng Anh </label></div>
</div>

<div class="o-float-end o-me-1"><a class="o-link-secondary o-text-decoration-none" href="https://tudienjp.com/" target="_blank">Từ điển JP</a></div>
</div>
</div>
</div>
</div>
</div>

<div id="tudienjpOff">&nbsp;</div>
', CAST(N'2023-11-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (98, 2019, 9, N'<ol>
	<li style="background: rgb(238, 238, 238); border: 1px solid rgb(204, 204, 204); padding: 5px 10px;">hay qua</li>
</ol>
', CAST(N'2023-11-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Comment] ([id], [userId], [videoId], [comment], [commentDate]) VALUES (99, 2023, 9, N'<p><strong>non</strong></p>
', CAST(N'2023-11-09T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (4, N'Toy Story 3', 29, N'images/toy_story.jpg', N'The toys are mistakenly delivered to a day-care center instead of the attic right before Andy leaves for college, and it''s up to Woody to convince the other toys that they weren''t abandoned and to return home.', N'Tom Hanks,Tim Allen,Joan Cusack', N'Lee Unkrich', CAST(N'2010-01-01' AS Date), N'https://www.youtube.com/embed/wmiIUN-7qhE?si=Q6X1CHYe2ZuDF3y2', 45, 3)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (5, N'Oppenheimer', 21, N'images/op.jpg', N'The story of American scientist, J. Robert Oppenheimer, and his role in the development of the atomic bomb.', N'Cillian Murphy,Emily Blunt,Robert Downey Jr.', N'asgasgsag', CAST(N'2023-01-01' AS Date), N'https://www.youtube.com/embed/uYPbbksJxIg?si=j_Z92mzy_3D_qGSn', 4324, 4)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (6, N'Spider-Man: Across the Spider-Verse', 30, N'images/spider.jpg', N'Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence. When the heroes clash on how to handle a new threat, Miles must redefine what it means to be a hero.', N'Shameik Moore,Hailee Steinfeld,Brian Tyree Henry', N'asgasgasg', CAST(N'2022-01-01' AS Date), N'https://www.youtube.com/embed/shW9i6k8cB0?si=Pv4Yc_C5dVYD87OJ', 134, 1)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (7, N'Talk to Me', 23, N'images/talk_to_me.jpg', N'When a group of friends discover how to conjure spirits using an embalmed hand, they become hooked on the new thrill, until one of them goes too far and unleashes terrifying supernatural forces.', N'Ari McCarthy,Hamish Phillips,Sarah Brokensha', N'safasfa', CAST(N'2022-01-01' AS Date), N'https://www.youtube.com/embed/aLAKJu9aJys?si=fAo_4z3hqhhgNvxi', 1234, 6)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (8, N'Interstellar', 24, N'images/Interstellar.jpg', N'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.', N'Ellen Burstyn,Matthew McConaughey,Mackenzie Foy', N'asfasfafs', CAST(N'2014-01-01' AS Date), N'https://www.youtube.com/embed/zSWdZVtXT7E?si=g21GcW730Dfnqmml', 121, 6)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (9, N'Miracle in Cell No. 7', 32, N'images/miracle_7.jpg', N'A story about the love between a mentally-ill father and his lovingly adorable daughter.', N'Seung-ryong Ryu,	Kal So-won,Dal-su Oh', N'safasf', CAST(N'2013-01-01' AS Date), N'https://youtu.be/h9MGZFy-gog?si=rVoUIQIRs9kajCu0', 51, 6)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (10, N'Train to Busan', 0, N'images/train_to_busan.jpg', N'While a zombie virus breaks out in South Korea, passengers struggle to survive on the train from Seoul to Busan.', N'Su-an Kim, Gong Yoo, Jung Yu-mi, Ma Dong-seok', N'Sang-ho Yeon', CAST(N'2016-02-12' AS Date), N'https://www.youtube.com/embed/pyWuHv2-Abk?si=TOG3_kaL0RB7BTTz', 33, 22)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (11, N'Oppenheimer', 21, N'images/op.jpg', N'The story of American scientist, J. Robert Oppenheimer, and his role in the development of the atomic bomb.', N'Cillian Murphy,Emily Blunt,Robert Downey Jr.', N'asgasgsag', CAST(N'2023-01-01' AS Date), N'https://www.youtube.com/embed/uYPbbksJxIg?si=j_Z92mzy_3D_qGSn', 1, 1)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (12, N'Spider-Man: Across the Spider-Verse', 30, N'images/spider.jpg', N'Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence. When the heroes clash on how to handle a new threat, Miles must redefine what it means to be a hero.', N'Shameik Moore,Hailee Steinfeld,Brian Tyree Henry', N'asgasgasg', CAST(N'2022-01-01' AS Date), N'https://youtu.be/shW9i6k8cB0?si=HCXmtMFFkhbi-b0R', 44, 2)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (13, N'Talk to Me', 23, N'images/talk_to_me.jpg', N'When a group of friends discover how to conjure spirits using an embalmed hand, they become hooked on the new thrill, until one of them goes too far and unleashes terrifying supernatural forces.', N'Ari McCarthy,Hamish Phillips,Sarah Brokensha', N'safasfa', CAST(N'2022-01-01' AS Date), N'https://www.youtube.com/embed/aLAKJu9aJys?si=fAo_4z3hqhhgNvxi', 553, 2)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (14, N'Interstellar', 24, N'images/gallery-9.jpg', N'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.', N'Ellen Burstyn,Matthew McConaughey,Mackenzie Foy', N'asfasfafs', CAST(N'2014-01-01' AS Date), N'https://www.youtube.com/embed/zSWdZVtXT7E?si=g21GcW730Dfnqmml', 22, 1)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (15, N'Miracle in Cell No. 7', 32, N'images/miracle_7.jpg', N'A story about the love between a mentally-ill father and his lovingly adorable daughter.', N'Seung-ryong Ryu,	Kal So-won,Dal-su Oh', N'safasf', CAST(N'2013-01-01' AS Date), N'https://youtu.be/h9MGZFy-gog?si=rVoUIQIRs9kajCu0', 11, 2)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (16, N'Oppenheimer', 21, N'images/op.jpg', N'The story of American scientist, J. Robert Oppenheimer, and his role in the development of the atomic bomb.', N'Cillian Murphy,Emily Blunt,Robert Downey Jr.', N'asgasgsag', CAST(N'2023-01-01' AS Date), N'https://www.youtube.com/embed/uYPbbksJxIg?si=j_Z92mzy_3D_qGSn', 224, 2)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (17, N'Spider-Man: Across the Spider-Verse', 30, N'images/spider.jpg', N'Miles Morales catapults across the Multiverse, where he encounters a team of Spider-People charged with protecting its very existence. When the heroes clash on how to handle a new threat, Miles must redefine what it means to be a hero.', N'Shameik Moore,Hailee Steinfeld,Brian Tyree Henry', N'asgasgasg', CAST(N'2022-01-01' AS Date), N'https://www.youtube.com/embed/shW9i6k8cB0?si=Pv4Yc_C5dVYD87OJ', 4, 22)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (18, N'Talk to Me', 23, N'images/talk_to_me.jpg', N'When a group of friends discover how to conjure spirits using an embalmed hand, they become hooked on the new thrill, until one of them goes too far and unleashes terrifying supernatural forces.', N'Ari McCarthy,Hamish Phillips,Sarah Brokensha', N'safasfa', CAST(N'2022-01-01' AS Date), N'https://www.youtube.com/embed/aLAKJu9aJys?si=fAo_4z3hqhhgNvxi', 24, 21)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (19, N'Interstellar', 24, N'images//Interstellar.jpg', N'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.', N'Ellen Burstyn,Matthew McConaughey,Mackenzie Foy', N'asfasfafs', CAST(N'2014-01-01' AS Date), N'https://www.youtube.com/embed/zSWdZVtXT7E?si=g21GcW730Dfnqmml', 42, 19)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (20, N'Miracle in Cell No. 7', 32, N'images/gallery-11.jpg', N'A story about the love between a mentally-ill father and his lovingly adorable daughter.', N'Seung-ryong Ryu,	Kal So-won,Dal-su Oh', N'safasf', CAST(N'2013-01-01' AS Date), N'https://youtu.be/h9MGZFy-gog?si=rVoUIQIRs9kajCu0', 6556, 10)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (21, N'Parasite', 0, N'images/Parasite-scaled.jpg', N'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.', N'Song Kang-ho,Lee Sun-kyun,Cho Yeo-jeong', N'
Bong Joon Ho', CAST(N'2019-05-21' AS Date), N'https://www.youtube.com/embed/isOGD_7hNIY?si=MKsVCD0egdKDi6EX', 4442, 6)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (22, N'Black Panther', 12, N'images/panther.jpg', N'T''Challa, heir to the hidden but advanced kingdom of Wakanda, must step forward to lead his people into a new future and must confront a challenger from his country''s past.', N'Chadwick Boseman', N'
Ryan Coogler', CAST(N'2018-01-29' AS Date), N'https://www.youtube.com/embed/APwecL1rqwQ?si=JfXOvrdmAYg4cx2P', 12345, 1)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (23, N'

Shang-Chi and the Legend of the Ten Rings', 42, N'images/shang-chi.jpg', N'Shang-Chi, the master of weaponry-based Kung Fu, is forced to confront his past after being drawn into the Ten Rings organization.', N'
Simu LiuAwkwafinaTony ,Leung,Chiu-wai', N'Destin Daniel', CAST(N'2021-06-06' AS Date), N'https://www.youtube.com/embed/giWIr7U1deA?si=wGfgX-uHrD-Ox470', 2112, 2)
INSERT [dbo].[Movie] ([ID], [name], [price], [image], [describe], [actor], [director], [release], [linkmovie], [view], [cid]) VALUES (24, N'The Lord of the Rings: The Rings of Power', 0, N'images/LOTR.jpg', N'Epic drama set thousands of years before the events of J.R.R. Tolkien''s ''The Hobbit'' and ''The Lord of the Rings'' follows an ensemble cast of characters, both familiar and new, as they confront the long-feared re-emergence of evil to Middle-earth.', N'Patrick McKayJohn D. Payne', N'Morfydd ClarkMike WoodIsmael Cruz Cordova', CAST(N'2022-09-01' AS Date), N'https://www.youtube.com/embed/x8UAUAuKNcU?si=DQSviLXLN5MJTwQS', 1212, 1)
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
INSERT [dbo].[Orders] ([movie_id], [userID]) VALUES (23, 2019)
INSERT [dbo].[Orders] ([movie_id], [userID]) VALUES (12, 2019)
INSERT [dbo].[Orders] ([movie_id], [userID]) VALUES (9, 2019)
INSERT [dbo].[Orders] ([movie_id], [userID]) VALUES (15, 2023)
INSERT [dbo].[Orders] ([movie_id], [userID]) VALUES (9, 2023)
INSERT [dbo].[Orders] ([movie_id], [userID]) VALUES (6, 2024)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (1, N'hai', N'Nguyen Tuan Hong Dong Hai', N'no.72bylc@gmail.com', N'0395931502', N'images/batman_icon.png', 1, N'123456')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (2, N'maura', N'Maura', N'maura@gmail.com', N'0123456789', N'images/batman_icon.png', 2, N'1234321')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (1003, N'tupv', N'PhanVietTu', N'tupv@gmail.com', N'0123123123', N'images/batman_icon.png', 2, N'123123')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (1006, N'linhmp', N'MaiPhuongLinh', N'linhmp@gmail.com', N'0123412341', N'images/batman_icon.png', 2, N'123123')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (1008, N'linhnt', N'NguyenTuanLinh', N'linhnt@gmail.com', N'0123123456', N'images/batman_icon.png', 2, N'123123')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (2003, N'khanhcd', N'CanDuyKhanh', N'khanhcd@gmail.com', N'0112334556', N'images/batman_icon.png', 2, N'123123')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (2004, N'giangmn', N'MaiNgocGiang', N'giangmn@gmail.com', N'0123456123', N'images/batman_icon.png', 2, N'123123')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (2005, N'donghai', N'Nguyen Tuan Hong Dong Hai', N'hainth@gmail.com', N'0123124112', N'images/batman_icon.png', 1, N'123456789')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (2008, N'haidong', N'Nguyen Hai', N'haintuhasf@gmail.com', N'1332201222', N'images/batman_icon.png', 2, N'123')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (2009, N'tanphat', NULL, NULL, NULL, N'images/batman_icon.png', 2, N'123')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (2018, N'nguyenhai2003', NULL, NULL, NULL, N'images/batman_icon.png', 2, N'123')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (2019, N'quang.ga.7a3', N'dddad', N'aas', N'donghai', N'images/cho-long.jpg', 2, N'1234')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (2020, N'safasfasf', NULL, NULL, NULL, N'images/batman_icon.png', 2, N'123')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (2023, N'spiderman', NULL, NULL, NULL, N'images/batman_icon.png', 2, N'123')
INSERT [dbo].[User] ([id], [name], [fullname], [email], [phonenum], [avatar], [role], [password]) VALUES (2024, N'tanphat123', NULL, NULL, NULL, N'images/batman_icon.png', 2, N'123')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2024, 19, N'04621487')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2019, 9, N'05836330')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2019, 5, N'09345642')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2023, 15, N'22140536')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2019, 8, N'26190752')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2019, 12, N'35349161')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2019, 14, N'36343754')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2019, 19, N'54266003')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2023, 9, N'60558446')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2024, 6, N'67399094')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2024, 21, N'70258038')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (1, 5, N'75091016')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2024, 11, N'79257819')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2019, 19, N'85345358')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2019, 5, N'87976690')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2019, 23, N'96616176')
INSERT [dbo].[Vn_Pay] ([userID], [movieID], [Vn_gd]) VALUES (2019, 12, N'98071584')
GO
SET IDENTITY_INSERT [dbo].[WishList] ON 

INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (1, 1, CAST(N'2023-11-01' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (2, 1, CAST(N'2023-11-01' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (3, 2019, CAST(N'2023-11-01' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (7, 2023, CAST(N'2023-11-01' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (8, 2023, CAST(N'2023-11-01' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (9, 2023, CAST(N'2023-11-01' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (10, 1, CAST(N'2023-11-02' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (11, 1, CAST(N'2023-11-02' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (12, 1, CAST(N'2023-11-02' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (13, 1, CAST(N'2023-11-02' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (14, 1, CAST(N'2023-11-02' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (15, 2019, CAST(N'2023-11-02' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (16, 2019, CAST(N'2023-11-02' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (17, 1, CAST(N'2023-11-02' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (18, 1, CAST(N'2023-11-03' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (19, 2019, CAST(N'2023-11-07' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (20, 2019, CAST(N'2023-11-07' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (21, 2019, CAST(N'2023-11-08' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (22, 2019, CAST(N'2023-11-08' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (23, 2023, CAST(N'2023-11-09' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (24, 2023, CAST(N'2023-11-09' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (25, 2023, CAST(N'2023-11-09' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (26, 2023, CAST(N'2023-11-09' AS Date))
INSERT [dbo].[WishList] ([id], [u_id], [wishlistDate]) VALUES (27, 2024, CAST(N'2023-11-09' AS Date))
SET IDENTITY_INSERT [dbo].[WishList] OFF
GO
SET IDENTITY_INSERT [dbo].[WishListItem] ON 

INSERT [dbo].[WishListItem] ([id], [movieId], [w_id]) VALUES (7, 4, 10)
INSERT [dbo].[WishListItem] ([id], [movieId], [w_id]) VALUES (8, 4, 11)
INSERT [dbo].[WishListItem] ([id], [movieId], [w_id]) VALUES (9, 24, 12)
INSERT [dbo].[WishListItem] ([id], [movieId], [w_id]) VALUES (10, 24, 13)
INSERT [dbo].[WishListItem] ([id], [movieId], [w_id]) VALUES (11, 12, 14)
INSERT [dbo].[WishListItem] ([id], [movieId], [w_id]) VALUES (14, 9, 17)
INSERT [dbo].[WishListItem] ([id], [movieId], [w_id]) VALUES (15, 17, 18)
INSERT [dbo].[WishListItem] ([id], [movieId], [w_id]) VALUES (22, 9, 25)
INSERT [dbo].[WishListItem] ([id], [movieId], [w_id]) VALUES (23, 9, 26)
INSERT [dbo].[WishListItem] ([id], [movieId], [w_id]) VALUES (24, 6, 27)
SET IDENTITY_INSERT [dbo].[WishListItem] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__User__72E12F1B370C5B77]    Script Date: 3/14/2024 11:22:15 AM ******/
ALTER TABLE [dbo].[User] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ('images/batman_icon.png') FOR [avatar]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT ('2') FOR [role]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([videoId])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Vn_Pay]  WITH CHECK ADD FOREIGN KEY([movieID])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[Vn_Pay]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD FOREIGN KEY([u_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[WishListItem]  WITH CHECK ADD FOREIGN KEY([movieId])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[WishListItem]  WITH CHECK ADD FOREIGN KEY([w_id])
REFERENCES [dbo].[WishList] ([id])
GO
USE [master]
GO
ALTER DATABASE [movie] SET  READ_WRITE 
GO
