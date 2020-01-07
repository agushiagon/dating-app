BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Photos" (
	"Id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Url"	TEXT,
	"Description"	TEXT,
	"DateAdded"	TEXT NOT NULL,
	"IsMain"	INTEGER NOT NULL,
	"PublicId"	TEXT,
	"UserId"	INTEGER NOT NULL,
	"IsApproved"	INTEGER NOT NULL DEFAULT 0,
	CONSTRAINT "FK_Photos_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Messages" (
	"Id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"SenderId"	INTEGER NOT NULL,
	"RecipientId"	INTEGER NOT NULL,
	"Content"	TEXT,
	"IsRead"	INTEGER NOT NULL,
	"DateRead"	TEXT,
	"MessageSent"	TEXT NOT NULL,
	"SenderDeleted"	INTEGER NOT NULL,
	"RecipientDeleted"	INTEGER NOT NULL,
	CONSTRAINT "FK_Messages_AspNetUsers_SenderId" FOREIGN KEY("SenderId") REFERENCES "AspNetUsers"("Id") ON DELETE RESTRICT,
	CONSTRAINT "FK_Messages_AspNetUsers_RecipientId" FOREIGN KEY("RecipientId") REFERENCES "AspNetUsers"("Id") ON DELETE RESTRICT
);
CREATE TABLE IF NOT EXISTS "Likes" (
	"LikerId"	INTEGER NOT NULL,
	"LikeeId"	INTEGER NOT NULL,
	CONSTRAINT "FK_Likes_AspNetUsers_LikerId" FOREIGN KEY("LikerId") REFERENCES "AspNetUsers"("Id") ON DELETE RESTRICT,
	CONSTRAINT "PK_Likes" PRIMARY KEY("LikerId","LikeeId"),
	CONSTRAINT "FK_Likes_AspNetUsers_LikeeId" FOREIGN KEY("LikeeId") REFERENCES "AspNetUsers"("Id") ON DELETE RESTRICT
);
CREATE TABLE IF NOT EXISTS "AspNetUserTokens" (
	"UserId"	INTEGER NOT NULL,
	"LoginProvider"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Value"	TEXT,
	CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY("UserId","LoginProvider","Name")
);
CREATE TABLE IF NOT EXISTS "AspNetUserRoles" (
	"UserId"	INTEGER NOT NULL,
	"RoleId"	INTEGER NOT NULL,
	CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY("UserId","RoleId"),
	CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "AspNetUserLogins" (
	"LoginProvider"	TEXT NOT NULL,
	"ProviderKey"	TEXT NOT NULL,
	"ProviderDisplayName"	TEXT,
	"UserId"	INTEGER NOT NULL,
	CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE,
	CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY("LoginProvider","ProviderKey")
);
CREATE TABLE IF NOT EXISTS "AspNetUserClaims" (
	"Id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"UserId"	INTEGER NOT NULL,
	"ClaimType"	TEXT,
	"ClaimValue"	TEXT,
	CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "AspNetRoleClaims" (
	"Id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"RoleId"	INTEGER NOT NULL,
	"ClaimType"	TEXT,
	"ClaimValue"	TEXT,
	CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Values" (
	"Id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name"	TEXT
);
CREATE TABLE IF NOT EXISTS "AspNetUsers" (
	"Id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"UserName"	TEXT,
	"NormalizedUserName"	TEXT,
	"Email"	TEXT,
	"NormalizedEmail"	TEXT,
	"EmailConfirmed"	INTEGER NOT NULL,
	"PasswordHash"	TEXT,
	"SecurityStamp"	TEXT,
	"ConcurrencyStamp"	TEXT,
	"PhoneNumber"	TEXT,
	"PhoneNumberConfirmed"	INTEGER NOT NULL,
	"TwoFactorEnabled"	INTEGER NOT NULL,
	"LockoutEnd"	TEXT,
	"LockoutEnabled"	INTEGER NOT NULL,
	"AccessFailedCount"	INTEGER NOT NULL,
	"Gender"	TEXT,
	"DateOfBirth"	TEXT NOT NULL,
	"KnownAs"	TEXT,
	"Created"	TEXT NOT NULL,
	"LastActive"	TEXT NOT NULL,
	"Introduction"	TEXT,
	"LookingFor"	TEXT,
	"Interests"	TEXT,
	"City"	TEXT,
	"Country"	TEXT
);
CREATE TABLE IF NOT EXISTS "AspNetRoles" (
	"Id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	"Name"	TEXT,
	"NormalizedName"	TEXT,
	"ConcurrencyStamp"	TEXT
);
INSERT INTO "Photos" VALUES (1,'https://randomuser.me/api/portraits/women/38.jpg','Fugiat Lorem qui aute duis nostrud sunt exercitation excepteur officia reprehenderit dolore.','0001-01-01 00:00:00',1,NULL,1,1);
INSERT INTO "Photos" VALUES (2,'https://randomuser.me/api/portraits/women/81.jpg','Dolore cillum voluptate do pariatur aliqua esse.','0001-01-01 00:00:00',1,NULL,2,1);
INSERT INTO "Photos" VALUES (3,'https://randomuser.me/api/portraits/women/34.jpg','Nostrud ex incididunt mollit et dolore reprehenderit qui consectetur pariatur sunt elit eiusmod consequat sint.','0001-01-01 00:00:00',1,NULL,3,1);
INSERT INTO "Photos" VALUES (4,'https://randomuser.me/api/portraits/women/2.jpg','Dolore ut commodo enim proident labore culpa ut nisi.','0001-01-01 00:00:00',1,NULL,4,1);
INSERT INTO "Photos" VALUES (5,'https://randomuser.me/api/portraits/women/32.jpg','Irure voluptate tempor irure qui minim dolore elit in aute minim duis.','0001-01-01 00:00:00',1,NULL,5,1);
INSERT INTO "Photos" VALUES (6,'https://randomuser.me/api/portraits/men/54.jpg','Excepteur sunt laboris ad qui.','0001-01-01 00:00:00',1,NULL,6,1);
INSERT INTO "Photos" VALUES (7,'https://randomuser.me/api/portraits/men/32.jpg','Aliqua duis labore adipisicing mollit duis.','0001-01-01 00:00:00',1,NULL,7,1);
INSERT INTO "Photos" VALUES (8,'https://randomuser.me/api/portraits/men/47.jpg','Magna dolor consectetur eu fugiat id labore ullamco ad nisi laborum ut tempor ea fugiat.','0001-01-01 00:00:00',1,NULL,8,1);
INSERT INTO "Photos" VALUES (9,'https://randomuser.me/api/portraits/men/5.jpg','Do esse et aute irure.','0001-01-01 00:00:00',1,NULL,9,1);
INSERT INTO "Photos" VALUES (10,'https://randomuser.me/api/portraits/men/54.jpg','Reprehenderit aliquip consequat magna anim nisi duis veniam officia deserunt minim tempor duis ea pariatur.','0001-01-01 00:00:00',1,NULL,10,1);
INSERT INTO "Photos" VALUES (11,'http://res.cloudinary.com/dtqguq26o/image/upload/v1569435917/t37kmhr6cbcgpxtxgfjx.jpg',NULL,'2019-09-25 20:25:15.197616',1,'t37kmhr6cbcgpxtxgfjx',13,1);
INSERT INTO "Photos" VALUES (12,'http://res.cloudinary.com/dtqguq26o/image/upload/v1569435943/mweivrwgaie6vbvubcmg.jpg',NULL,'2019-09-25 20:25:42.741211',0,'mweivrwgaie6vbvubcmg',13,1);
INSERT INTO "Messages" VALUES (1,11,3,'hej qkemi ',1,'2019-09-25 21:02:01.228438','2019-09-25 21:00:35.554314',0,0);
INSERT INTO "Messages" VALUES (2,3,13,'Gongii',0,NULL,'2019-09-25 21:02:40.876892',0,0);
INSERT INTO "Likes" VALUES (11,13);
INSERT INTO "Likes" VALUES (3,13);
INSERT INTO "AspNetUserRoles" VALUES (1,1);
INSERT INTO "AspNetUserRoles" VALUES (2,1);
INSERT INTO "AspNetUserRoles" VALUES (3,1);
INSERT INTO "AspNetUserRoles" VALUES (4,1);
INSERT INTO "AspNetUserRoles" VALUES (5,1);
INSERT INTO "AspNetUserRoles" VALUES (6,1);
INSERT INTO "AspNetUserRoles" VALUES (7,1);
INSERT INTO "AspNetUserRoles" VALUES (8,1);
INSERT INTO "AspNetUserRoles" VALUES (9,1);
INSERT INTO "AspNetUserRoles" VALUES (10,1);
INSERT INTO "AspNetUserRoles" VALUES (11,2);
INSERT INTO "AspNetUserRoles" VALUES (11,3);
INSERT INTO "AspNetUserRoles" VALUES (12,1);
INSERT INTO "AspNetUserRoles" VALUES (13,2);
INSERT INTO "AspNetUserRoles" VALUES (13,3);
INSERT INTO "AspNetUserRoles" VALUES (13,1);
INSERT INTO "AspNetUserRoles" VALUES (13,4);
INSERT INTO "AspNetUsers" VALUES (1,'Liza','LIZA',NULL,NULL,0,'AQAAAAEAACcQAAAAEEdXjJnJUnA9l6pjH3egc3VBTAnDvsVKeFVGGi3nsEUlRm6Q4Ai7BXuVP5jNEgGnoQ==','RL5MF6QEIVWUKBFOTKJAOWD4NRVC37KO','ac2f25e1-37f3-4c32-891a-ef7fbf63e4dd',NULL,0,0,NULL,1,0,'female','1990-08-26 00:00:00','Liza','2017-02-14 00:00:00','0001-01-01 00:00:00','Officia tempor minim officia amet pariatur id elit pariatur magna aute exercitation exercitation aliquip laboris. Incididunt nostrud pariatur quis amet commodo consectetur exercitation consequat ex do nulla dolor adipisicing aute. Incididunt proident et cupidatat amet nostrud ad. Ut tempor amet ad cupidatat voluptate.
','Commodo minim veniam dolore excepteur consectetur consectetur proident tempor ut excepteur sit mollit exercitation eu. Esse nulla culpa mollit ullamco ut elit est. In nisi reprehenderit nostrud ex dolore laboris labore excepteur amet dolor aliqua id eiusmod quis. Veniam labore dolore ipsum eiusmod nostrud ullamco. Reprehenderit in aute Lorem eiusmod.
','Consectetur labore labore velit dolore duis.','Columbus','Swaziland');
INSERT INTO "AspNetUsers" VALUES (2,'Verna','VERNA',NULL,NULL,0,'AQAAAAEAACcQAAAAEISXLtCYDqQyPobbh/pHtOt/iOSC7UJYiLsuJgL6FzAtPuJl29au3CUdlXnqutB20g==','AFRXQIZFBPOQ473K6ZJZQXIBOJAUAPSW','7a2454a9-8bc8-420d-9524-141c58aae2d3',NULL,0,0,NULL,1,0,'female','1958-10-28 00:00:00','Verna','2017-05-27 00:00:00','0001-01-01 00:00:00','Nulla occaecat est cupidatat veniam dolore tempor nisi et sunt esse dolor aliqua officia. Ipsum proident consectetur ullamco magna sint adipisicing quis aute voluptate non dolor Lorem. Occaecat minim quis nostrud laborum irure.
','Et non excepteur sit deserunt adipisicing ullamco. Reprehenderit magna consectetur cillum nostrud consectetur ullamco reprehenderit labore cillum magna nisi et dolor. Aute ad sit amet laborum duis minim commodo nisi enim aliquip quis pariatur et. Laborum aliquip cupidatat aute labore culpa esse enim eu velit ut. Minim ullamco elit pariatur velit excepteur sunt. Deserunt nisi id sunt nisi reprehenderit excepteur reprehenderit aute amet esse labore tempor. Et cillum irure exercitation occaecat anim exercitation ut aliquip enim in ullamco.
','Anim cillum duis et nostrud.','Byrnedale','Syria');
INSERT INTO "AspNetUsers" VALUES (3,'Irma','IRMA',NULL,NULL,0,'AQAAAAEAACcQAAAAEJknXC65orNoeFD2AhO3ffKnE9mDv6HQCXlLbeuQLKT3hUieSEEp8tyxHDd0v6Nqig==','GTOTMMB64RKICOEMP6O7UAULYSTRAYAG','9e566060-3f5a-41f7-9005-1cc8f2e38d99',NULL,0,0,NULL,1,0,'female','1958-01-01 00:00:00','Irma','2017-08-13 00:00:00','2019-09-25 21:02:52.741225','Qui voluptate elit exercitation voluptate. Commodo elit reprehenderit sint deserunt. Enim qui mollit veniam magna voluptate Lorem. Dolore amet irure ex velit labore laborum consectetur. Amet tempor cupidatat sint irure nulla proident est sit ipsum reprehenderit.
','Sunt consectetur in do qui. Consectetur pariatur eiusmod sit ex ea do. Magna cupidatat do aute elit incididunt ut. Aute esse nulla velit irure eu sit aliquip. Incididunt ad laborum est excepteur ipsum.
','Veniam eiusmod pariatur nostrud labore deserunt dolore quis sit duis.','Gerber','Angola');
INSERT INTO "AspNetUsers" VALUES (4,'Alyssa','ALYSSA',NULL,NULL,0,'AQAAAAEAACcQAAAAEIjhR8LsOa9GfrYBahuBfGhl8FQ+qcBAmjlheAeE6ipiyroXuzVdy0QtQgsvAFJJjA==','HXC4UXVVGTCTYY45R37TPV6OCZWEUQUR','8d957255-c2ee-4750-aa46-d294b8a13dea',NULL,0,0,NULL,1,0,'female','1969-07-05 00:00:00','Alyssa','2017-06-26 00:00:00','0001-01-01 00:00:00','Ex reprehenderit deserunt aute incididunt aliqua ipsum nisi. Laboris sit reprehenderit anim pariatur exercitation esse. Consequat ullamco ex pariatur amet amet proident.
','Quis magna velit officia magna. Ipsum anim voluptate sint est deserunt magna amet anim magna aliquip reprehenderit sit cillum nulla. Incididunt sint deserunt velit velit aute culpa dolor et amet aliquip. Veniam velit pariatur irure qui. Quis exercitation esse officia nostrud veniam sint. Do eiusmod anim quis aliqua ad cillum laboris voluptate ex in id nostrud et sit. Fugiat velit dolor do velit veniam.
','Exercitation ullamco eiusmod officia minim non et mollit occaecat.','Calvary','Ethiopia');
INSERT INTO "AspNetUsers" VALUES (5,'Kayla','KAYLA',NULL,NULL,0,'AQAAAAEAACcQAAAAED3aMsSoIBraflA67gr15w3UZ5wv7gQFg7uyuJEWG9gj6CammpHQAXzGpHg8liEJtg==','DNBDWC5FPPCLMWBTEQS6YYWD4HSO4R44','b566f0a2-c130-475c-bc88-748fa70a9311',NULL,0,0,NULL,1,0,'female','1993-08-23 00:00:00','Kayla','2017-05-28 00:00:00','0001-01-01 00:00:00','Ut amet nostrud reprehenderit incididunt in aliqua amet nulla in voluptate reprehenderit. Esse do aliqua ex est occaecat magna pariatur tempor. Elit qui veniam proident proident. Sit dolore pariatur dolor voluptate duis dolor ex ex mollit excepteur esse aliqua irure do. In laboris ullamco deserunt consectetur elit do exercitation ipsum quis ut dolor ea aliquip cillum. Velit dolore exercitation culpa veniam exercitation exercitation elit est eu. Laboris cupidatat velit cupidatat non quis minim sit magna ullamco ut aliquip minim.
','Et eiusmod aute pariatur duis amet consequat commodo. Consequat et nulla id officia nostrud ullamco ad aute. Culpa reprehenderit mollit velit nisi in dolor duis culpa dolor velit anim. Elit aliquip nisi eiusmod quis ut minim ipsum non occaecat reprehenderit consequat Lorem laborum.
','Et quis minim cupidatat deserunt.','Springville','Palau');
INSERT INTO "AspNetUsers" VALUES (6,'King','KING',NULL,NULL,0,'AQAAAAEAACcQAAAAEGfvJITZgk29sbYT3r3pzHQ8jOvLPDRfn5sS57Z7p1Plv65/BszOssTvyvCgRoLtHw==','75CPWQTKM4XZL5NTE2OZTPZ3S4VTD2GS','cb0988b2-6e87-4125-bb5e-ef678b3b49ef',NULL,0,0,NULL,1,0,'male','1951-10-23 00:00:00','King','2017-04-01 00:00:00','0001-01-01 00:00:00','Adipisicing velit anim in adipisicing Lorem. Cillum eiusmod voluptate consequat deserunt duis. Tempor irure anim aute consequat qui sint est sint ipsum quis non. Proident mollit ad labore proident sint cillum amet qui anim. Mollit eiusmod cupidatat elit cillum anim duis enim. Voluptate duis id ad aliqua esse anim cupidatat laboris anim nisi exercitation ut ex sit. Labore cillum magna aliquip nisi commodo enim.
','Lorem ipsum non voluptate non commodo ut deserunt Lorem. Consequat nostrud officia reprehenderit aute duis tempor adipisicing quis adipisicing tempor esse elit. Sunt ex in sint aute. Sunt id culpa ipsum magna nulla fugiat dolore officia est anim mollit. Deserunt labore et eu dolor. Sit magna consectetur magna mollit Lorem veniam consectetur laboris proident quis.
','Dolore nisi quis incididunt dolore pariatur dolore.','Harold','Russian Federation');
INSERT INTO "AspNetUsers" VALUES (7,'Cabrera','CABRERA',NULL,NULL,0,'AQAAAAEAACcQAAAAEBLx2WxvfblwwsBJ9KdbIA8TF0ZxJmUwtS6KIc4+6WIhyDcZqyjx2xgmBg5Wsj0CMA==','YKQCJ4MZMNJF5MALOLGJ3V4LTIGOIBEF','4ea927e8-93f3-4018-9f0a-f7ba7a2f7d70',NULL,0,0,NULL,1,0,'male','1972-10-11 00:00:00','Cabrera','2017-03-09 00:00:00','0001-01-01 00:00:00','Ut ipsum laborum aliqua ad magna magna fugiat enim sunt. Sit adipisicing minim nulla minim. Occaecat tempor voluptate ullamco ullamco ex sint laboris Lorem ut tempor id eu cillum. Elit exercitation laborum excepteur adipisicing deserunt reprehenderit in ipsum est esse nisi occaecat. Laboris irure enim in et cupidatat ipsum ea amet. Occaecat nisi eu reprehenderit ad fugiat non. Deserunt quis exercitation dolore dolore aliquip pariatur consequat excepteur.
','Consectetur ut commodo et laborum duis deserunt eiusmod consequat aute laborum mollit est. Esse excepteur nulla dolor commodo cillum fugiat cupidatat dolor ullamco veniam magna aliqua consectetur. Sit elit dolor officia id proident labore sint culpa enim. Officia non anim cupidatat non proident deserunt anim esse. Elit qui veniam qui ut amet ut eiusmod elit.
','Sit excepteur aliquip est commodo anim exercitation occaecat amet magna minim labore anim ipsum.','Torboy','Panama');
INSERT INTO "AspNetUsers" VALUES (8,'Shaffer','SHAFFER',NULL,NULL,0,'AQAAAAEAACcQAAAAEFT06Xbsjt5V5RoMwYK16v2P/Fj726RuB8JRtZHZHQDK4C19SzdO96D3GdBWzqzOIg==','AKPCFG5DJ4LTZARJKMJSOHUPRKR5A6G4','1bb05853-2e52-4b6a-b643-6d42b4a63de2',NULL,0,0,NULL,1,0,'male','1975-09-24 00:00:00','Shaffer','2017-05-11 00:00:00','0001-01-01 00:00:00','Eiusmod pariatur fugiat amet exercitation est consectetur et aliqua nisi enim ipsum. Duis ut proident anim incididunt dolore. Cillum commodo mollit eu incididunt. Culpa enim culpa officia laborum ut elit ea non nisi deserunt mollit Lorem incididunt proident. Id exercitation commodo do nulla occaecat ad occaecat esse ut laborum.
','Excepteur aute exercitation anim ex enim do cupidatat aliquip aliqua enim. Deserunt non laboris deserunt est do dolore dolor. Non deserunt occaecat culpa duis excepteur ipsum sunt consectetur incididunt dolor sunt. Deserunt ad in aliquip velit ea ullamco labore.
','Qui deserunt nisi occaecat proident excepteur quis aliqua.','Camptown','India');
INSERT INTO "AspNetUsers" VALUES (9,'Joseph','JOSEPH',NULL,NULL,0,'AQAAAAEAACcQAAAAEFTxgv/o4m4HBITXGE7FcNTyki/cMHV0+bspUeEvA7amrM2XjAsAzmrK2MnLJ7UbaQ==','6L3ARLGOJ7FUHSVRCO2VK2D5CBQIPH5D','9363dd8c-8a3e-434e-9253-e3871a582d23',NULL,0,0,NULL,1,0,'male','1962-11-17 00:00:00','Joseph','2017-08-10 00:00:00','0001-01-01 00:00:00','Sunt minim adipisicing dolor veniam Lorem. Mollit pariatur cillum deserunt officia sint. Eu velit ea ex velit quis elit commodo commodo elit aliqua. Sit eiusmod incididunt non amet mollit nulla proident esse minim qui in esse. Eiusmod laborum dolor incididunt minim laboris ut reprehenderit eu ut nulla id anim tempor velit. Non magna eiusmod consectetur aliquip Lorem irure aliqua elit consequat quis. Culpa est eu cillum consequat adipisicing.
','Elit sint laboris qui dolor officia nisi fugiat minim labore enim mollit quis. Nostrud exercitation sint fugiat dolore eu incididunt non aliqua commodo et. Mollit velit eu id sunt minim non laboris occaecat et sint adipisicing veniam. Sit tempor reprehenderit non ut elit. Cillum amet eu eu fugiat. Pariatur aute nisi do nisi ut ea culpa eiusmod deserunt ad laboris ut aliquip deserunt. Quis irure fugiat tempor velit magna.
','Velit anim excepteur id duis ut adipisicing laborum commodo cillum aliqua culpa fugiat.','Efland','Paraguay');
INSERT INTO "AspNetUsers" VALUES (10,'Kramer','KRAMER',NULL,NULL,0,'AQAAAAEAACcQAAAAEBd3dmkFhOy9ni9h/vuu2PIAc2bcOmGssOM8h1FAOglMXsqnEslBIiVN2Z2SASK8ew==','7P2HIXZIBW5TVS3QTZVHEL3IKQE4LZ2Z','05480471-2251-4d50-b70b-88b393689634',NULL,0,0,NULL,1,0,'male','1983-02-10 00:00:00','Kramer','2017-01-09 00:00:00','0001-01-01 00:00:00','Cillum tempor exercitation ea nisi. Excepteur consequat eu in sunt dolore culpa sunt cillum. Mollit labore est voluptate ad ullamco in deserunt. Labore sunt laboris irure quis cupidatat sunt. Minim elit aute veniam quis fugiat. Enim occaecat labore voluptate exercitation amet laborum anim laborum in minim minim do.
','Aliquip occaecat exercitation ut qui. Ullamco irure nostrud aute ad exercitation nisi cupidatat duis officia consequat culpa. Sunt incididunt irure ut eu tempor qui Lorem laboris eu id tempor cillum aute consectetur.
','Ex amet aute ea consectetur dolor aute irure mollit enim dolore dolore nisi ipsum veniam.','Bagtown','Yugoslavia');
INSERT INTO "AspNetUsers" VALUES (11,'Admin','ADMIN',NULL,NULL,0,'AQAAAAEAACcQAAAAEJ15PbTgNfXwZDQmBTPML1QVQoASXFvPZ8uMMh44QpuiauyYEbISB00NgYTNDuzX4w==','UAGUKMZTTK744II5OZ4IZEH2AYY3FZC4','bc9645d7-8813-43d2-8f05-f265a2d431e0',NULL,0,0,NULL,1,0,NULL,'0001-01-01 00:00:00',NULL,'0001-01-01 00:00:00','2019-09-25 21:00:35.844312',NULL,NULL,NULL,NULL,NULL);
INSERT INTO "AspNetUsers" VALUES (12,'asdsadasd','ASDSADASD',NULL,NULL,0,'AQAAAAEAACcQAAAAEDSqIOFTIlv/GfcBYOLx/nvhJVoHmM7IYdPPmxByZR2N40uGRCp4aMMTaOte04PsXw==','HQ3W7BFYJ6TCFDKFGJ3PSE6PF56HJP27','1fd4bf70-d7cd-4968-8f1f-35d676c73ae3',NULL,0,0,NULL,1,0,'male','2009-12-11 23:00:00','qweqwe','2019-09-25 20:01:07.412789','2019-09-25 20:01:21.783711',NULL,NULL,NULL,'prishtina','kosovo');
INSERT INTO "AspNetUsers" VALUES (13,'Agon','AGON',NULL,NULL,0,'AQAAAAEAACcQAAAAECiyFfEEIQAHchQuJgMtCLnqdBoaJRKwL1tNRydpqfuiiXLoh4qUZ1d8wTRQZ6zXUQ==','TBQEXPDPNYTTMCRUZSSLARX4S765LOP4','f5268ce3-7a7f-4b2c-b942-18c0b7435c38',NULL,0,0,NULL,1,0,'male','1996-05-06 22:00:00','Goni','2019-09-25 20:23:02.399331','2019-09-25 20:23:30.325813','Agon','Nothing','Kickbox','Prishtine','Kosov');
INSERT INTO "AspNetRoles" VALUES (1,'Member','MEMBER','21560f5d-7f60-406e-a5cb-aaf836cde522');
INSERT INTO "AspNetRoles" VALUES (2,'Admin','ADMIN','d4ab76c0-ab99-4ccf-ae6c-a6e9d375af97');
INSERT INTO "AspNetRoles" VALUES (3,'Moderator','MODERATOR','74393def-925e-4ca0-a391-244969faf5d5');
INSERT INTO "AspNetRoles" VALUES (4,'VIP','VIP','2eed06c1-600e-4c8a-801b-2af7f18ed0ca');
CREATE INDEX IF NOT EXISTS "IX_Photos_UserId" ON "Photos" (
	"UserId"
);
CREATE INDEX IF NOT EXISTS "IX_Messages_SenderId" ON "Messages" (
	"SenderId"
);
CREATE INDEX IF NOT EXISTS "IX_Messages_RecipientId" ON "Messages" (
	"RecipientId"
);
CREATE INDEX IF NOT EXISTS "IX_Likes_LikeeId" ON "Likes" (
	"LikeeId"
);
CREATE UNIQUE INDEX IF NOT EXISTS "UserNameIndex" ON "AspNetUsers" (
	"NormalizedUserName"
);
CREATE INDEX IF NOT EXISTS "EmailIndex" ON "AspNetUsers" (
	"NormalizedEmail"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserRoles_RoleId" ON "AspNetUserRoles" (
	"RoleId"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserLogins_UserId" ON "AspNetUserLogins" (
	"UserId"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserClaims_UserId" ON "AspNetUserClaims" (
	"UserId"
);
CREATE UNIQUE INDEX IF NOT EXISTS "RoleNameIndex" ON "AspNetRoles" (
	"NormalizedName"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetRoleClaims_RoleId" ON "AspNetRoleClaims" (
	"RoleId"
);
COMMIT;
