

/****** Object:  Database [EasyCMS]    Script Date: 1/27/2021 7:45:09 PM ******/
CREATE DATABASE [EasyCMS]

ALTER DATABASE [EasyCMS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EasyCMS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EasyCMS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EasyCMS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EasyCMS] SET ARITHABORT OFF 
GO
ALTER DATABASE [EasyCMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EasyCMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EasyCMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EasyCMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EasyCMS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EasyCMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EasyCMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EasyCMS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EasyCMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EasyCMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EasyCMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EasyCMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EasyCMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EasyCMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EasyCMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EasyCMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EasyCMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EasyCMS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EasyCMS] SET  MULTI_USER 
GO
ALTER DATABASE [EasyCMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EasyCMS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EasyCMS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EasyCMS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EasyCMS] SET DELAYED_DURABILITY = DISABLED 
GO
USE [EasyCMS]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 1/27/2021 7:45:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](500) NULL,
	[opt1] [nvarchar](500) NULL,
	[opt2] [nvarchar](500) NULL,
	[opt3] [nvarchar](500) NULL,
	[opt4] [nvarchar](500) NULL,
	[subjectId] [int] NULL,
	[answer] [nvarchar](500) NULL,
	[created] [date] NULL CONSTRAINT [DF__Question__create__145C0A3F]  DEFAULT (getdate()),
	[status] [nchar](10) NULL,
 CONSTRAINT [PK__Question__3213E83F8A699FDE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuizHistory]    Script Date: 1/27/2021 7:45:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NULL,
	[numOfQuiz] [int] NULL,
	[correctAnswer] [int] NULL,
	[dateQuiz] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 1/27/2021 7:45:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subjectId] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/27/2021 7:45:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](200) NULL,
	[email] [nvarchar](50) NULL,
	[type] [int] NULL,
 CONSTRAINT [PK__Users__3213E83FC62BE222] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (1, N'What is the capital of Vietnam', N'Hanoi', N'Saigon', N'HCM City', N'Lang Son', 1, N'1', CAST(N'2018-05-30' AS Date), N'Deactive  ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (2, N'Is Mr.Minh fancy ?', N'So fancy', N'Fancy and galant', N'I''m a big fan', N'All', 2, N'4', CAST(N'2018-05-30' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (3, N'What is the name of this university?', N'FPT Daigaku', N'FPTU', N'FPTHCM', N'Do not care', 1, N'3', CAST(N'2018-05-30' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (4, N'Name of question 4', N'answer ichi', N'Answer ni', N'answer san', N'answer yon', 2, N'2', CAST(N'2018-06-11' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (8, N'ssssssss<br>dddddddddd', N'ddddddddd', N'ddddddddd', N'dddddddd', N'ddddddddddddddddddddd', 1, N'2', CAST(N'2018-06-11' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (10, N'What is the capital of Vietnam', N'Hanoi', N'Saigon', N'HCM City', N'Lang Son', 2, N'1', CAST(N'2018-05-30' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (11, N'What is the capital of Vietnam', N'Hanoi', N'Saigon', N'HCM City', N'Lang Son', 2, N'3', CAST(N'2018-05-30' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (12, N'What is the capital of Vietnam', N'Hanoi', N'Saigon', N'HCM City', N'Lang Son', 2, N'1', CAST(N'2018-05-30' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (13, N'What is the capital of Vietnam', N'Hanoi', N'Saigon', N'HCM City', N'Lang Son', 2, N'2', CAST(N'2018-05-30' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (15, N'who I''m ?', N'me', N'you', N'I don''t know', N'both', 1, N'1', CAST(N'2020-10-30' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (16, N'who I''m ?', N'me', N'you', N'I don''t know', N'both', 1, N'2', CAST(N'2020-10-30' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (17, N'The _____ method in the InetAddress class returns the IP address.', N'getHostAddress()', N'getIPAddress()', N'getAddress()', N'getIP()', 2, N'1', CAST(N'2020-10-28' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (18, N'cccccccc', N'ada', N'ada', N'ada', N'4578', 1, N'2', CAST(N'2021-01-20' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (19, N'ccccccc', N'ccccccccccccc', N'asdhsadscdvf', N'tyhtadf', N'afad', 1, N'2', CAST(N'2021-01-21' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (20, N'What is the default alignment for a FlowLayout?', N'Depends on the particular implementation of the Java Virtual Machine', N'FlowLayout.CENTER', N'FlowLayout.RIGHT', N'FlowLayout.LEFT', 1, N'2', CAST(N'2021-01-21' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (21, N'long co dep trai khong?', N'khong', N'co', N'be de', N'gay', 2, N'3', CAST(N'2021-01-22' AS Date), N'Active    ')
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuizHistory] ON 

INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1, 5, 3, 2, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (2, 5, 6, 2, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (3, 7, 2, 1, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (4, 7, 10, 6, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (5, 7, 10, 0, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (6, 7, 10, 7, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1005, 6, 10, 0, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1006, 6, 10, 0, NULL)
SET IDENTITY_INSERT [dbo].[QuizHistory] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([subjectId], [subjectName]) VALUES (1, N'PRJ311')
INSERT [dbo].[Subject] ([subjectId], [subjectName]) VALUES (2, N'PRJ212')
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (1, N'Minh', N'123456', N'mra00000@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (2, N'MrVD', N'123456', N'ahihi@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (3, N'MrAhihi', N'123456', N'ah@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (4, N'MrGalan', N'123456', N'galan@ahihi.com', 0)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (5, N'MrSFAG', N'12345678', N'mfagman@ahihi.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (6, N'long', N'123', N'long@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (7, N'van', N'123', N'test', 0)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (8, N'Le thanh Van', N'123', N'van@gmail.com', 0)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (11, N'Le Thanh Van', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'van@gmail.com', 0)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (12, N'Le thanh Van', N'123', N'van1@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[QuizHistory]  WITH CHECK ADD  CONSTRAINT [fk_studentId_1] FOREIGN KEY([studentId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[QuizHistory] CHECK CONSTRAINT [fk_studentId_1]
GO
USE [master]
GO
ALTER DATABASE [EasyCMS] SET  READ_WRITE 
GO
