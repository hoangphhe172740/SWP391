USE [master]
GO
/****** Object:  Database [projectSWP]    Script Date: 7/16/2024 8:32:44 PM ******/
CREATE DATABASE [projectSWP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'projectSWP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\projectSWP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'projectSWP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\projectSWP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [projectSWP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [projectSWP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [projectSWP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [projectSWP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [projectSWP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [projectSWP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [projectSWP] SET ARITHABORT OFF 
GO
ALTER DATABASE [projectSWP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [projectSWP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [projectSWP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [projectSWP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [projectSWP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [projectSWP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [projectSWP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [projectSWP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [projectSWP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [projectSWP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [projectSWP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [projectSWP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [projectSWP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [projectSWP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [projectSWP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [projectSWP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [projectSWP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [projectSWP] SET RECOVERY FULL 
GO
ALTER DATABASE [projectSWP] SET  MULTI_USER 
GO
ALTER DATABASE [projectSWP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [projectSWP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [projectSWP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [projectSWP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [projectSWP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [projectSWP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'projectSWP', N'ON'
GO
ALTER DATABASE [projectSWP] SET QUERY_STORE = OFF
GO
USE [projectSWP]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [varchar](255) NULL,
	[pass] [varchar](255) NULL,
	[email] [varchar](50) NULL,
	[roleID] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnswerQuestion]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerQuestion](
	[QuestionID] [int] NULL,
	[Answer] [nvarchar](max) NULL,
	[incorrect] [bit] NULL,
	[attempt_number] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certilicate]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certilicate](
	[certificate_id] [int] NOT NULL,
	[certificate_name] [nvarchar](max) NOT NULL,
	[cid] [int] NOT NULL,
 CONSTRAINT [PK_Certilicate] PRIMARY KEY CLUSTERED 
(
	[certificate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] NOT NULL,
	[courseID] [int] NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[userID] [int] NOT NULL,
	[createdDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[price] [float] NULL,
	[image] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[created_by] [int] NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseEnrollment]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseEnrollment](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [int] NOT NULL,
	[Email] [nvarchar](max) NULL,
	[CourseID] [int] NOT NULL,
	[JoinDate] [datetime] NULL,
 CONSTRAINT [PK_CourseEnrollment] PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[module_id] [int] NOT NULL,
	[lesson_Id] [int] IDENTITY(1,1) NOT NULL,
	[lesson_name] [nvarchar](max) NULL,
	[lesson_video] [nvarchar](max) NULL,
	[duration] [int] NULL,
	[create_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[lesson_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mentor]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mentor](
	[Mentor_id] [int] IDENTITY(1,1) NOT NULL,
	[Mentor_name] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[create_by] [int] NULL,
 CONSTRAINT [PK_Mentor] PRIMARY KEY CLUSTERED 
(
	[Mentor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Module]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[course_id] [int] NOT NULL,
	[module_id] [int] IDENTITY(1,1) NOT NULL,
	[module_name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Module] PRIMARY KEY CLUSTERED 
(
	[module_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[profile_Id] [int] NOT NULL,
	[fullname] [nvarchar](max) NULL,
	[gender] [bit] NULL,
	[email] [varchar](50) NULL,
	[nation] [nvarchar](max) NULL,
	[uId] [int] NOT NULL,
	[avatar] [nvarchar](max) NULL,
 CONSTRAINT [PK_Profile] PRIMARY KEY CLUSTERED 
(
	[profile_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Question_Number] [int] NULL,
	[Quiz_id] [int] NULL,
	[QuestionName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionChoice]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionChoice](
	[QuestionID] [int] NOT NULL,
	[Choices] [nvarchar](max) NULL,
	[inCorrect] [bit] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_QuestionChoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quizs]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quizs](
	[quiz_id] [int] IDENTITY(1,1) NOT NULL,
	[ModuleId] [int] NULL,
	[quiz_name] [nvarchar](max) NULL,
	[quiz_time] [time](7) NULL,
	[PassScore] [float] NULL,
	[userScore] [float] NULL,
 CONSTRAINT [PK_Quizs] PRIMARY KEY CLUSTERED 
(
	[quiz_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 7/16/2024 8:32:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[wishlist_Id] [int] NOT NULL,
	[email] [nvarchar](max) NOT NULL,
	[managed_by] [int] NOT NULL,
 CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED 
(
	[wishlist_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[AnswerQuestion]  WITH CHECK ADD  CONSTRAINT [FK_AnswerQuestion_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionID])
GO
ALTER TABLE [dbo].[AnswerQuestion] CHECK CONSTRAINT [FK_AnswerQuestion_Question]
GO
ALTER TABLE [dbo].[Certilicate]  WITH CHECK ADD  CONSTRAINT [FK_Certilicate_Course] FOREIGN KEY([cid])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Certilicate] CHECK CONSTRAINT [FK_Certilicate_Course]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Account] FOREIGN KEY([userID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Account]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Course] FOREIGN KEY([courseID])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Course]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Account] FOREIGN KEY([created_by])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Account]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Category1] FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([cid])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Category1]
GO
ALTER TABLE [dbo].[CourseEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_CourseEnrollment_Account] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[CourseEnrollment] CHECK CONSTRAINT [FK_CourseEnrollment_Account]
GO
ALTER TABLE [dbo].[CourseEnrollment]  WITH CHECK ADD  CONSTRAINT [FK_CourseEnrollment_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[CourseEnrollment] CHECK CONSTRAINT [FK_CourseEnrollment_Course]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Module] FOREIGN KEY([module_id])
REFERENCES [dbo].[Module] ([module_id])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Module]
GO
ALTER TABLE [dbo].[Module]  WITH CHECK ADD  CONSTRAINT [FK_Module_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Module] CHECK CONSTRAINT [FK_Module_Course]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [FK_Profile_Account] FOREIGN KEY([uId])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [FK_Profile_Account]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Quizs] FOREIGN KEY([Quiz_id])
REFERENCES [dbo].[Quizs] ([quiz_id])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Quizs]
GO
ALTER TABLE [dbo].[QuestionChoice]  WITH CHECK ADD  CONSTRAINT [FK_QuestionChoice_Question] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionID])
GO
ALTER TABLE [dbo].[QuestionChoice] CHECK CONSTRAINT [FK_QuestionChoice_Question]
GO
ALTER TABLE [dbo].[Quizs]  WITH CHECK ADD  CONSTRAINT [FK_Quizs_Lesson] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Lesson] ([lesson_Id])
GO
ALTER TABLE [dbo].[Quizs] CHECK CONSTRAINT [FK_Quizs_Lesson]
GO
ALTER TABLE [dbo].[Quizs]  WITH CHECK ADD  CONSTRAINT [FK_Quizs_Module] FOREIGN KEY([ModuleId])
REFERENCES [dbo].[Module] ([module_id])
GO
ALTER TABLE [dbo].[Quizs] CHECK CONSTRAINT [FK_Quizs_Module]
GO
USE [master]
GO
ALTER DATABASE [projectSWP] SET  READ_WRITE 
GO
