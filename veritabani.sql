USE [Deneme]
GO
/****** Object:  Table [dbo].[BiletTablosu]    Script Date: 15.01.2022 01:15:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BiletTablosu](
	[bilet_id] [int] IDENTITY(1,1) NOT NULL,
	[bilet_film] [varchar](500) NOT NULL,
	[bilet_koltuk] [varchar](10) NOT NULL,
	[bilet_tarih] [nchar](20) NOT NULL,
	[bilet_saat] [nchar](10) NOT NULL,
	[bilet_uyeId] [nchar](10) NULL,
 CONSTRAINT [PK_BiletTablosu] PRIMARY KEY CLUSTERED 
(
	[bilet_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FilmTablosu]    Script Date: 15.01.2022 01:15:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmTablosu](
	[film_id] [int] IDENTITY(1,1) NOT NULL,
	[film_ismi] [varchar](500) NOT NULL,
	[film_aciklama] [varchar](1000) NULL,
	[film_vizyon] [varchar](50) NOT NULL,
	[film_resim] [varchar](500) NULL,
 CONSTRAINT [PK_FilmTablosu] PRIMARY KEY CLUSTERED 
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullanicilarTablosu]    Script Date: 15.01.2022 01:15:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullanicilarTablosu](
	[kullanici_ad] [varchar](150) NOT NULL,
	[kullanici_sifre] [varchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeansKoltukTablosu]    Script Date: 15.01.2022 01:15:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeansKoltukTablosu](
	[seans_id] [int] NOT NULL,
	[koltuk_no] [varchar](10) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SeansKoltukTablosu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeansTablosu]    Script Date: 15.01.2022 01:15:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeansTablosu](
	[seans_id] [int] IDENTITY(1,1) NOT NULL,
	[seans_filmId] [int] NOT NULL,
	[seans_tarih] [nchar](10) NOT NULL,
	[seans_saat] [nchar](10) NOT NULL,
 CONSTRAINT [PK_SeansTablosu] PRIMARY KEY CLUSTERED 
(
	[seans_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UyelerTablosu]    Script Date: 15.01.2022 01:15:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UyelerTablosu](
	[uye_id] [int] IDENTITY(1,1) NOT NULL,
	[uye_isim] [varchar](250) NOT NULL,
	[uye_sifre] [nchar](250) NOT NULL,
 CONSTRAINT [PK_UyelerTablosu] PRIMARY KEY CLUSTERED 
(
	[uye_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BiletTablosu] ON 

INSERT [dbo].[BiletTablosu] ([bilet_id], [bilet_film], [bilet_koltuk], [bilet_tarih], [bilet_saat], [bilet_uyeId]) VALUES (1, N'DAYI', N'2', N'24/11/2025          ', N'16:45     ', N'1         ')
INSERT [dbo].[BiletTablosu] ([bilet_id], [bilet_film], [bilet_koltuk], [bilet_tarih], [bilet_saat], [bilet_uyeId]) VALUES (3, N'DAYI', N'2', N'24/11/2025          ', N'16:45     ', N'1         ')
INSERT [dbo].[BiletTablosu] ([bilet_id], [bilet_film], [bilet_koltuk], [bilet_tarih], [bilet_saat], [bilet_uyeId]) VALUES (4, N'DAYI', N'13', N'24/11/2025          ', N'22:05     ', N'1         ')
INSERT [dbo].[BiletTablosu] ([bilet_id], [bilet_film], [bilet_koltuk], [bilet_tarih], [bilet_saat], [bilet_uyeId]) VALUES (5, N'DAYI', N'11', N'24/11/2025          ', N'22:05     ', N'1         ')
SET IDENTITY_INSERT [dbo].[BiletTablosu] OFF
GO
SET IDENTITY_INSERT [dbo].[FilmTablosu] ON 

INSERT [dbo].[FilmTablosu] ([film_id], [film_ismi], [film_aciklama], [film_vizyon], [film_resim]) VALUES (2, N'Örümcek-Adam: Eve Dönüş Yok', N'Örümcek Adam`ın sinema tarihinde ilk kez, dost canlısı mahalle kahramanımız maskesizdir ve artık normal hayatıyla süper kahraman olmanın yüksek risklerini birbirinden ayıramıyordur. Doktor Strange`den yardım istediğinde, riskler daha da tehlikeli hale gelir ve onu Örümcek Adam olmanın gerçekte ne anlama geldiğini keşfetmeye zorlar.', N'1', N'spiderman.jpg')
INSERT [dbo].[FilmTablosu] ([film_id], [film_ismi], [film_aciklama], [film_vizyon], [film_resim]) VALUES (3, N'DAYI', N'Cesur ve adalet duygusu daha küçük yaştayken içine yerleşmiş olan ‘Dayı’nın ailesi onun köydeki haylazlıklarından bıkmıştır. Çareyi çalışması için onu İstanbul’a göndermekte bulurlar. Kahvehanecilik yapan köylüleri Seyfi’nin yanında çalışmaya başlamasıyla ''Dayı''nın hayatında yeni bir sayfa açıl', N'1', N'dayi.jpg')
INSERT [dbo].[FilmTablosu] ([film_id], [film_ismi], [film_aciklama], [film_vizyon], [film_resim]) VALUES (4, N'The Matrix Resurrections ', N'Vizyoner film yapımcısı Lana Wachowski’den, bir türü yeniden tanımlayan, çığır açan serinin uzun zamandır beklenen dördüncü filmi “The Matrix Resurrections” geliyor. Yeni film original serinin yıldızları Keanu Reeves ve Carrie-Anne Moss’u ikonik rolleri Neo ve Trinity olarak tekrar biraraya getiriyor.', N'1', N'matrix.jpg')
INSERT [dbo].[FilmTablosu] ([film_id], [film_ismi], [film_aciklama], [film_vizyon], [film_resim]) VALUES (5, N'Zeros and Ones ', N'Vatikan’ın bombalanmasından sonra bir Amerikan askeri, işgal altında olan Roma’da görevi başındadır. Kimsenin kim olduğunu bilmediği bir düşman, tüm dünyayı tehdit etmektedir. Asker, düşmanı ortaya çıkarmak ve ona karşı dünyayı korumak için zorlu bir mücadeleye girişir.', N'1', N'zeros.jpg')
INSERT [dbo].[FilmTablosu] ([film_id], [film_ismi], [film_aciklama], [film_vizyon], [film_resim]) VALUES (6, N'Dune', N'Dune, kendi ailesi ve halkının geleceğini garanti altına almak için evrendeki en tehlikeli gezegene seyahat etmek zorunda olan, kavrayışının ötesinde büyük bir kaderin içine doğmuş, parlak ve yetenekli genç Paul Atreides''in hikayesini anlatıyor. Kötücül güçler, gezegenin var olan en değerli kaynağı için -insanlığın en büyük potansiyelini ortaya çıkarabilecek bir maden- çatışmaya tutuşmuşken, yalnızca korkularını yenebilenler hayatta kalacaktır.', N'0', N'dune.jpg')
INSERT [dbo].[FilmTablosu] ([film_id], [film_ismi], [film_aciklama], [film_vizyon], [film_resim]) VALUES (7, N'Hawkeye', N'Dizi, Marvel Sinematik Evreni’nin sevilen kahramanlarından olan Hawkeye’a odaklanıyor. Hawkeye''ın dizide eğitmesine tanık olacağımız Kate Bishop karakteri, çizgi romanlarda zengin bir iş adamının kızı olarak tanınıyor. Kate, babası Derek''e hayran olan bir genç kızdır. Babasının dikkatini çekmek için her şeyi yapabilecek olan Kate''in annesi ise bir tatilde hayatını kaybeder. Kate, henüz küçük yaşlardayken, babasının o kadar da iyi biri olmadığına tanıklık eder. Bunun ardından artık ona saygı duymamaya ve onu yakından takip etmeye başlar. Kate Bishop, Ant-Man''in kızı ile birlikte Young Avengers isimli gruba katıldığında gerçek bir süper kahraman dönüşür. Kate, Civil War sırasında Captain America''nın yanında olan Clint Barton''ın ile birlikte savaşır.', N'0', N'hawkeye.jpg')
SET IDENTITY_INSERT [dbo].[FilmTablosu] OFF
GO
INSERT [dbo].[KullanicilarTablosu] ([kullanici_ad], [kullanici_sifre]) VALUES (N'admin@mail.com', N'1234')
GO
SET IDENTITY_INSERT [dbo].[SeansKoltukTablosu] ON 

INSERT [dbo].[SeansKoltukTablosu] ([seans_id], [koltuk_no], [id]) VALUES (0, N'5', 1)
INSERT [dbo].[SeansKoltukTablosu] ([seans_id], [koltuk_no], [id]) VALUES (0, N'2', 2)
INSERT [dbo].[SeansKoltukTablosu] ([seans_id], [koltuk_no], [id]) VALUES (1, N'13', 3)
INSERT [dbo].[SeansKoltukTablosu] ([seans_id], [koltuk_no], [id]) VALUES (1, N'11', 4)
SET IDENTITY_INSERT [dbo].[SeansKoltukTablosu] OFF
GO
SET IDENTITY_INSERT [dbo].[SeansTablosu] ON 

INSERT [dbo].[SeansTablosu] ([seans_id], [seans_filmId], [seans_tarih], [seans_saat]) VALUES (0, 6, N'31/12/2021', N'12:45     ')
INSERT [dbo].[SeansTablosu] ([seans_id], [seans_filmId], [seans_tarih], [seans_saat]) VALUES (1, 3, N'24/11/2025', N'22:05     ')
INSERT [dbo].[SeansTablosu] ([seans_id], [seans_filmId], [seans_tarih], [seans_saat]) VALUES (2, 3, N'31/12/2021', N'12:45     ')
INSERT [dbo].[SeansTablosu] ([seans_id], [seans_filmId], [seans_tarih], [seans_saat]) VALUES (3, 2, N'31/12/2021', N'12:45     ')
INSERT [dbo].[SeansTablosu] ([seans_id], [seans_filmId], [seans_tarih], [seans_saat]) VALUES (4, 7, N'31/12/2021', N'12:45     ')
SET IDENTITY_INSERT [dbo].[SeansTablosu] OFF
GO
SET IDENTITY_INSERT [dbo].[UyelerTablosu] ON 

INSERT [dbo].[UyelerTablosu] ([uye_id], [uye_isim], [uye_sifre]) VALUES (0, N'hunter', N'1234                                                                                                                                                                                                                                                      ')
INSERT [dbo].[UyelerTablosu] ([uye_id], [uye_isim], [uye_sifre]) VALUES (1, N'bohannon', N'1234                                                                                                                                                                                                                                                      ')
INSERT [dbo].[UyelerTablosu] ([uye_id], [uye_isim], [uye_sifre]) VALUES (2, N'naruto', N'1234                                                                                                                                                                                                                                                      ')
SET IDENTITY_INSERT [dbo].[UyelerTablosu] OFF
GO
