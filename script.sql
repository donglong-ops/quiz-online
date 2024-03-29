﻿﻿USE [master]
GO
/****** Object:  Database [EasyCMS]    Script Date: 2/1/2021 2:46:06 PM ******/
CREATE DATABASE [EasyCMS]

USE [EasyCMS]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 2/1/2021 2:46:06 PM ******/

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
/****** Object:  Table [dbo].[QuizHistory]    Script Date: 2/1/2021 2:46:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentId] [int] NULL,
	[subjectid] [int] NULL,
	[numOfQuiz] [int] NULL,
	[correctAnswer] [int] NULL,
	[dateQuiz] [date] NULL,
 CONSTRAINT [PK__QuizHist__3213E83FD3ECA7B0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 2/1/2021 2:46:06 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2/1/2021 2:46:06 PM ******/
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

INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (1, N'Swing components that don''t rely on native GUI are referred to as ___________.
', N'lightweight components', N'heavyweight components', N'GUI components', N'non-GUI components', 1, N'1', CAST(N'2018-05-30' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (2, N'EJB 3.0 specifications are first implemented in ______', N'Java EE 5', N'Java EE 4', N'Java EE 3', N'Java EE 6', 2, N'2', CAST(N'2018-05-30' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (3, N'__________ are referred to as heavyweight components.', N'AWT components', N'Swing components', N'GUI components', N'Non-GUI components', 1, N'1', CAST(N'2018-05-30' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (4, N'The form attribute _____specifies the server-side form handler, i.e., the program that handles the request', N'name', N'action', N'localhost', N'id', 2, N'2', CAST(N'2018-06-11' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (10, N'Which HTTP method is used in FORM based Authentication?', N'GET', N'HEAD', N'FORM', N'POST', 2, N'4', CAST(N'2018-05-30' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (20, N'Which of the following classes is a heavyweight component?', N'JButton', N'JTextField', N'JPanel', N'JFrame', 1, N'4', CAST(N'2021-01-21' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (21, N'Consider the following HTML page code. Which method will be called on UploaderServlet when a user ....', N'doPut', N'doPost', N'doHead', N'do Get', 2, N'4', CAST(N'2021-01-22' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (22, N'Which component cannot be added to a container?', N' JPanel', N'JButton', N'JFrame', N'JComponent', 1, N'3', CAST(N'2021-01-27' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (23, N'What is best to describe the relationship between a container and a SWing GUI object in the container?', N'Association', N'Aggregation', N'Composition', N'Inheritance', 1, N'3', CAST(N'2021-01-28' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (24, N'What is best to describe the relationship between a container and a layout manager?
', N'Association', N'Aggregation', N'Composition', N'Inheritance', 1, N'2', CAST(N'2021-01-29' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (25, N'What is best to describe the relationship between JComponent and JButton?', N'Association', N'Aggregation', N'Composition', N'Inheritance', 1, N'4', CAST(N'2021-01-29' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (26, N'What is best to describe the relationship between Component and Color?', N'Association', N'Aggregation', N'Composition', N'Inheritance', 1, N'1', CAST(N'2021-01-29' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (27, N'What is best to describe the relationship between Component and Font?', N'Association', N'Aggregation', N'Composition', N'Inheritance', 1, N'1', CAST(N'2021-01-29' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (28, N'
Which of the following statements is for placing the frame''s upper left corner to (200, 100)?', N'frame.setLocation(100, 100)', N'frame.setLocation(100, 200)', N'frame.setLocation(200, 100)', N'frame.setLocation(200, 200)', 1, N'3', CAST(N'2021-01-29' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (29, N'What layout manager should you use so that every component occupies the same size in the container?
', N' a FlowLayout', N'a GridLayout', N'a BorderLayout', N'any layout', 1, N'2', CAST(N'2021-01-29' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (30, N'Suppose a JFrame uses the GridLayout(0, 2). If you add six buttons to the frame, how many columns are displayed?', N'1', N'2', N'3', N'4', 1, N'2', CAST(N'2021-01-29' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (31, N'Suppose a JFrame uses the GridLayout(2, 2). If you add six buttons to the frame, how many columns are displayed?
', N'1', N'2', N'3', N'4', 1, N'3', CAST(N'2021-01-29' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (32, N'The default layout out of a contentPane in a JFrame is __________.
', N' FlowLayout', N'GridLayout', N'BorderLayout', N'None', 1, N'3', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (33, N'To add a component c to a JPanel p, use _________.', N' p.add(c)', N'p.getContentPane(c)', N'p.insert(c)', N'p.append(c)', 1, N'1', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (34, N'_____________ creates a color object.', N'new Color(0, 0, 0)', N'new Color(0, 266, 0)', N'new Color(255, 255, 255)', N'new Color(1, 2, 3)', 1, N'2', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (35, N'To specify a font to be bold and italic, use the font style value _________
', N'Font.PLAIN', N'Font.BOLD', N'Font.ITALIC', N'Font.BOLD + Font.ITALIC', 1, N'4', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (36, N'The method __________ gets the text (or caption) of the button jbt.', N'jbt.text()', N'jbt.getText()', N'jbt.findText()
', N' jbt.retrieveText().

C', 1, N'2', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (37, N'______________is the well-known host name that refers to your own computer.', N'localhost', N'DNS', N'ip', N'computer name', 2, N'1', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (38, N'Which is NOT a scope of implicit objects of JSP file?', N'page', N'response', N'session', N'application', 2, N'4', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (39, N'Which security mechanism proves that data has not been tampered with during its transit through the network?', N'Data validation', N'Data integrity
', N'Authentication', N'Data privacy', 2, N'2', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (40, N'Identify the method used to get an object available ina session', N'get of Session', N'getValues of HttpSession', N'getAttribute of Session', N'getAttribute of HttpSession', 2, N'4', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (41, N'Which of the following task may happen in the translation phase of JSP page?', N'Instantiation of the servlet class', N'Creation of the servlet class corresponding to the JSP file', N'None of the others', N'Execution of _jspService() method', 2, N'2', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (42, N'Which jsp tag can be used to set bean property?', N'jsp:property', N'jsp:useBean.setProperty', N'jsp:useBean.Property', N'jsp:setProperty', 2, N'4', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (43, N'__________ includes a static file in a JSP file, parsing the file''s JSP elements', N'<jsp:foward>', N'<jsp:useBean>', N'include directive', N'<jsp:include>', 2, N'3', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (44, N'Name the default value of the scope attribute of <jsp:useBean>', N'request', N'application', N'session', N'page', 2, N'4', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (45, N'Identify the technique that can be used to implement ''session'' if the client browser does not support cookies', N'It can not be done without cookie support', N'Using Http headers', N'URL Writing', N'Hidden form fields', 2, N'4', CAST(N'2021-01-31' AS Date), N'Active    ')
INSERT [dbo].[Question] ([id], [content], [opt1], [opt2], [opt3], [opt4], [subjectId], [answer], [created], [status]) VALUES (46, N'A Java developer needs to be able to send email, containing XML attachments,using SMTP. Which JEE (J2EE) technology provides this capability?', N'Servlet', N'JSP', N'EJB', N'JavaMail', 2, N'4', CAST(N'2021-01-31' AS Date), N'Active    ')
SET IDENTITY_INSERT [dbo].[Question] OFF
SET IDENTITY_INSERT [dbo].[QuizHistory] ON 

INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1, 5, 1, 3, 2, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (2, 5, 2, 6, 2, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (3, 7, 2, 2, 1, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (4, 7, 2, 10, 6, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (5, 7, 2, 10, 0, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (6, 7, 2, 10, 7, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1005, 6, 1, 10, 0, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1006, 6, 1, 10, 0, NULL)
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1007, 7, 1, 8, 2, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1008, 8, 2, 7, 4, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1009, 7, 1, 7, 2, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1010, 8, 1, 8, 8, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1011, 8, 1, 11, 0, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1012, 8, 1, 7, 0, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1013, 8, 1, 11, 0, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1014, 8, 1, 8, 0, CAST(N'2021-01-29' AS Date))
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1015, 7, 1, 10, 8, CAST(N'2021-01-31' AS Date))
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1016, 7, 1, 6, 0, CAST(N'2021-01-31' AS Date))
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1017, 13, 1, 6, 3, CAST(N'2021-01-31' AS Date))
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1018, 7, 1, 10, 10, CAST(N'2021-01-31' AS Date))
INSERT [dbo].[QuizHistory] ([id], [studentId], [subjectid], [numOfQuiz], [correctAnswer], [dateQuiz]) VALUES (1019, 13, 2, 11, 2, CAST(N'2021-02-01' AS Date))
SET IDENTITY_INSERT [dbo].[QuizHistory] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([subjectId], [subjectName]) VALUES (1, N'PRJ311')
INSERT [dbo].[Subject] ([subjectId], [subjectName]) VALUES (2, N'PRJ321')
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (1, N'Minh', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'mra00000@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (2, N'Vo Tan Tai', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'ahihi@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (3, N'Do Duc Nam', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'ah@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (4, N'Quynh Lam', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'galan@ahihi.com', 0)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (5, N'Nguyen Ngoc Quynh Nhu', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'mfagman@ahihi.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (6, N'long', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'long@gmail.com', 1)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (7, N'Le thanh van', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'test', 0)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (8, N'Dong huu long', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'long', 0)
INSERT [dbo].[Users] ([id], [username], [password], [email], [type]) VALUES (13, N'van', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', N'van@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Subject] FOREIGN KEY([subjectId])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Subject]
GO
ALTER TABLE [dbo].[QuizHistory]  WITH CHECK ADD  CONSTRAINT [FK_QuizHistory_Subject] FOREIGN KEY([subjectid])
REFERENCES [dbo].[Subject] ([subjectId])
GO
ALTER TABLE [dbo].[QuizHistory] CHECK CONSTRAINT [FK_QuizHistory_Subject]
GO
ALTER TABLE [dbo].[QuizHistory]  WITH CHECK ADD  CONSTRAINT [fk_studentId_1] FOREIGN KEY([studentId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[QuizHistory] CHECK CONSTRAINT [fk_studentId_1]
GO
USE [master]
GO
ALTER DATABASE [EasyCMS] SET  READ_WRITE 
GO
