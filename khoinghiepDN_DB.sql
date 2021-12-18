USE [master]
GO
/****** Object:  Database [StartUpDN]    Script Date: 12/11/2021 11:50:46 AM ******/
CREATE DATABASE [StartUpDN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StartUpDN', FILENAME = N'E:\SQL_SERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\StartUpDN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StartUpDN_log', FILENAME = N'E:\SQL_SERVER\MSSQL15.MSSQLSERVER\MSSQL\DATA\StartUpDN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StartUpDN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StartUpDN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StartUpDN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StartUpDN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StartUpDN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StartUpDN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StartUpDN] SET ARITHABORT OFF 
GO
ALTER DATABASE [StartUpDN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StartUpDN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StartUpDN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StartUpDN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StartUpDN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StartUpDN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StartUpDN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StartUpDN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StartUpDN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StartUpDN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StartUpDN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StartUpDN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StartUpDN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StartUpDN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StartUpDN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StartUpDN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StartUpDN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StartUpDN] SET RECOVERY FULL 
GO
ALTER DATABASE [StartUpDN] SET  MULTI_USER 
GO
ALTER DATABASE [StartUpDN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StartUpDN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StartUpDN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StartUpDN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StartUpDN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StartUpDN', N'ON'
GO
ALTER DATABASE [StartUpDN] SET QUERY_STORE = OFF
GO
USE [StartUpDN]
GO
/****** Object:  Table [dbo].[blogs]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blogs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[categoryid] [int] NULL,
	[title] [nvarchar](100) NULL,
	[slug] [varchar](200) NULL,
	[content] [nvarchar](max) NULL,
	[posteddate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryname] [nvarchar](50) NULL,
	[sorting] [int] NULL,
	[slug] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[projectid] [int] NULL,
	[binhluan] [nvarchar](1000) NULL,
	[postedday] [date] NULL,
	[liketotal] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[district]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[district](
	[id] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
	[tinhid] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eventsreference]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventsreference](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[categoryid] [int] NULL,
	[title] [nvarchar](100) NULL,
	[slug] [varchar](200) NULL,
	[content] [nvarchar](max) NULL,
	[posteddate] [date] NULL,
	[startday] [date] NULL,
	[starttime] [int] NULL,
	[endtime] [int] NULL,
	[country] [nvarchar](30) NULL,
	[province] [nvarchar](30) NULL,
	[district] [nvarchar](30) NULL,
	[subdistrict] [nvarchar](30) NULL,
	[houseno] [nvarchar](30) NULL,
	[dayendenroll] [date] NULL,
	[acceptstatus] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[imageofproject]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[imageofproject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[projectid] [int] NULL,
	[imagename] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[investedproject]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[investedproject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[projectid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[news]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[categoryid] [int] NULL,
	[title] [nvarchar](100) NULL,
	[slug] [varchar](200) NULL,
	[content] [nvarchar](max) NULL,
	[posteddate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[projects]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[categoryid] [int] NULL,
	[projectname] [nvarchar](100) NULL,
	[amountcalled] [money] NULL,
	[projectdetail] [nvarchar](max) NULL,
	[country] [nvarchar](30) NULL,
	[province] [nvarchar](30) NULL,
	[district] [nvarchar](30) NULL,
	[subdistrict] [nvarchar](30) NULL,
	[houseno] [nvarchar](30) NULL,
	[totalvoted] [float] NOT NULL,
	[aceptedstatus] [tinyint] NULL,
	[title] [varchar](1000) NULL,
	[imagepresent] [varchar](200) NULL,
	[postedday] [date] NULL,
	[sumvoted] [int] NOT NULL,
	[liketotal] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[province]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[id] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[replies]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[replies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[commentid] [int] NULL,
	[binhluan] [nvarchar](1000) NULL,
	[postedday] [date] NULL,
	[liketotal] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[startupcurriculumvitae]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[startupcurriculumvitae](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[country] [nvarchar](30) NULL,
	[province] [nvarchar](30) NULL,
	[district] [nvarchar](30) NULL,
	[subdistrict] [nvarchar](30) NULL,
	[houseno] [nvarchar](30) NULL,
	[contactemail] [char](50) NULL,
	[contactphone] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subdistrict]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subdistrict](
	[id] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NULL,
	[quanhuyenid] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/11/2021 11:50:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[passwords] [varchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[gender] [char](5) NULL,
	[email] [char](50) NULL,
	[phone] [char](10) NULL,
	[cccd] [char](10) NULL,
	[birthday] [date] NULL,
	[country] [nvarchar](30) NULL,
	[province] [nvarchar](30) NULL,
	[district] [nvarchar](30) NULL,
	[subdistrict] [nvarchar](30) NULL,
	[houseno] [nvarchar](30) NULL,
	[roles] [varchar](20) NULL,
	[job] [nvarchar](200) NULL,
	[avataruser] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[blogs] ON 

INSERT [dbo].[blogs] ([id], [userid], [categoryid], [title], [slug], [content], [posteddate]) VALUES (1, 1, 5, N'6 bước đơn giản để bắt đầu khởi nghiệp kinh doanh riêng', N'6-buoc-don-gian-de-bat-dau-khoi-nghiep-kinh-doanh-rieng', N'Bí quyết thành công với 6 bước đơn giản để bắt đầu khởi nghiệp kinh doanh riêng

Hành trình khởi nghiệp kinh doanh thường được nhen nhóm từ những ý tưởng. Startup biết cách biến ý tưởng thành hành động, thực hiện hóa mục tiêu mới là startup thành công. Dù đây là hành trình không hề dễ dàng với bất kỳ ai nhưng với 6 bước đơn giản để bắt đầu khởi nghiệp kinh doanh riêng mà Khởi Nghiệp Trẻ sắp giới thiệu cho bạn dưới đây, hy vọng sẽ giúp bạn vững vàng trên hành trình đó.

1.  Viết kế hoạch kinh doanh

Muốn làm việc lớn, bạn phải luôn có kế hoạch. Khởi nghiệp đã là hành trình khó khăn, bạn không thể khiến hành trình đó trở nên mờ mịt hơn vì không hiểu rõ mình cần phải làm gì. Khởi nghiệp là bắt đầu từ những ý tưởng nhỏ. Khi bạn còn nhiều hạn chế về nguồn lực, đừng cố gắng tạo ra những kế hoạch mang tầm vĩ mô. Bởi, bởi người thành công không phải là người làm việc “to” nhất mà là người biết cách biến cái “nhỏ” thành cái có giá trị gấp bội lần.

Hãy nghĩ đến những điều đơn giản, một kế hoạch kinh doanh tổng quát về từng giai đoạn cụ thể để bắt đầu khởi nghiệp.

Xác định tầm nhìn của bạn: Kết quả cuối cùng của việc kinh doanh của bạn là gì?
Xác định sứ mệnh của bạn: Khác với tầm nhìn, sứ mệnh giải thích lý do vì sao công ty của bạn được hình thành.
Xác định mục tiêu của bạn: Câu hỏi bạn sẽ làm gì? và Mục tiêu của bạn là gì? – sẽ giúp bạn đạt được sứ mệnh và tầm nhìn của mình.
Sơ thảo những chiến lược cơ bản: Bạn sẽ đạt được mục tiêu mà mình đề ra như thế nào?
Viết một kế hoạch hành động đơn giản: Viết ra các nhiệm vụ nhỏ cần thiết để đạt được mục tiêu đã đề ra.
Điều này trên cơ bản tương tự với việc bạn vẽ một sơ đồ tư duy cho doanh nghiệp tương lai của mình. Bản kế hoạch không nên quá dài như một quyển tự thuật nhưng vẫn phải đủ dài cho một sự “hình dung” cụ thể về “đứa con” tương lai của bạn.2. Quyết định dựa vào ngân sách Các startup thường rơi vào cái bẫy “nghĩ lớn, làm lớn” trong khi các nguồn lực của bản thân thì còn quá hạn hẹp. Chính tham vọng quá nhiều đã khiến không ít startup “cháy túi” một cách vô ích. Vì vậy, việc bạn cần làm là xác định một mức ngân sách cụ thể mà bạn có thể chi cho doanh nghiệp của mình. Hãy hiểu rõ năng lực của mình và phát huy nó tốt nhất.
3. Quyết định dựa trên các yếu tố pháp lý

Pháp lý là vấn đề quan trọng với tất cả loại hình doanh nghiệp. Không một doanh nghiệp nào tồn tại lâu dài và minh bạch nếu chưa hoàn thành các thủ tục pháp lý. Tùy vào hình thức, quy mô của doanh nghiệp, sẽ có những yêu cầu về pháp lý khác nhau.
4. Chi tiền hợp lý

Không chỉ nên chú trọng đến công đoạn xác định vốn, bạn còn cần phải chú ý đến vấn đề chi tiền trong quá trình trước và đang kinh doanh. Vung tiền quá trớn trong khi ngân sách han hẹp sẽ khiến kế hoạch của bạn đổ bể, thậm chí doanh nghiệp có thể nợ nần và dẫn đến phá sản.

Tuy nhiên, dùng tiền quá “ki bo” làm hạn chế tiềm năng phát triển của doanh nghiệp, đã kinh doanh thì không keo kiệt, vấn đề nằm ở sử dụng tiền thông minh chứ không phải ki bo trong việc chi tiền cho một ý tưởng lớn.5. Xây dựng website

Khởi nghiệp kinh doanh trong thời đại công nghệ mà không biết khai thác công nghệ sẽ khiến doanh nghiệp của bạn trở nên tụt hậu, yếu kém. Khách hàng ngày càng có thói quen tiếp cận thông tin trên Internet. Vì vậy, dù công ty bạn có kinh doanh trực tuyến hay không, website sẽ giúp khách hàng tiếp cận được với doanh nghiệp dễ dàng hơn.
6. Bán hàng thử

Đến bước này thì bạn đã có đủ nền tảng để thử nghiệm kinh doanh sản phẩm của mình. Hãy lan rộng ra thế giới bằng những cách sáng tạo và ít tốn kém nhất. “Dùng thử”, “Khuyến mãi” luôn là những cụm từ thu hút được sự quan tâm của khách hàng. Vì vậy, thực hiện các chương trình quảng bá bằng cách cho khách hàng dùng thử chính sản phẩm hay dịch vụ mà bạn sắp kinh doanh sẽ là “đòn tâm lý” mạnh mẽ.', CAST(N'2021-10-14' AS Date))
INSERT [dbo].[blogs] ([id], [userid], [categoryid], [title], [slug], [content], [posteddate]) VALUES (2, 1, 5, N'Elevator Pitch là gì? Hiểu về Elevator Pitch', N'elevator-pitch-la-gi-hieu-ve-elevator-pitch', N'Elevator Pitch

Khái niệm

Elevator Pitch là một thuật ngữ tiếng lóng được sử dụng để mô tả một bài phát biểu ngắn gọn phác thảo một ý tưởng cho một sản phẩm, dịch vụ hoặc dự án. Cái tên này xuất phát từ khái niệm rằng bài phát biểu nên được gói gọn trong khoảng thời gian ngắn như khi đi thang máy (Elevator), thường là 20-60 giây.

Trong tài chính, bài phát biểu đề cập đến nỗ lực của một doanh nhân để thuyết phục một nhà đầu tư mạo hiểm rằng, đó là một ý tưởng kinh doanh đáng để đầu tư vào.

Hiểu về Elevator Pitch

Các nhà đầu tư mạo hiểm coi chất lượng của bài Elevator Pitch như một cách để đánh giá liệu có nên tiếp tục với một ý tưởng hay không. Elevator Pitch cũng được sử dụng bởi các nhà quản lí dự án, nhân viên bán hàng và người tìm việc như một cách để tiếp thị bản thân hoặc ý tưởng của họ. Một bài Elevator Pitch nên bao gồm lí do tại sao sản phẩm, ý tưởng hoặc dự án của bạn đáng để đầu tư.

Cách sử dụng Elevator Pitch

Elevator Pitch thường được các doanh nhân chuẩn bị trước và thực hành một cách thành thục. Họ là những người tích cực tìm kiếm người ủng hộ cho ý tưởng kinh doanh của mình. Tùy thuộc vào hoàn cảnh, Elevator Pitch có thể dài hơn và có thể đi sâu vào chi tiết hơn.

Có một loạt các diễn đàn và sự kiện trong đó các Elevator Pitch được trình bày trước đám đông. Ví dụ, các chương trình ươm tạo khởi nghiệp có thể kết thúc bằng một sự kiện demo day, trong đó một thành viên sáng lập của nhóm, thường là Giám đốc điều hành, sẽ thực hiện Elavator Pitch trước các nhà đầu tư. Trong trường hợp này, bài phát biểu sẽ mô tả những vấn đề mà nhóm đang cố gắng giải quyết, phương pháp nào đã được cố gắng để giải quyết vấn đề và những gì mà startup phải thực hiện được. Hơn nữa, bài phát biểu phải giải thích được tại sao ý tưởng hoặc sản phẩm có thể thành công một cách rõ ràng và ngắn gọn.

Elevator Pitch có thể được sử dụng tại một số sự kiện như một hình thức của cuộc thi. Trong đó những người thuyết trình cạnh tranh cho những giải thưởng có thể giúp họ triển khai dự án của mình. Đây có thể bao gồm tài trợ danh nghĩa hoặc dịch vụ kinh doanh và cố vấn từ các chuyên gia. Ngoài việc chiến thắng trong một cuộc thi, cơ hội trình bày ý tưởng của họ trước khán giả, các nhà đầu tư mạo hiểm và những người ủng hộ cũng là một lợi ích lớn.', CAST(N'2021-10-14' AS Date))
SET IDENTITY_INSERT [dbo].[blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (1, N'Tài Chính - Ngân hàng', 1, N'Tai-chinh-Ngan-hang')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (2, N'Quảng Cáo - Truyền Thông', 1, N'Quang-cao-truyen-thong')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (3, N'Du lịch - Dịch vụ', 1, N'Du-lich--Dich-vu')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (4, N'Quản lý nhân sự - Hành Chính', 1, N'Quan-ly-nhan-su-Hanh-chinh')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (5, N'Công nghệ thông tin', 1, N'Cong-nghe-thong-tin')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (6, N'Kinh doanh thương mại', 1, N'Kinh-doanh-thuong-mai')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (7, N'Nông Nghiệp', 1, N'Nong-nghiep')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (8, N'Giao thông vận tải', 1, N'giao-thong-van-tai')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (9, N'Chế biến thực phẩm và đồ uống', 1, N'che-bien-thuc-pham-va-do-uong')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (10, N'Y tế - Dược phẩm - Mỹ phẩm', 1, N'y-te-duoc-pham')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (11, N'An ninh - Bảo vệ', 1, N'an-ninh-bao-ve')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (12, N'Viễn thông - Kỹ thuật số', 1, N'Vien-thong-Ky-thuat-so')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (13, N'Giáo dục - Thiết bị văn phòng', 1, N'Giao-duc-thiet-bi-van-phong')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (14, N'Xây dựng - Kiến trúc', 1, N'Xay-dung-kien-truc')
INSERT [dbo].[categories] ([id], [categoryname], [sorting], [slug]) VALUES (15, N'Cơ khí - Chế tạo máy', 1, N'co-khi-che-tao-may')
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [userid], [projectid], [binhluan], [postedday], [liketotal]) VALUES (1, 2, 1, N'Du an tot', NULL, NULL)
INSERT [dbo].[comments] ([id], [userid], [projectid], [binhluan], [postedday], [liketotal]) VALUES (2, 2, 2, N'Du an tot', NULL, NULL)
INSERT [dbo].[comments] ([id], [userid], [projectid], [binhluan], [postedday], [liketotal]) VALUES (3, 3, 3, N'Du an tot', NULL, NULL)
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'001', N'Quận Ba Đình', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'002', N'Quận Hoàn Kiếm', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'003', N'Quận Tây Hồ', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'004', N'Quận Long Biên', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'005', N'Quận Cầu Giấy', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'006', N'Quận Đống Đa', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'007', N'Quận Hai Bà Trưng', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'008', N'Quận Hoàng Mai', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'009', N'Quận Thanh Xuân', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'016', N'Huyện Sóc Sơn', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'017', N'Huyện Đông Anh', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'018', N'Huyện Gia Lâm', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'019', N'Quận Nam Từ Liêm', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'020', N'Huyện Thanh Trì', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'021', N'Quận Bắc Từ Liêm', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'024', N'Thành phố Hà Giang', N'02')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'026', N'Huyện Đồng Văn', N'02')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'027', N'Huyện Mèo Vạc', N'02')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'028', N'Huyện Yên Minh', N'02')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'029', N'Huyện Quản Bạ', N'02')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'030', N'Huyện Vị Xuyên', N'02')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'031', N'Huyện Bắc Mê', N'02')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'032', N'Huyện Hoàng Su Phì', N'02')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'033', N'Huyện Xín Mần', N'02')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'034', N'Huyện Bắc Quang', N'02')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'035', N'Huyện Quang Bình', N'02')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'040', N'Thành phố Cao Bằng', N'04')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'042', N'Huyện Bảo Lâm', N'04')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'043', N'Huyện Bảo Lạc', N'04')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'045', N'Huyện Hà Quảng', N'04')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'047', N'Huyện Trùng Khánh', N'04')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'048', N'Huyện Hạ Lang', N'04')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'049', N'Huyện Quảng Hòa', N'04')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'051', N'Huyện Hoà An', N'04')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'052', N'Huyện Nguyên Bình', N'04')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'053', N'Huyện Thạch An', N'04')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'058', N'Thành Phố Bắc Kạn', N'06')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'060', N'Huyện Pác Nặm', N'06')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'061', N'Huyện Ba Bể', N'06')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'062', N'Huyện Ngân Sơn', N'06')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'063', N'Huyện Bạch Thông', N'06')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'064', N'Huyện Chợ Đồn', N'06')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'065', N'Huyện Chợ Mới', N'06')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'066', N'Huyện Na Rì', N'06')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'070', N'Thành phố Tuyên Quang', N'08')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'071', N'Huyện Lâm Bình', N'08')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'072', N'Huyện Na Hang', N'08')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'073', N'Huyện Chiêm Hóa', N'08')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'074', N'Huyện Hàm Yên', N'08')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'075', N'Huyện Yên Sơn', N'08')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'076', N'Huyện Sơn Dương', N'08')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'080', N'Thành phố Lào Cai', N'10')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'082', N'Huyện Bát Xát', N'10')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'083', N'Huyện Mường Khương', N'10')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'084', N'Huyện Si Ma Cai', N'10')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'085', N'Huyện Bắc Hà', N'10')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'086', N'Huyện Bảo Thắng', N'10')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'087', N'Huyện Bảo Yên', N'10')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'088', N'Thị xã Sa Pa', N'10')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'089', N'Huyện Văn Bàn', N'10')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'094', N'Thành phố Điện Biên Phủ', N'11')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'095', N'Thị Xã Mường Lay', N'11')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'096', N'Huyện Mường Nhé', N'11')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'097', N'Huyện Mường Chà', N'11')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'098', N'Huyện Tủa Chùa', N'11')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'099', N'Huyện Tuần Giáo', N'11')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'100', N'Huyện Điện Biên', N'11')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'101', N'Huyện Điện Biên Đông', N'11')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'102', N'Huyện Mường Ảng', N'11')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'103', N'Huyện Nậm Pồ', N'11')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'105', N'Thành phố Lai Châu', N'12')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'106', N'Huyện Tam Đường', N'12')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'107', N'Huyện Mường Tè', N'12')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'108', N'Huyện Sìn Hồ', N'12')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'109', N'Huyện Phong Thổ', N'12')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'110', N'Huyện Than Uyên', N'12')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'111', N'Huyện Tân Uyên', N'12')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'112', N'Huyện Nậm Nhùn', N'12')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'116', N'Thành phố Sơn La', N'14')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'118', N'Huyện Quỳnh Nhai', N'14')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'119', N'Huyện Thuận Châu', N'14')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'120', N'Huyện Mường La', N'14')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'121', N'Huyện Bắc Yên', N'14')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'122', N'Huyện Phù Yên', N'14')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'123', N'Huyện Mộc Châu', N'14')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'124', N'Huyện Yên Châu', N'14')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'125', N'Huyện Mai Sơn', N'14')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'126', N'Huyện Sông Mã', N'14')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'127', N'Huyện Sốp Cộp', N'14')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'128', N'Huyện Vân Hồ', N'14')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'132', N'Thành phố Yên Bái', N'15')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'133', N'Thị xã Nghĩa Lộ', N'15')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'135', N'Huyện Lục Yên', N'15')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'136', N'Huyện Văn Yên', N'15')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'137', N'Huyện Mù Căng Chải', N'15')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'138', N'Huyện Trấn Yên', N'15')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'139', N'Huyện Trạm Tấu', N'15')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'140', N'Huyện Văn Chấn', N'15')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'141', N'Huyện Yên Bình', N'15')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'148', N'Thành phố Hòa Bình', N'17')
GO
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'150', N'Huyện Đà Bắc', N'17')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'152', N'Huyện Lương Sơn', N'17')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'153', N'Huyện Kim Bôi', N'17')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'154', N'Huyện Cao Phong', N'17')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'155', N'Huyện Tân Lạc', N'17')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'156', N'Huyện Mai Châu', N'17')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'157', N'Huyện Lạc Sơn', N'17')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'158', N'Huyện Yên Thủy', N'17')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'159', N'Huyện Lạc Thủy', N'17')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'164', N'Thành phố Thái Nguyên', N'19')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'165', N'Thành phố Sông Công', N'19')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'167', N'Huyện Định Hóa', N'19')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'168', N'Huyện Phú Lương', N'19')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'169', N'Huyện Đồng Hỷ', N'19')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'170', N'Huyện Võ Nhai', N'19')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'171', N'Huyện Đại Từ', N'19')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'172', N'Thị xã Phổ Yên', N'19')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'173', N'Huyện Phú Bình', N'19')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'178', N'Thành phố Lạng Sơn', N'20')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'180', N'Huyện Tràng Định', N'20')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'181', N'Huyện Bình Gia', N'20')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'182', N'Huyện Văn Lãng', N'20')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'183', N'Huyện Cao Lộc', N'20')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'184', N'Huyện Văn Quan', N'20')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'185', N'Huyện Bắc Sơn', N'20')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'186', N'Huyện Hữu Lũng', N'20')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'187', N'Huyện Chi Lăng', N'20')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'188', N'Huyện Lộc Bình', N'20')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'189', N'Huyện Đình Lập', N'20')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'193', N'Thành phố Hạ Long', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'194', N'Thành phố Móng Cái', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'195', N'Thành phố Cẩm Phả', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'196', N'Thành phố Uông Bí', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'198', N'Huyện Bình Liêu', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'199', N'Huyện Tiên Yên', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'200', N'Huyện Đầm Hà', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'201', N'Huyện Hải Hà', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'202', N'Huyện Ba Chẽ', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'203', N'Huyện Vân Đồn', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'205', N'Thị xã Đông Triều', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'206', N'Thị xã Quảng Yên', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'207', N'Huyện Cô Tô', N'22')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'213', N'Thành phố Bắc Giang', N'24')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'215', N'Huyện Yên Thế', N'24')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'216', N'Huyện Tân Yên', N'24')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'217', N'Huyện Lạng Giang', N'24')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'218', N'Huyện Lục Nam', N'24')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'219', N'Huyện Lục Ngạn', N'24')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'220', N'Huyện Sơn Động', N'24')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'221', N'Huyện Yên Dũng', N'24')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'222', N'Huyện Việt Yên', N'24')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'223', N'Huyện Hiệp Hòa', N'24')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'227', N'Thành phố Việt Trì', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'228', N'Thị xã Phú Thọ', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'230', N'Huyện Đoan Hùng', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'231', N'Huyện Hạ Hoà', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'232', N'Huyện Thanh Ba', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'233', N'Huyện Phù Ninh', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'234', N'Huyện Yên Lập', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'235', N'Huyện Cẩm Khê', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'236', N'Huyện Tam Nông', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'237', N'Huyện Lâm Thao', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'238', N'Huyện Thanh Sơn', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'239', N'Huyện Thanh Thuỷ', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'240', N'Huyện Tân Sơn', N'25')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'243', N'Thành phố Vĩnh Yên', N'26')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'244', N'Thành phố Phúc Yên', N'26')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'246', N'Huyện Lập Thạch', N'26')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'247', N'Huyện Tam Dương', N'26')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'248', N'Huyện Tam Đảo', N'26')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'249', N'Huyện Bình Xuyên', N'26')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'250', N'Huyện Mê Linh', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'251', N'Huyện Yên Lạc', N'26')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'252', N'Huyện Vĩnh Tường', N'26')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'253', N'Huyện Sông Lô', N'26')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'256', N'Thành phố Bắc Ninh', N'27')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'258', N'Huyện Yên Phong', N'27')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'259', N'Huyện Quế Võ', N'27')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'260', N'Huyện Tiên Du', N'27')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'261', N'Thị xã Từ Sơn', N'27')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'262', N'Huyện Thuận Thành', N'27')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'263', N'Huyện Gia Bình', N'27')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'264', N'Huyện Lương Tài', N'27')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'268', N'Quận Hà Đông', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'269', N'Thị xã Sơn Tây', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'271', N'Huyện Ba Vì', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'272', N'Huyện Phúc Thọ', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'273', N'Huyện Đan Phượng', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'274', N'Huyện Hoài Đức', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'275', N'Huyện Quốc Oai', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'276', N'Huyện Thạch Thất', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'277', N'Huyện Chương Mỹ', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'278', N'Huyện Thanh Oai', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'279', N'Huyện Thường Tín', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'280', N'Huyện Phú Xuyên', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'281', N'Huyện Ứng Hòa', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'282', N'Huyện Mỹ Đức', N'01')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'288', N'Thành phố Hải Dương', N'30')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'290', N'Thành phố Chí Linh', N'30')
INSERT [dbo].[district] ([id], [name], [tinhid]) VALUES (N'291', N'Huyện Nam Sách', N'30')
GO
SET IDENTITY_INSERT [dbo].[eventsreference] ON 

INSERT [dbo].[eventsreference] ([id], [userid], [categoryid], [title], [slug], [content], [posteddate], [startday], [starttime], [endtime], [country], [province], [district], [subdistrict], [houseno], [dayendenroll], [acceptstatus]) VALUES (2, 1, 5, N'SỰ KIỆN KẾT NỐI ĐẦU TƯ VÀ KẾT NỐI KINH DOANH CHO DOANH NGHIỆP KHỞI NGHIỆP 2021', N'su-kien-ket-noi-dau-tu-va-ket-noi-kinh-doanh-cho-doanh-nghiep-khoi-nghiep-2021', N' “Sự kiện kết nối đầu tư và kết nối kinh doanh cho doanh nghiệp khởi nghiệp năm 2021” hoạt động sự kiện khoa học và công nghệ do Sở Khoa học và Công nghệ thành phố Hải Phòng tổ chức nhằm tìm kiếm, thu hút các nhà đầu tư trong, ngoài thành phố và nước ngoài đầu tư trực tiếp cho các dự án khởi nghiệp, qua đó dần hình thành và phát triển mạng lưới nhà đầu tư cho khởi nghiệp ĐMST của thành phố; tìm kiếm, kết nối khách hàng để mua hoặc đặt hàng sản phẩm, dịch vụ, giải pháp công nghệ của các doanh nghiệp khởi nghiệp.

Năm 2021, do ảnh hưởng của dịch bệnh, sự kiện này sẽ được tổ chức song song theo hai hình thức trực tiếp và trực tuyến. Các doanh nghiệp và dự án khởi nghiệp tham gia (bên cung) sẽ là những đơn vị cung cấp những giải pháp đầy triển vọng trong các lĩnh vực F&B, Fintech, IT, hóa chất, nông nghiệp, công nghiệp... hỗ trợ các DN giải quyết những vấn đề bất cập trong quá trình sản xuất, kinh doanh.

Thời gian tổ chức kết nối: 08h15 - 16h00 ngày 19/10/2021 (tùy theo đăng ký của đơn vị)

Địa điểm tổ chức trực tiếp: Trường Đại Học Sư Phạm Kỹ Thuật - số 48 Cao Thắng, Hải Châu, Đà Nẵng (dành cho các đơn vị tại Đà Nẵng

Kết nối qua hình thức trực tuyến: Thông qua nền tảng ZOOM.

Sự kiện sẽ được truyền hình trực tiếp qua nền tảng youtube tại Hai Phong Startup và fanpage StartupHaiPhong.

Trân trọng kính mời các Quý doanh nghiệp, các nhà đầu tư, quỹ đầu tư quan tâm tham gia kết nối 

Mọi chi tiết xin liên hệ: 

Ms Cẩm Hương  0 912 940509 (Zalo), Ms Nhung 0904 163 863', CAST(N'2021-10-09' AS Date), CAST(N'2021-10-30' AS Date), 8, 12, N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Thanh Bình', N'48 Cao Thắng', CAST(N'2021-10-14' AS Date), 1)
INSERT [dbo].[eventsreference] ([id], [userid], [categoryid], [title], [slug], [content], [posteddate], [startday], [starttime], [endtime], [country], [province], [district], [subdistrict], [houseno], [dayendenroll], [acceptstatus]) VALUES (3, 1, 5, N'TECHFEST DANANG 2021 - TUẦN LỄ ĐỔI MỚI SÁNG TẠO VÀ NGÀY HỘI KHỞI NGHIỆP ĐÀ NẴNG', N'techfest-dânng-2021---tuan-le-doi-moi-sang-tao-va-ngay-hoi-khoi-nghiep-da-nang', N' Tuần lễ Đổi mới sáng tạo và Ngày hội khởi nghiệp Hải Phòng (TECHFEST HAIPHONG 2021) là hoạt động sự kiện khoa học và công nghệ do Sở Khoa học và Công nghệ thành phố Hải Phòng tổ chức nhằm truyền cảm hứng, giới thiệu và tôn vinh những thành tựu nổi bật của hoạt động đổi mới sáng tạo; kết nối hệ sinh thái khởi nghiệp đổi mới sáng tạo địa phương và quảng bá, thúc đẩy kết nối đầu tư, kết nối kinh doanh trong lĩnh vực này.

Năm 2021, do ảnh hưởng của dịch bệnh và thích ứng với xu hướng chuyển đối số trong mọi mặt của đời sống, lần đầu tiên Triển lãm 3D trực tuyến chuyên ngành về đổi mới sáng tạo và khởi nghiệp được tổ chức tại Hải Phòng.Nền tảng ảo được thiết kế cho 100 gian hàng đến từ các tập đoàn, công ty công nghệ hàng đầu trong và ngoài nước; các doanh nghiệp KH&CN và các doanh nghiệp khởi nghiệp ĐMST nổi bật của Hải Phòng và các địa phương trên cả nước.

Thời gian tổ chức từ ngày 28/9 đến 05/10/2021 trên nền tảng triển lãm ảo 3D online (Tên miền: TrienlamDMST.isc1.vn).

Để Techfest HaiPhong 2021 tổ chức thành công, Sở Khoa học và Công nghệ thành phố Hải Phòng trân trọng kính mời các tập đoàn, doanh nghiệp, tổ chức, cá nhân, nhóm cá nhân có sản phẩm trong công nghệ số (Big Data/AI, Block Chain, IoT, VR/AR), công nghệ theo các ngành (Cleantech, Edtech, Fintech, Foodtech, Agritech, Robotics) và một số lĩnh vực phục vụ sản xuất và đời sống khác…đăng ký tham gia gian hàng ảo để giới thiệu, trình diễn và kết nối tại sự kiện theo mẫu phiếu đính kèm.

Dự kiến khách mời tham dự triển lãm với khoảng 1000 lượt truy cập/ngày đến từ các cơ quan quản lý nhà nước tại các địa phương; các doanh nghiệp và người dùng quan tâm đến hoạt động đổi mới sáng tạo và khởi nghiệp, TECHFEST DANANG 2021 hứa hẹn là cơ hội lớn để truyền thông và  kết nối.', CAST(N'2021-10-09' AS Date), CAST(N'2021-10-30' AS Date), 8, 12, N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Thanh Bình', N'48 Cao Thắng', CAST(N'2021-10-14' AS Date), 1)
SET IDENTITY_INSERT [dbo].[eventsreference] OFF
GO
SET IDENTITY_INSERT [dbo].[imageofproject] ON 

INSERT [dbo].[imageofproject] ([id], [projectid], [imagename]) VALUES (1, 1, N'Anh1')
INSERT [dbo].[imageofproject] ([id], [projectid], [imagename]) VALUES (2, 2, N'Anh2')
INSERT [dbo].[imageofproject] ([id], [projectid], [imagename]) VALUES (3, 3, N'Anh3')
INSERT [dbo].[imageofproject] ([id], [projectid], [imagename]) VALUES (4, 5, N'5A&B.png')
INSERT [dbo].[imageofproject] ([id], [projectid], [imagename]) VALUES (5, 5, N'5agreementTable.png')
INSERT [dbo].[imageofproject] ([id], [projectid], [imagename]) VALUES (10, 4, N'4A&B.png')
INSERT [dbo].[imageofproject] ([id], [projectid], [imagename]) VALUES (11, 4, N'4agreementTable.png')
SET IDENTITY_INSERT [dbo].[imageofproject] OFF
GO
SET IDENTITY_INSERT [dbo].[investedproject] ON 

INSERT [dbo].[investedproject] ([id], [userid], [projectid]) VALUES (1, 2, 1)
INSERT [dbo].[investedproject] ([id], [userid], [projectid]) VALUES (2, 3, 2)
SET IDENTITY_INSERT [dbo].[investedproject] OFF
GO
SET IDENTITY_INSERT [dbo].[news] ON 

INSERT [dbo].[news] ([id], [userid], [categoryid], [title], [slug], [content], [posteddate]) VALUES (1, 1, 5, N'Kết nối đầu tư và kết nối kinh doanh cho các doanh nghiệp khởi nghiệp', N'ket-noi-dau-tu-va-ket-noi-kinh-doanh-cho-cac-doanh-nghiep-khoi-nghiep', N'Sự kiện năm nay có sự tham gia của các dự án khởi nghiệp sáng tạo của Hải Phòng, Hà Nội và thành phố Hồ Chí Minh thuộc nhiều lĩnh vực: Agritech, F&B, Logistic, Fintech, Digital Transformation... Các start-up có 5 phút trình bày về dự án nhằm mục đích kêu gọi góp vốn đầu tư hoặc chào bán sản phẩm, dịch vụ. Nếu khách hàng quan tâm, hai bên sẽ tiếp tục kết nối chuyên sâu để tăng cường các cơ hội hợp tác.

07 dự án tham gia gọi vốn bằng phương thức trực tiếp và trực tuyến tại Sự kiện gồm: Dự án PT Ag Healthy Café; Dự án Mado-Car - Ứng dụng gọi xe cho chuyên gia; Dự án dây chuyền sản xuất sợi tơ chuối và các sản phẩm gia tăng; Dự án sản xuất sơn phủ gầm ô tô chống ồn, chịu nhiệt phù hợp với điều kiện khí hậu Việt Nam; Dự án nghiên cứu và sản xuất xe điện bán hàng; Dự án Bizzi - Nền tảng quản lý hóa đơn toàn diện và tự động; Dự án nghiên cứu và sản xuất pin Lithium sắt photphat (pin LiFEPO4).

Sau vòng kêu gọi đầu tư, đã có 37 cuộc kết nối kết nối nhà đầu tư, quỹ đầu tư và chào mua - đặt hàng chuyên sâu được thực hiện. Một số dự án được đánh giá cao, thu hút nhiều sự quan tâm như: Dự án PT Ag Healthy Café, Dự án nghiên cứu và sản xuất pin Lithium sắt photphat (pin LiFEPO4); Dự án sản xuất sơn phủ gầm ô tô chống ồn, chịu nhiệt phù hợp với điều kiện khí hậu Việt Nam…

Thời gian qua, để xây dựng và phát triển hệ sinh thái khởi nghiệp sáng tạo của thành phố, Sở KH&CN đã tổ chức nhiều hoạt động, sự kiện kết nối, triển lãm giới thiệu sản phẩm, phát triển thị trường cho các doanh nghiệp; đồng thời vận động sự chung tay góp sức của các doanh nghiệp lớn trên địa bàn thành phố sẵn sàng sử dụng, trải nghiệm các sản phẩm hoặc trở thành các mentor, nhà đầu tư thiên thần cho dự án khởi nghiệp, tạo điều kiện để các doanh nghiệp này phát triển bền vững và xây dựng thế hệ doanh nhân kế cận.', CAST(N'2021-10-31' AS Date))
INSERT [dbo].[news] ([id], [userid], [categoryid], [title], [slug], [content], [posteddate]) VALUES (2, 1, 5, N'SỰ KIỆN KẾT NỐI ĐẦU TƯ VÀ KẾT NỐI KINH DOANH CHO DOANH NGHIỆP KHỞI NGHIỆP 2021', N'su-kien-ket-noi-dau-tu-va-ket-noi-kinh-doanh-cho-doanh-nghiep-khoi-nghiep-2021	', N'“Sự kiện kết nối đầu tư và kết nối kinh doanh cho doanh nghiệp khởi nghiệp năm 2021” hoạt động sự kiện khoa học và công nghệ do Sở Khoa học và Công nghệ thành phố Hải Phòng tổ chức nhằm tìm kiếm, thu hút các nhà đầu tư trong, ngoài thành phố và nước ngoài đầu tư trực tiếp cho các dự án khởi nghiệp, qua đó dần hình thành và phát triển mạng lưới nhà đầu tư cho khởi nghiệp ĐMST của thành phố; tìm kiếm, kết nối khách hàng để mua hoặc đặt hàng sản phẩm, dịch vụ, giải pháp công nghệ của các doanh nghiệp khởi nghiệp.

Năm 2021, do ảnh hưởng của dịch bệnh, sự kiện này sẽ được tổ chức song song theo hai hình thức trực tiếp và trực tuyến. Các doanh nghiệp và dự án khởi nghiệp tham gia (bên cung) sẽ là những đơn vị cung cấp những giải pháp đầy triển vọng trong các lĩnh vực F&B, Fintech, IT, hóa chất, nông nghiệp, công nghiệp... hỗ trợ các DN giải quyết những vấn đề bất cập trong quá trình sản xuất, kinh doanh.

Thời gian tổ chức kết nối: 08h15 - 16h00 ngày 19/10/2021 (tùy theo đăng ký của đơn vị)

Địa điểm tổ chức trực tiếp: Sở Khoa học và Công nghệ Đà Nẵng

Kết nối qua hình thức trực tuyến: Thông qua nền tảng ZOOM.

Sự kiện sẽ được truyền hình trực tiếp qua nền tảng youtube tại Hai Phong Startup và fanpage StartupDaNang.

Trân trọng kính mời các Quý doanh nghiệp, các nhà đầu tư, quỹ đầu tư quan tâm tham gia kết nối 

Mọi chi tiết xin liên hệ: 

Ms Cẩm Hương  0 912 940509 (Zalo), Ms Nhung 0904 163 863

Email: knsangtao@gmail.com.', CAST(N'2021-10-31' AS Date))
SET IDENTITY_INSERT [dbo].[news] OFF
GO
SET IDENTITY_INSERT [dbo].[projects] ON 

INSERT [dbo].[projects] ([id], [userid], [categoryid], [projectname], [amountcalled], [projectdetail], [country], [province], [district], [subdistrict], [houseno], [totalvoted], [aceptedstatus], [title], [imagepresent], [postedday], [sumvoted], [liketotal]) VALUES (1, 4, 1, N'FINBOX - CỐ VẤN ĐẦU TƯ CHỨNG KHOÁN', 100000.0000, N'Finbox là một công cụ Cố vấn đầu tư chứng khoán 4.0 được xây dựng trên nền tảng công nghệ trí tuệ nhân tạo. Với bộ máy xử lý dữ liệu lớn, Finbox có thể phân tích tất cả các dữ liệu trong vòng 1 năm của toàn thị trường để tự động đưa ra các khuyến nghị mua - bán với độ chính xác cao.

Finbox có nhiều tính năng hữu ích giải quyết được các vấn đề của các nhà đầu tư như: xác định tín hiệu điểm mua - điểm bán, phân tích xu hướng thị trường, xếp hạng doanh nghiệp, tự tạo bộ lọc cổ phiếu, theo dõi danh mục 24/7, săn tin tức.

Để sử dụng Finbox, bạn có thể tạo tài khoản miễn phí tại: http://finbox.vn.Thị trường ngày nay đã lớn hơn trước rất nhiều với hơn 1,500 cổ phiếu được niêm yết trên 3 sàn. Điều này dẫn đến những biến động ngày càng nhanh bởi sự tác động của lượng thông tin khổng lồ. Nếu không có “bộ não thứ 2” là máy móc thì các nhà đầu tư rất dễ rơi vào tình trạng quá tải.

Con người trong thời đại 4.0 cũng vô cùng bận rộn với các công việc riêng, mối quan hệ xã hội hay các hoạt động giải trí. Thay vì suốt ngày “bám bảng” với các con số xanh - đỏ, hãy giao một phần công việc đầu tư cho máy móc để có thêm thời gian tận hưởng cuộc sống.

Theo chia sẻ của anh Lê Ngọc Hải - người sáng lập Finbox, “Mọi phân tích & tính toán của con người trong đầu tư thì máy móc đều có thể làm được và làm tốt hơn rất nhiều. Khả năng của con người là có giới hạn, chúng ta khó có thể nhanh hơn, mạnh hơn và kỷ luật hơn máy móc”.Sau 10 tháng ra mắt, hiện Finbox đã có 6.000 người dùng. Các khuyến nghị trên Finbox đã giúp nhiều nhà đầu tư thoát được giai đoạn downtrend tháng 04/2018 và đầu tư trở lại vào tháng 07/2018. Gần đây, Finbox cũng đã phát đi tín hiệu cảnh báo downtrend từ ngày 08/10', N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Thanh Bình', N'35 Cao Thắng', 4.5, 1, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[projects] ([id], [userid], [categoryid], [projectname], [amountcalled], [projectdetail], [country], [province], [district], [subdistrict], [houseno], [totalvoted], [aceptedstatus], [title], [imagepresent], [postedday], [sumvoted], [liketotal]) VALUES (2, 8, 5, N'HỆ THỐNG ĐIỂM DANH HỌC SINH SỬ DỤNG TRÍ TUỆ NHÂN TẠO HAPPYSCHOOL', 100000.0000, N'Xuất phát từ câu chuyện đau lòng của trường Tiểu học Gateway nhóm dự án đã quyết tâm phát triển hệ thống điểm danh học sinh sử dụng trí tuệ nhân tạo với lai độ chính xác cao, đưa ra kết quả tức thời và có khả năng thay thế cho phương pháp điểm danh truyền thống còn điểm thiếu sót và mất thời gian thực hiện.
Hệ thống điểm danh học sinh sử dụng trí tuệ nhân tạo HAPPYSCHOOL ra đời với mục đích:

- Giúp nhà trường nhận diện và đảm bảo an toàn cho các bé khi đến/ rời trường

- Giúp phụ huynh nhận được thông báo kịp thời khi trẻ đến/ rời trường

- Tạo kênh liên lạc thường xuyên giữa nhà trường và phụ huynh

Những tính năng sản phẩm của Happy school:

- Với nhà trường, trung tâm đào tạo:

Quản lý thông tin phụ huynh (mã ID phụ huynh, họ tên, số điện thoại, email, facebook, danh sách con theo học)
Quản lý các camera
Quản lý các khu vực đưa đón, vào ra
 Quản lý HUB trong lớp học
Quản lý gửi tin nhắn tới phụ huynh
Quản lý tài khoản, phân quyền
Quản lý lưu trữ hình ảnh hệ thông điểm danh trên cloud
-  Với phụ huynh học sinh:

Nhận thông báo khi con đến/ rời lớp qua App kèm hình ảnh thời gian thực
Nhận kết quả học tập, thông báo khác của nhà trường qua App
Xin nghỉ học kiểm tra thông tin, để lại lời nhắn với nhà trường/ giáo viên/ trợ giảng
- Với giáo viên, trợ giảng:

 Nắm thông tin chính xác kịp thời việc đến/ rời trường của học sinh, sỹ số lớp
Nhận, gửi thông báo với phụ huynh qua App Hub hoặc App giáo viên
Trung tâm kết nối thông tin tại lớp họcĐộ chính xác của hệ thống:

- Công nghệ AI: hệ thống AI càng đưa vào sử dụng lâu càng có độ chính xác cao

- Hệ thống có thể đạt tới độ chính xác tối đa 99.78% trong nhiều điều kiện thực nghiệm

- Điều kiện ảnh hưởng đến độ chính xác: chất lượng camera, môi trường (ánh sáng, vật che chắn), trang phục (mũ, kính, khẩu trang – đưa vào quy trình đưa đón trẻ)

Phân khúc khách hàng của dự án:

- Nhà trường, trung tâm đào tạo (ưu tiên các đơn vị giáo dục sẵn sàng ứng dụng CNTT trong công quản lý)

- Phụ huynh học sinh (ưu tiên khu vực thành phố, có mức độ sử dụng smartphone phổ biến, dễ tiếp nhận ứng dụng CNTT)

Kênh bán hàng:

- Kênh bán hàng trực tiếp của VNNET.AI

- Kênh bán hàng gián tiếp qua các nhà phân phối tại từng khu vực

 Hướng mở rộng sản phẩm:

- Ứng dụng cho học sinh để tham gia quá trình học online; truy cập học liệu điện tử, làm bài tập, giao tiếp giáo viên

- Kênh hỗ trợ đào tạo: hỗ trợ tạo thói quen tốt, học từ vựng mới hàng ngày,…

- Kết nối IoT theo dõi chất lượng không khí, nhiệt độ, độ ẩm trong lớp

- Hướng nghiên cứu

- Phát triển mạng xã hội giáo dục

- Máy đọc sách điện tử màn hình công nghệ E-ink tích hợp sổ liên lạc điện tử', N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Thanh Bình', N'35 Cao Thắng', 4.5, 1, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[projects] ([id], [userid], [categoryid], [projectname], [amountcalled], [projectdetail], [country], [province], [district], [subdistrict], [houseno], [totalvoted], [aceptedstatus], [title], [imagepresent], [postedday], [sumvoted], [liketotal]) VALUES (3, 8, 3, N'EZCLOUD - PHẦN MỀM QUẢN LÝ KHÁCH SẠN TỐI ƯU', 300000.0000, N'Tuy mới thành lập từ năm 2013 với 6 sáng lập viên là những người bạn cùng lớp đại học tại Khoa Công nghệ thông tin, Đại học quốc gia Hà Nội, Công ty TNHH Công nghệ ezCloud Toàn cầu đã có những hành trình đáng khâm phục như: Top ba khởi nghiệp xuất sắc nhất của HATCH tháng 12/2015; top 15 doanh nghiệp xuất sắc nhất châu Á tham sự hội thảo của Seedstars World toàn cầu tại Thụy Sỹ vào tháng 2 năm 2016; một trong 8 DNKN được lựa chọn tham dự hội nghị thượng đỉnh toàn cầu tại PaLo ALTO, bang California, Mỹ; một trong 10 DNKN được yêu thích nhất tại Startup Festival 2016; một trong 14 doanh nghiệp điển hình tham dự hội nghị công nghệ Slush tại Hensiki, Phần Lan vào 11/2016, top 10 Best Startup tại Startup Festival Vietnam 2016.ezCloud ra đời từ ý tưởng của những người đồng sáng lập mong muốn xây dựng một phần mềm dựa trên những kiến thức học được ở trường để phát triển một sản phẩm của riêng mình – một sản phẩm do người Việt phát triển, trước hết dành cho người Việt và sau đó có thể mở rộng ra nước ngoài. TS. Đặng Thàng Trung cho biết: “Chúng tôi nhận thấy việc tiếp nhận và phát triển các giải pháp về công nghệ thông tin tại Việt Nam không hề thua kém các nước trên thế giới. Cùng với đó, lĩnh vực du lịch là một trong những định hướng phát triển đầy tiềm năng và được sự hỗ trợ rất nhiều từ định hướng phát triển kinh tế du lịch của Đảng và Nhà nước. Do đó, ezCloud được thành lập và hướng đến việc cung cấp các giải pháp trong lĩnh vực TravelTech (Công nghệ du lịch) cho các khách sạn không chỉ để quản lý các hoạt động hàng ngày mà còn giúp các khách sạn kinh doanh và phát triển. Đây là sự khác biệt mà chúng tôi muốn mang tới cho các khách hàng của mình”.
Trong những năm đầu thành lập, ezCloud gặp rất nhiều khó khăn. Mặc dù công ty được thành lập nhưng chưa có văn phòng mà chủ yếu làm việc tại quán café để tiết kiệm chi phí. Công ty cũng không có chiến lược kinh doanh mà chỉ bán hàng dựa trên các mối quan hệ và thói quen nhỏ lẻ cũng như chưa định hướng được thị trường. Bên cạnh đó, doanh thu chủ yếu đến từ việc bán sản phẩm nên khá ít ỏi. Số lượng các đồng sáng lập Công ty trong giai đoạn đầu nhiều hơn nhân viên và phải kiêm nhiệm hầu hết tất cả các công việc từ kinh doanh, marketing, tài chính, phát triển sản phẩm, … mà không có lương trong vòng 2 năm. Tuy nhiên, do không có nhiều kinh nghiệm nên việc kiêm nhiệm hiển nhiên là không có hiệu quả. Trong khi đó, Công ty không có định hướng phát triển sản phẩm cụ thể, chỉ dựa trên các yêu cầu của khách hàng nên sản phẩm không được định hình một cách rõ ràng. Cùng với đó, áp lực không chỉ đến từ công việc mà còn đến từ phía gia đình.

Anh Trung cho biết: “Đây cũng là hoàn cảnh chung của các startup trong giai đoạn đầu thành lập và thực sự nếu không có được sự hỗ trợ thì hầu hết các startup đều khó có thể vượt qua được giai đoạn này. Và thật may mắn, ezCloud đã nhận được sự hỗ trợ từ IPP, một dự án có thể coi là mang tới một bước ngoặt cho sự phát triển của Công ty”.
Việc ezCloud có được sự hỗ trợ này có thể coi là khá tình cờ, do được sự giới thiệu của một người bạn. Những kinh nghiệm thực tế mà ezCloud rút ra được là trong quá trình khởi nghiệp, ngoài đam mê, năng lực và sản phẩm hoặc ý tưởng (đây là điều hiển nhiên) thì một trong những yếu tố khá quan trọng mà startup cần phải quan tâm đó là các mối quan hệ. Và ezCloud đã nộp hồ sơ cho IPP thông qua sự giới thiệu của bạn bè và coi việc tham gia gọi vốn từ IPP là một trong những dự án quan trọng của mình nên đã có sự chuẩn bị khá chu đáo.
Là doanh nghiệp khởi nghiệp có bề dày kinh nghiệm trong việc kêu gọi đầu tư, ezCloud đã đúc rút ra một số kinh nghiệm cần chú ý như sau:
– Nghiên cứu kỹ các yêu cầu của quỹ. Mỗi quỹ tài trợ thường có các mục tiêu khác nhau, nên sẽ có các ràng buộc và yêu cầu khác nhau. Việc chuẩn bị hồ sơ phải tập trung vào các yêu cầu này;
– Hiểu rõ các vấn đề mà startup đang gặp phải và nhu cầu thực sự của startup là gì;
– Có kế hoạch chi tiết và phù hợp cho các hoạt động cũng như các chi phí tương ứng.
Anh Trung chia sẻ: “Lúc xin tài trợ, vấn đề quan tâm đầu tiên của ezCloud đối với dự án đó là nguồn vốn. Tuy nhiên, sau này ezCloud nhận ra rằng, đây không phải là vấn đề quan trọng nhất mà chúng tôi nhận được. Trên thực tế, ngoài nguồn vốn, chúng tôi nhận được nhiều hơn thế: Đó là các mối quan hệ mới; sự tư vấn, cố vấn trực tiếp từ các mentor, những người hướng dẫn thực tế, từng bước cho chúng tôi chiến lược quản lý nhân sự, marketing, kinh doanh, thị trường, chân dung khách hàng, định hướng phát triển sản phẩm và qui trình vận hành doanh nghiệp. Với sự hỗ trợ như vậy, việc sử dụng nguồn vốn mới thực sự hiệu quả đối với các startup vì trên thực tế, các startup thường thiếu các kỹ năng quản trị, vận hành cũng như kế hoạch cụ thể trong việc sử dụng nguồn vốn”. “Mô hình hỗ trợ của IPP thực sự rất quan trọng đối với các startup của Việt Nam”, Anh Trung nhận định.


Sau khi thành công trong giai đoạn 1, ezCloud đã được lựa chọn vào tiếp giai đoạn 2 của IPP. Và đúng như mục tiêu của giai đoạn 2, sau khi ezCloud đã có được những kinh nghiệm vô cùng quí báu cho việc vận hành và phát triển doanh nghiệp tại giai đoạn 1, ezCloud hướng tới việc mở rộng thị trường dựa trên các sản phẩm mới được phát triển từ việc đánh giá sâu hơn về thị trường và nhu cầu của người dùng cũng như kinh nghiệm phát triển sản phẩm ở giai đoạn 1. ezCloud hiểu được là cần phải làm gì, phát triển cái gì để có thể chiếm lĩnh thị trường và đã phát triển đột phá với các sản phẩm mới của mình, tạo sự khác biệt với thị trường còn lại.
Thêm vào đó, trong giai đoạn 2, ezCloud nhờ các mối quan hệ của IPP, sự tư vấn trực tiếp của các chuyên gia thuộc nhiều lĩnh vực trong cộng đồng của IPP, ezCloud đã tích lũy được các kinh nghiệm về gọi vốn, gọi quỹ đầu tư. Đây là một trong những mục tiêu mà hầu như các startup nào cũng hướng tới khi khởi nghiệp, nhưng thực sự, nó không hề đơn giản và tiềm ẩn rất nhiều rủi ro không lường trước được nếu không có kinh nghiệm. Theo kinh nghiệp của ezCloud, trước khi gọi vốn các startup cần trả lời các câu hỏi sau:
– Gọi vốn để làm gì? Tại sao phải gọi vốn? Có thực sự cần thiết phải gọi vốn không?
– Kêu gọi vốn bao nhiêu là đủ? Bán bao nhiêu cổ phần là đủ?
– Làm sao để không bị các nhà đầu tư chèn ép

– Làm sao để tìm được nhà đầu tư phù hợp với mình?
– Bạn đã có kế hoạch cụ thể để sử dụng nguồnmvốn chưa?
Các nhà đầu tư thường rất giỏi về tài chính, do đó, mục tiêu của họ thường không giống như mục tiêu của startup. Chúng ta luôn mong muốn sự kết hợp với các nhà đầu tư để giải quyết được bài toán win-win cho cả hai bên. Nhưng thực tế, không phải lúc nào cũng gặp được nhà đầu tư như mong muốn, trừ các quỹ thiên thần như IPP.
Với sự hỗ trợ 2 lần từ IPP, ezCloud đã đạt được một số phát triển đáng kể: Về sản phẩm: ezCloud đã ra đời một sản phẩm mang tính đột phá tại thị trường Việt Nam, đó là ezCloudHotel, một giải pháp quản lý dựa trên nền tảng công nghệ điện toán đám mây cho tất cả mọi người và sử dụng rất đơn giản. Từ đó, Công ty đã mở rộng và tích hợp với rất nhiều các kênh kết nối khác hỗ trợ khách sạn không chỉ quản lý mà còn kinh doanh, giúp doanh thu của khách sạn tăng lên đáng kể. Nhờ có sự hỗ trợ của IPP trong giai đoạn này, ezCloud đã có sự phát triển đột phá, vươn lên một tầm cao khác so với giai đoạn khởi nghiệp ban đầu.

Nhân sự của Công ty cũng tăng lên đáng kể, từ ngày thành lập với 4 nhân viên, hiện tại công ty đã có khoảng 80 nhân viên với doanh thu trung bình tăng trưởng 200%/năm. Đến nay, ezCloud có trụ sở ở cả 3 miền Bắc – Trung – Nam và ở Singapore, được tin dùng bởi hơn 1000 khách sạn tại 5 quốc gia gồm Việt Nam, Lào, Thái Lan, Campuchia, Myanmar, quản lý hơn 40.000 phòng khách sạn trên toàn thế giới và hơn 450 tỷ giao dịch mỗi năm.
Về tầm nhìn trong thời gian tới, Công ty đặt kế hoach đến năm 2020, trở thành 1 trong những công ty đứng đầu châu Á về lĩnh vực TravelTech, chiếm 50% thị phần trong ngành dịch vụ khách sạn và là 1 trong những công ty công nghệ hàng đầu, có môi trường làm việc đáng mơ ước tại Việt Nam.', N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Thanh Bình', N'35 Cao Thắng', 4.5, 1, NULL, NULL, NULL, 0, 0)
INSERT [dbo].[projects] ([id], [userid], [categoryid], [projectname], [amountcalled], [projectdetail], [country], [province], [district], [subdistrict], [houseno], [totalvoted], [aceptedstatus], [title], [imagepresent], [postedday], [sumvoted], [liketotal]) VALUES (4, 5, 5, N'Chương trình AI hóa máy móc trong công nghiệp', 3000000.0000, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae hendrerit tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas a vehicula lacus. Sed vulputate, diam quis luctus viverra, neque felis consectetur sapien, id imperdiet odio dolor et urna. Duis sed magna ultrices, pulvinar velit vitae, porttitor elit. Donec sed purus id magna laoreet tincidunt. Sed pretium nisi vitae dolor posuere dictum. Nullam in urna erat. Suspendisse sed blandit justo, id mattis mauris. Maecenas ultricies quam in quam imperdiet, in ornare eros interdum.

Nam est turpis, tempor et vulputate a, faucibus et ex. Duis mauris leo, pellentesque et magna quis, interdum fringilla leo. Nam ac eros vel turpis dignissim dapibus. Etiam aliquam dapibus tortor eu tincidunt. Phasellus sed molestie lectus. Nunc eleifend mauris arcu, eget tincidunt ante varius in. Aenean rhoncus purus at sem condimentum, nec luctus tortor interdum. Aliquam eget est nisi. Ut non velit imperdiet, blandit nisl et, egestas elit. Maecenas a bibendum risus. Donec lacinia a nulla vel tincidunt.

Proin hendrerit placerat lorem, sit amet dictum urna pharetra id. Nulla eu eros elit. Nunc consectetur ipsum nec cursus efficitur. Proin ullamcorper erat vitae elit dictum luctus. Suspendisse potenti. Vestibulum venenatis condimentum mi, vitae iaculis velit ultrices id. Pellentesque ut fringilla est. Interdum et malesuada fames ac ante ipsum primis in faucibus.

Etiam faucibus ipsum urna, euismod tincidunt tortor congue sit amet. Duis congue turpis metus. Aliquam efficitur augue consequat justo malesuada molestie. Cras vel mattis arcu. Vestibulum molestie, turpis nec facilisis vulputate, eros enim hendrerit tortor, nec aliquet nisi metus lobortis diam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed eu tellus vel elit convallis facilisis. In elementum sapien et justo mattis ultrices. Fusce rhoncus felis nibh, a maximus odio placerat nec. Praesent egestas sem orci. Duis placerat consequat justo, sagittis tempus metus imperdiet id. Aliquam dictum semper varius. Proin dolor quam, ultricies vitae ipsum quis, convallis elementum justo. Phasellus sodales tempus elit nec vulputate.', N'Việt Nam', N'Thành phố Hà Nội', N'Quận Tây Hồ', N'Phường Nhật Tân', N'130 Nguyễn Thị Minh Khai', 4.5, 0, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vitae hendrerit tortor', NULL, NULL, 2, 0)
INSERT [dbo].[projects] ([id], [userid], [categoryid], [projectname], [amountcalled], [projectdetail], [country], [province], [district], [subdistrict], [houseno], [totalvoted], [aceptedstatus], [title], [imagepresent], [postedday], [sumvoted], [liketotal]) VALUES (5, 5, 7, N'Trồng lúa mà không cần giống', 100000000.0000, N'Proin hendrerit placerat lorem, sit amet dictum urna pharetra id. Nulla eu eros elit. Nunc consectetur ipsum nec cursus efficitur. Proin ullamcorper erat vitae elit dictum luctus. Suspendisse potenti. Vestibulum venenatis condimentum mi, vitae iaculis velit ultrices id. Pellentesque ut fringilla est. Interdum et malesuada fames ac ante ipsum primis in faucibus.

Etiam faucibus ipsum urna, euismod tincidunt tortor congue sit amet. Duis congue turpis metus. Aliquam efficitur augue consequat justo malesuada molestie. Cras vel mattis arcu. Vestibulum molestie, turpis nec facilisis vulputate, eros enim hendrerit tortor, nec aliquet nisi metus lobortis diam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed eu tellus vel elit convallis facilisis. In elementum sapien et justo mattis ultrices. Fusce rhoncus felis nibh, a maximus odio placerat nec. Praesent egestas sem orci. Duis placerat consequat justo, sagittis tempus metus imperdiet id. Aliquam dictum semper varius. Proin dolor quam, ultricies vitae ipsum quis, convallis elementum justo. Phasellus sodales tempus elit nec vulputate.', N'1', N'Thành phố Hà Nội', N'Quận Cầu Giấy', N'Phường Yên Hoà', N'01 Trần Văn Thụ', 0, 0, N'Nam est turpis, tempor et vulputate a, faucibus et ex. Duis mauris leo', NULL, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[projects] OFF
GO
INSERT [dbo].[province] ([id], [name]) VALUES (N'01', N'Thành phố Hà Nội')
INSERT [dbo].[province] ([id], [name]) VALUES (N'02', N'Tỉnh Hà Giang')
INSERT [dbo].[province] ([id], [name]) VALUES (N'04', N'Tỉnh Cao Bằng')
INSERT [dbo].[province] ([id], [name]) VALUES (N'06', N'Tỉnh Bắc Kạn')
INSERT [dbo].[province] ([id], [name]) VALUES (N'08', N'Tỉnh Tuyên Quang')
INSERT [dbo].[province] ([id], [name]) VALUES (N'10', N'Tỉnh Lào Cai')
INSERT [dbo].[province] ([id], [name]) VALUES (N'11', N'Tỉnh Điện Biên')
INSERT [dbo].[province] ([id], [name]) VALUES (N'12', N'Tỉnh Lai Châu')
INSERT [dbo].[province] ([id], [name]) VALUES (N'14', N'Tỉnh Sơn La')
INSERT [dbo].[province] ([id], [name]) VALUES (N'15', N'Tỉnh Yên Bái')
INSERT [dbo].[province] ([id], [name]) VALUES (N'17', N'Tỉnh Hoà Bình')
INSERT [dbo].[province] ([id], [name]) VALUES (N'19', N'Tỉnh Thái Nguyên')
INSERT [dbo].[province] ([id], [name]) VALUES (N'20', N'Tỉnh Lạng Sơn')
INSERT [dbo].[province] ([id], [name]) VALUES (N'22', N'Tỉnh Quảng Ninh')
INSERT [dbo].[province] ([id], [name]) VALUES (N'24', N'Tỉnh Bắc Giang')
INSERT [dbo].[province] ([id], [name]) VALUES (N'25', N'Tỉnh Phú Thọ')
INSERT [dbo].[province] ([id], [name]) VALUES (N'26', N'Tỉnh Vĩnh Phúc')
INSERT [dbo].[province] ([id], [name]) VALUES (N'27', N'Tỉnh Bắc Ninh')
INSERT [dbo].[province] ([id], [name]) VALUES (N'30', N'Tỉnh Hải Dương')
INSERT [dbo].[province] ([id], [name]) VALUES (N'31', N'Thành phố Hải Phòng')
INSERT [dbo].[province] ([id], [name]) VALUES (N'33', N'Tỉnh Hưng Yên')
INSERT [dbo].[province] ([id], [name]) VALUES (N'34', N'Tỉnh Thái Bình')
INSERT [dbo].[province] ([id], [name]) VALUES (N'35', N'Tỉnh Hà Nam')
INSERT [dbo].[province] ([id], [name]) VALUES (N'36', N'Tỉnh Nam Định')
INSERT [dbo].[province] ([id], [name]) VALUES (N'37', N'Tỉnh Ninh Bình')
INSERT [dbo].[province] ([id], [name]) VALUES (N'38', N'Tỉnh Thanh Hóa')
INSERT [dbo].[province] ([id], [name]) VALUES (N'40', N'Tỉnh Nghệ An')
INSERT [dbo].[province] ([id], [name]) VALUES (N'42', N'Tỉnh Hà Tĩnh')
INSERT [dbo].[province] ([id], [name]) VALUES (N'44', N'Tỉnh Quảng Bình')
INSERT [dbo].[province] ([id], [name]) VALUES (N'45', N'Tỉnh Quảng Trị')
INSERT [dbo].[province] ([id], [name]) VALUES (N'46', N'Tỉnh Thừa Thiên Huế')
INSERT [dbo].[province] ([id], [name]) VALUES (N'48', N'Thành phố Đà Nẵng')
INSERT [dbo].[province] ([id], [name]) VALUES (N'49', N'Tỉnh Quảng Nam')
INSERT [dbo].[province] ([id], [name]) VALUES (N'51', N'Tỉnh Quảng Ngãi')
INSERT [dbo].[province] ([id], [name]) VALUES (N'52', N'Tỉnh Bình Định')
INSERT [dbo].[province] ([id], [name]) VALUES (N'54', N'Tỉnh Phú Yên')
INSERT [dbo].[province] ([id], [name]) VALUES (N'56', N'Tỉnh Khánh Hòa')
INSERT [dbo].[province] ([id], [name]) VALUES (N'58', N'Tỉnh Ninh Thuận')
INSERT [dbo].[province] ([id], [name]) VALUES (N'60', N'Tỉnh Bình Thuận')
INSERT [dbo].[province] ([id], [name]) VALUES (N'62', N'Tỉnh Kon Tum')
INSERT [dbo].[province] ([id], [name]) VALUES (N'64', N'Tỉnh Gia Lai')
INSERT [dbo].[province] ([id], [name]) VALUES (N'66', N'Tỉnh Đắk Lắk')
INSERT [dbo].[province] ([id], [name]) VALUES (N'67', N'Tỉnh Đắk Nông')
INSERT [dbo].[province] ([id], [name]) VALUES (N'68', N'Tỉnh Lâm Đồng')
INSERT [dbo].[province] ([id], [name]) VALUES (N'70', N'Tỉnh Bình Phước')
INSERT [dbo].[province] ([id], [name]) VALUES (N'72', N'Tỉnh Tây Ninh')
INSERT [dbo].[province] ([id], [name]) VALUES (N'74', N'Tỉnh Bình Dương')
INSERT [dbo].[province] ([id], [name]) VALUES (N'75', N'Tỉnh Đồng Nai')
INSERT [dbo].[province] ([id], [name]) VALUES (N'77', N'Tỉnh Bà Rịa - Vũng Tàu')
INSERT [dbo].[province] ([id], [name]) VALUES (N'79', N'Thành phố Hồ Chí Minh')
INSERT [dbo].[province] ([id], [name]) VALUES (N'80', N'Tỉnh Long An')
INSERT [dbo].[province] ([id], [name]) VALUES (N'82', N'Tỉnh Tiền Giang')
INSERT [dbo].[province] ([id], [name]) VALUES (N'83', N'Tỉnh Bến Tre')
INSERT [dbo].[province] ([id], [name]) VALUES (N'84', N'Tỉnh Trà Vinh')
INSERT [dbo].[province] ([id], [name]) VALUES (N'86', N'Tỉnh Vĩnh Long')
INSERT [dbo].[province] ([id], [name]) VALUES (N'87', N'Tỉnh Đồng Tháp')
INSERT [dbo].[province] ([id], [name]) VALUES (N'89', N'Tỉnh An Giang')
INSERT [dbo].[province] ([id], [name]) VALUES (N'91', N'Tỉnh Kiên Giang')
INSERT [dbo].[province] ([id], [name]) VALUES (N'92', N'Thành phố Cần Thơ')
INSERT [dbo].[province] ([id], [name]) VALUES (N'93', N'Tỉnh Hậu Giang')
INSERT [dbo].[province] ([id], [name]) VALUES (N'94', N'Tỉnh Sóc Trăng')
INSERT [dbo].[province] ([id], [name]) VALUES (N'95', N'Tỉnh Bạc Liêu')
INSERT [dbo].[province] ([id], [name]) VALUES (N'96', N'Tỉnh Cà Mau')
GO
SET IDENTITY_INSERT [dbo].[startupcurriculumvitae] ON 

INSERT [dbo].[startupcurriculumvitae] ([id], [userid], [country], [province], [district], [subdistrict], [houseno], [contactemail], [contactphone]) VALUES (1, 4, N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Thanh Bình', N'35 Cao Thắng', N'Chung@gmail.com                                   ', N'0123456766')
INSERT [dbo].[startupcurriculumvitae] ([id], [userid], [country], [province], [district], [subdistrict], [houseno], [contactemail], [contactphone]) VALUES (2, 5, N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Thanh Bình', N'50 Cao Thắng', N'Linh@gmail.com                                    ', N'0123456799')
INSERT [dbo].[startupcurriculumvitae] ([id], [userid], [country], [province], [district], [subdistrict], [houseno], [contactemail], [contactphone]) VALUES (3, 8, N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Thanh Bình', N'69 Cao Thắng', N'Nghia@gmail.com                                   ', N'0123456733')
SET IDENTITY_INSERT [dbo].[startupcurriculumvitae] OFF
GO
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00001', N'Phường Phúc Xá', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00004', N'Phường Trúc Bạch', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00006', N'Phường Vĩnh Phúc', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00007', N'Phường Cống Vị', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00008', N'Phường Liễu Giai', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00010', N'Phường Nguyễn Trung Trực', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00013', N'Phường Quán Thánh', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00016', N'Phường Ngọc Hà', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00019', N'Phường Điện Biên', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00022', N'Phường Đội Cấn', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00025', N'Phường Ngọc Khánh', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00028', N'Phường Kim Mã', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00031', N'Phường Giảng Võ', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00034', N'Phường Thành Công', N'001')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00037', N'Phường Phúc Tân', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00040', N'Phường Đồng Xuân', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00043', N'Phường Hàng Mã', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00046', N'Phường Hàng Buồm', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00049', N'Phường Hàng Đào', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00052', N'Phường Hàng Bồ', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00055', N'Phường Cửa Đông', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00058', N'Phường Lý Thái Tổ', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00061', N'Phường Hàng Bạc', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00064', N'Phường Hàng Gai', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00067', N'Phường Chương Dương', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00070', N'Phường Hàng Trống', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00073', N'Phường Cửa Nam', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00076', N'Phường Hàng Bông', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00079', N'Phường Tràng Tiền', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00082', N'Phường Trần Hưng Đạo', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00085', N'Phường Phan Chu Trinh', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00088', N'Phường Hàng Bài', N'002')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00091', N'Phường Phú Thượng', N'003')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00094', N'Phường Nhật Tân', N'003')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00097', N'Phường Tứ Liên', N'003')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00100', N'Phường Quảng An', N'003')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00103', N'Phường Xuân La', N'003')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00106', N'Phường Yên Phụ', N'003')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00109', N'Phường Bưởi', N'003')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00112', N'Phường Thụy Khuê', N'003')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00115', N'Phường Thượng Thanh', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00118', N'Phường Ngọc Thụy', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00121', N'Phường Giang Biên', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00124', N'Phường Đức Giang', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00127', N'Phường Việt Hưng', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00130', N'Phường Gia Thụy', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00133', N'Phường Ngọc Lâm', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00136', N'Phường Phúc Lợi', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00139', N'Phường Bồ Đề', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00142', N'Phường Sài Đồng', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00145', N'Phường Long Biên', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00148', N'Phường Thạch Bàn', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00151', N'Phường Phúc Đồng', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00154', N'Phường Cự Khối', N'004')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00157', N'Phường Nghĩa Đô', N'005')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00160', N'Phường Nghĩa Tân', N'005')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00163', N'Phường Mai Dịch', N'005')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00166', N'Phường Dịch Vọng', N'005')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00167', N'Phường Dịch Vọng Hậu', N'005')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00169', N'Phường Quan Hoa', N'005')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00172', N'Phường Yên Hoà', N'005')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00175', N'Phường Trung Hoà', N'005')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00178', N'Phường Cát Linh', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00181', N'Phường Văn Miếu', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00184', N'Phường Quốc Tử Giám', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00187', N'Phường Láng Thượng', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00190', N'Phường Ô Chợ Dừa', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00193', N'Phường Văn Chương', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00196', N'Phường Hàng Bột', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00199', N'Phường Láng Hạ', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00202', N'Phường Khâm Thiên', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00205', N'Phường Thổ Quan', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00208', N'Phường Nam Đồng', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00211', N'Phường Trung Phụng', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00214', N'Phường Quang Trung', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00217', N'Phường Trung Liệt', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00220', N'Phường Phương Liên', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00223', N'Phường Thịnh Quang', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00226', N'Phường Trung Tự', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00229', N'Phường Kim Liên', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00232', N'Phường Phương Mai', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00235', N'Phường Ngã Tư Sở', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00238', N'Phường Khương Thượng', N'006')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00241', N'Phường Nguyễn Du', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00244', N'Phường Bạch Đằng', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00247', N'Phường Phạm Đình Hổ', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00256', N'Phường Lê Đại Hành', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00259', N'Phường Đồng Nhân', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00262', N'Phường Phố Huế', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00265', N'Phường Đống Mác', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00268', N'Phường Thanh Lương', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00271', N'Phường Thanh Nhàn', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00274', N'Phường Cầu Dền', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00277', N'Phường Bách Khoa', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00280', N'Phường Đồng Tâm', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00283', N'Phường Vĩnh Tuy', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00286', N'Phường Bạch Mai', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00289', N'Phường Quỳnh Mai', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00292', N'Phường Quỳnh Lôi', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00295', N'Phường Minh Khai', N'007')
GO
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00298', N'Phường Trương Định', N'007')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00301', N'Phường Thanh Trì', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00304', N'Phường Vĩnh Hưng', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00307', N'Phường Định Công', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00310', N'Phường Mai Động', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00313', N'Phường Tương Mai', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00316', N'Phường Đại Kim', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00319', N'Phường Tân Mai', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00322', N'Phường Hoàng Văn Thụ', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00325', N'Phường Giáp Bát', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00328', N'Phường Lĩnh Nam', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00331', N'Phường Thịnh Liệt', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00334', N'Phường Trần Phú', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00337', N'Phường Hoàng Liệt', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00340', N'Phường Yên Sở', N'008')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00343', N'Phường Nhân Chính', N'009')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00346', N'Phường Thượng Đình', N'009')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00349', N'Phường Khương Trung', N'009')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00352', N'Phường Khương Mai', N'009')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00355', N'Phường Thanh Xuân Trung', N'009')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00358', N'Phường Phương Liệt', N'009')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00361', N'Phường Hạ Đình', N'009')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00364', N'Phường Khương Đình', N'009')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00367', N'Phường Thanh Xuân Bắc', N'009')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00370', N'Phường Thanh Xuân Nam', N'009')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00373', N'Phường Kim Giang', N'009')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00376', N'Thị trấn Sóc Sơn', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00379', N'Xã Bắc Sơn', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00382', N'Xã Minh Trí', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00385', N'Xã Hồng Kỳ', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00388', N'Xã Nam Sơn', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00391', N'Xã Trung Giã', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00394', N'Xã Tân Hưng', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00397', N'Xã Minh Phú', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00400', N'Xã Phù Linh', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00403', N'Xã Bắc Phú', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00406', N'Xã Tân Minh', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00409', N'Xã Quang Tiến', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00412', N'Xã Hiền Ninh', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00415', N'Xã Tân Dân', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00418', N'Xã Tiên Dược', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00421', N'Xã Việt Long', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00424', N'Xã Xuân Giang', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00427', N'Xã Mai Đình', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00430', N'Xã Đức Hoà', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00433', N'Xã Thanh Xuân', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00436', N'Xã Đông Xuân', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00439', N'Xã Kim Lũ', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00442', N'Xã Phú Cường', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00445', N'Xã Phú Minh', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00448', N'Xã Phù Lỗ', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00451', N'Xã Xuân Thu', N'016')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00454', N'Thị trấn Đông Anh', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00457', N'Xã Xuân Nộn', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00460', N'Xã Thuỵ Lâm', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00463', N'Xã Bắc Hồng', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00466', N'Xã Nguyên Khê', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00469', N'Xã Nam Hồng', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00472', N'Xã Tiên Dương', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00475', N'Xã Vân Hà', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00478', N'Xã Uy Nỗ', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00481', N'Xã Vân Nội', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00484', N'Xã Liên Hà', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00487', N'Xã Việt Hùng', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00490', N'Xã Kim Nỗ', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00493', N'Xã Kim Chung', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00496', N'Xã Dục Tú', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00499', N'Xã Đại Mạch', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00502', N'Xã Vĩnh Ngọc', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00505', N'Xã Cổ Loa', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00508', N'Xã Hải Bối', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00511', N'Xã Xuân Canh', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00514', N'Xã Võng La', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00517', N'Xã Tàm Xá', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00520', N'Xã Mai Lâm', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00523', N'Xã Đông Hội', N'017')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00526', N'Thị trấn Yên Viên', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00529', N'Xã Yên Thường', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00532', N'Xã Yên Viên', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00535', N'Xã Ninh Hiệp', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00538', N'Xã Đình Xuyên', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00541', N'Xã Dương Hà', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00544', N'Xã Phù Đổng', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00547', N'Xã Trung Mầu', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00550', N'Xã Lệ Chi', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00553', N'Xã Cổ Bi', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00556', N'Xã Đặng Xá', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00559', N'Xã Phú Thị', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00562', N'Xã Kim Sơn', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00565', N'Thị trấn Trâu Quỳ', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00568', N'Xã Dương Quang', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00571', N'Xã Dương Xá', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00574', N'Xã Đông Dư', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00577', N'Xã Đa Tốn', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00580', N'Xã Kiêu Kỵ', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00583', N'Xã Bát Tràng', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00586', N'Xã Kim Lan', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00589', N'Xã Văn Đức', N'018')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00592', N'Phường Cầu Diễn', N'019')
INSERT [dbo].[subdistrict] ([id], [name], [quanhuyenid]) VALUES (N'00622', N'Phường Xuân Phương', N'019')
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [passwords], [fullname], [gender], [email], [phone], [cccd], [birthday], [country], [province], [district], [subdistrict], [houseno], [roles], [job], [avataruser]) VALUES (1, N'admin', N'admin', N'Admin', N'Male ', N'Admin@gmail.com                                   ', N'0123456789', N'0987654321', CAST(N'2000-10-02' AS Date), N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Hòa Cường Nam', N'44 Lê thị Hồng Gấm', N'admin', N'Admin of website StarupDN', NULL)
INSERT [dbo].[users] ([id], [username], [passwords], [fullname], [gender], [email], [phone], [cccd], [birthday], [country], [province], [district], [subdistrict], [houseno], [roles], [job], [avataruser]) VALUES (2, N'vannhan', N'nhan', N'Dương Văn Nhân', N'Male ', N'Nhan@gmail.com                                    ', N'0366147657', N'0987654311', CAST(N'2000-10-02' AS Date), N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Hòa Cường Nam', N'45 Lê thị Hồng Gấm', N'investors', N'CEO Vin Group', NULL)
INSERT [dbo].[users] ([id], [username], [passwords], [fullname], [gender], [email], [phone], [cccd], [birthday], [country], [province], [district], [subdistrict], [houseno], [roles], [job], [avataruser]) VALUES (3, N'ngoctrai', N'trai', N'Võ Ngọc Trãi', N'Male ', N'Trai@gmail.com                                    ', N'0366147148', N'0987654331', CAST(N'2000-10-02' AS Date), N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Hòa Cường Nam', N'88 Lê thị Hồng Gấm', N'investors', N'Chairman of SunGroup', NULL)
INSERT [dbo].[users] ([id], [username], [passwords], [fullname], [gender], [email], [phone], [cccd], [birthday], [country], [province], [district], [subdistrict], [houseno], [roles], [job], [avataruser]) VALUES (4, N'hoangchung', N'chung', N'Trần Hoàng Chung', N'Male ', N'Chung@gmail.com                                   ', N'0123456766', N'0987654511', CAST(N'2000-10-02' AS Date), N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Hòa Cường Bắc', N'69 Lê Thanh Nghị', N'startup', N'Developer of Solution company', NULL)
INSERT [dbo].[users] ([id], [username], [passwords], [fullname], [gender], [email], [phone], [cccd], [birthday], [country], [province], [district], [subdistrict], [houseno], [roles], [job], [avataruser]) VALUES (5, N'vanlinh', N'linh', N'Hoàng Văn Linh', N'Male ', N'Linh@gmail.com                                    ', N'0123456799', N'0987654411', CAST(N'2000-10-02' AS Date), N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Hòa Cường Bắc', N'96 Lê Thanh Nghị', N'startup', N'Quality assurance of FTP Software ', NULL)
INSERT [dbo].[users] ([id], [username], [passwords], [fullname], [gender], [email], [phone], [cccd], [birthday], [country], [province], [district], [subdistrict], [houseno], [roles], [job], [avataruser]) VALUES (8, N'huunghia', N'nghia', N'Lê Hữu Nghĩa', N'Male ', N'Nghia@gmail.com                                   ', N'0123456733', N'0987654488', CAST(N'2000-06-09' AS Date), N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Hòa Cường Bắc', N'200 Lê Thanh Nghị', N'startup', N'Programmer', NULL)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__startupc__A82A6E6581B43B44]    Script Date: 12/11/2021 11:50:46 AM ******/
ALTER TABLE [dbo].[startupcurriculumvitae] ADD UNIQUE NONCLUSTERED 
(
	[contactemail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__startupc__B9248E69B7F7649F]    Script Date: 12/11/2021 11:50:46 AM ******/
ALTER TABLE [dbo].[startupcurriculumvitae] ADD UNIQUE NONCLUSTERED 
(
	[contactphone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__37D42BFA7AC79A28]    Script Date: 12/11/2021 11:50:46 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[cccd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E6164733FB9A4]    Script Date: 12/11/2021 11:50:46 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__B43B145F6982BFE5]    Script Date: 12/11/2021 11:50:46 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572FC24F32C]    Script Date: 12/11/2021 11:50:46 AM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[blogs] ADD  DEFAULT (getdate()) FOR [posteddate]
GO
ALTER TABLE [dbo].[comments] ADD  DEFAULT (getdate()) FOR [postedday]
GO
ALTER TABLE [dbo].[eventsreference] ADD  DEFAULT (getdate()) FOR [posteddate]
GO
ALTER TABLE [dbo].[news] ADD  DEFAULT (getdate()) FOR [posteddate]
GO
ALTER TABLE [dbo].[projects] ADD  CONSTRAINT [totalvoted_default]  DEFAULT ((0)) FOR [totalvoted]
GO
ALTER TABLE [dbo].[projects] ADD  DEFAULT (getdate()) FOR [postedday]
GO
ALTER TABLE [dbo].[projects] ADD  DEFAULT ((0)) FOR [sumvoted]
GO
ALTER TABLE [dbo].[projects] ADD  DEFAULT ((0)) FOR [liketotal]
GO
ALTER TABLE [dbo].[replies] ADD  DEFAULT (getdate()) FOR [postedday]
GO
ALTER TABLE [dbo].[replies] ADD  CONSTRAINT [defautl_total]  DEFAULT ((0)) FOR [liketotal]
GO
ALTER TABLE [dbo].[blogs]  WITH CHECK ADD FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[blogs]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD FOREIGN KEY([projectid])
REFERENCES [dbo].[projects] ([id])
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[district]  WITH CHECK ADD FOREIGN KEY([tinhid])
REFERENCES [dbo].[province] ([id])
GO
ALTER TABLE [dbo].[eventsreference]  WITH CHECK ADD FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[eventsreference]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[imageofproject]  WITH CHECK ADD FOREIGN KEY([projectid])
REFERENCES [dbo].[projects] ([id])
GO
ALTER TABLE [dbo].[investedproject]  WITH CHECK ADD FOREIGN KEY([projectid])
REFERENCES [dbo].[projects] ([id])
GO
ALTER TABLE [dbo].[investedproject]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[news]  WITH CHECK ADD FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[news]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[projects]  WITH CHECK ADD FOREIGN KEY([categoryid])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[projects]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[replies]  WITH CHECK ADD FOREIGN KEY([commentid])
REFERENCES [dbo].[comments] ([id])
GO
ALTER TABLE [dbo].[replies]  WITH CHECK ADD  CONSTRAINT [FKdlchrhx9cbe31xq9gbtfl91gx] FOREIGN KEY([commentid])
REFERENCES [dbo].[comments] ([id])
GO
ALTER TABLE [dbo].[replies] CHECK CONSTRAINT [FKdlchrhx9cbe31xq9gbtfl91gx]
GO
ALTER TABLE [dbo].[startupcurriculumvitae]  WITH CHECK ADD FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[subdistrict]  WITH CHECK ADD FOREIGN KEY([quanhuyenid])
REFERENCES [dbo].[district] ([id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([gender] like 'Male' OR [gender] like 'Female'))
GO
USE [master]
GO
ALTER DATABASE [StartUpDN] SET  READ_WRITE 
GO
