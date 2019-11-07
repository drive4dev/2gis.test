-- ----------------------------
-- Sequence structure for building_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."building_id_seq";
CREATE SEQUENCE "public"."building_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2147483647
  START 1
  CACHE 1;

-- ----------------------------
-- Sequence structure for category_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."category_id_seq";
CREATE SEQUENCE "public"."category_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2147483647
  START 1
  CACHE 1;

-- ----------------------------
-- Sequence structure for company_category_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."company_category_id_seq";
CREATE SEQUENCE "public"."company_category_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2147483647
  START 1
  CACHE 1;

-- ----------------------------
-- Sequence structure for company_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."company_id_seq";
CREATE SEQUENCE "public"."company_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 2147483647
  START 1
  CACHE 1;

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS "public"."building";
CREATE TABLE "public"."building"
(
  "id"        int4 NOT NULL DEFAULT nextval('building_id_seq'::regclass),
  "address"   varchar(255) COLLATE "pg_catalog"."default",
  "latitude"  numeric(7, 5),
  "longitude" numeric(8, 5)
);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS "public"."category";
CREATE TABLE "public"."category"
(
  "id"    int4                                        NOT NULL DEFAULT nextval('category_id_seq'::regclass),
  "name"  varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "lft"   int4                                        NOT NULL,
  "rgt"   int4                                        NOT NULL,
  "level" int4                                        NOT NULL
);

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS "public"."company";
CREATE TABLE "public"."company"
(
  "id"          int4                                        NOT NULL DEFAULT nextval('company_id_seq'::regclass),
  "name"        varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "phones"      varchar(255) COLLATE "pg_catalog"."default",
  "building_id" int4                                        NOT NULL
);

-- ----------------------------
-- Table structure for company_category
-- ----------------------------
DROP TABLE IF EXISTS "public"."company_category";
CREATE TABLE "public"."company_category"
(
  "id"          int4 NOT NULL DEFAULT nextval('company_category_id_seq'::regclass),
  "company_id"  int4 NOT NULL,
  "category_id" int4 NOT NULL
);


-- ----------------------------
-- Indexes structure for table building
-- ----------------------------
CREATE INDEX "building_lat_lon_idx" ON "public"."building" USING btree (
                                                                        "latitude" "pg_catalog"."numeric_ops" ASC NULLS
                                                                        LAST,
                                                                        "longitude" "pg_catalog"."numeric_ops" ASC NULLS
                                                                        LAST
  );

-- ----------------------------
-- Primary Key structure for table building
-- ----------------------------
ALTER TABLE "public"."building"
  ADD CONSTRAINT "building_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table category
-- ----------------------------
CREATE INDEX "category_lft_idx" ON "public"."category" USING btree (
                                                                    "lft" "pg_catalog"."int4_ops" ASC NULLS LAST,
                                                                    "rgt" "pg_catalog"."int4_ops" ASC NULLS LAST,
                                                                    "level" "pg_catalog"."int4_ops" ASC NULLS LAST
  );

-- ----------------------------
-- Primary Key structure for table category
-- ----------------------------
ALTER TABLE "public"."category"
  ADD CONSTRAINT "category_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table company
-- ----------------------------
ALTER TABLE "public"."company"
  ADD CONSTRAINT "company_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table company_category
-- ----------------------------
ALTER TABLE "public"."company_category"
  ADD CONSTRAINT "company_category_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table company
-- ----------------------------
ALTER TABLE "public"."company"
  ADD CONSTRAINT "company_building_id_fkey" FOREIGN KEY ("building_id") REFERENCES "public"."building" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table company_category
-- ----------------------------
ALTER TABLE "public"."company_category"
  ADD CONSTRAINT "company_category_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."category" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."company_category"
  ADD CONSTRAINT "company_category_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "public"."company" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO "building" (address, latitude, longitude) VALUES ('Ap #925-4862 Mauris Avenue', '-16.49255', '-152.4351'), ('4092 Sollicitudin Av.', '-59.64924', '60.22052'), ('Ap #350-8020 Bibendum St.', '-42.26046', '7.0314'), ('903-1549 Metus St.', '78.39049', '-96.80664'), ('6224 Torquent Av.', '-62.08766', '73.24616'), ('Ap #453-6506 Dui. Rd.', '89.00278', '141.06081'), ('7556 Nascetur Rd.', '-60.55844', '-52.51781'), ('421-975 Magna. Av.', '27.02107', '7.76664'), ('P.O. Box 356, 978 Nec Avenue', '-31.96404', '-88.87116'), ('950-315 Commodo Avenue', '61.72821', '-168.14322');
INSERT INTO "building" (address, latitude, longitude) VALUES ('Ap #752-5528 At St.', '50.78261', '-74.16874'), ('Ap #799-6672 Tincidunt Street', '-60.05661', '-4.41432'), ('560-980 In Avenue', '62.53665', '130.55395'), ('Ap #449-5851 Neque Av.', '38.7258', '104.94605'), ('2269 Tellus Av.', '49.46933', '-160.07402'), ('Ap #892-6112 Mauris Av.', '-82.3006', '-5.94803'), ('373 Nunc Av.', '40.14665', '-179.06474'), ('674-9243 Cubilia Rd.', '-30.6657', '59.65321'), ('P.O. Box 498, 3998 Risus Av.', '-17.61861', '14.20178'), ('2384 Pellentesque Rd.', '-62.589', '-107.25915');
INSERT INTO "building" (address, latitude, longitude) VALUES ('919-212 A, Av.', '-11.43732', '-30.86385'), ('P.O. Box 345, 7922 Quisque St.', '57.29847', '-151.68854'), ('101-4211 Mollis. Av.', '51.92213', '-19.59127'), ('P.O. Box 663, 997 Primis Ave', '-22.88173', '171.76585'), ('2522 Orci. St.', '-81.65994', '-34.18127'), ('Ap #876-4696 Vestibulum, St.', '15.04035', '-106.00613'), ('8264 Elit Rd.', '60.75625', '51.03618'), ('700-9417 Sit Avenue', '47.97372', '103.41256'), ('286-3181 Proin Ave', '50.89451', '-130.06128'), ('597-3573 Dui, Street', '15.71651', '-171.53905');
INSERT INTO "building" (address, latitude, longitude) VALUES ('Ap #889-5242 Pede. Ave', '-68.81777', '-14.57562'), ('P.O. Box 782, 3450 Scelerisque Rd.', '80.317', '-71.25472'), ('6608 Augue Ave', '19.54299', '-160.53128'), ('P.O. Box 596, 1294 Ut St.', '-1.68532', '76.15215'), ('320-2359 Donec Ave', '48.67836', '-165.36299'), ('P.O. Box 440, 5220 Euismod St.', '-38.35171', '39.20614'), ('P.O. Box 948, 8975 Placerat, Rd.', '2.52262', '-96.79521'), ('P.O. Box 555, 766 Vitae Road', '88.01959', '-64.63314'), ('P.O. Box 656, 7241 Nisl. Street', '73.84302', '42.4767'), ('P.O. Box 464, 7889 Nam St.', '28.95021', '146.29885');
INSERT INTO "building" (address, latitude, longitude) VALUES ('P.O. Box 112, 9772 Metus Rd.', '-46.72287', '-120.74914'), ('P.O. Box 979, 9461 Nunc Rd.', '-71.53468', '54.71893'), ('674-9755 Morbi Av.', '-89.94336', '153.865'), ('9112 Nisl. Street', '14.74123', '-125.66773'), ('Ap #496-9868 Sed Road', '-37.58559', '172.5256'), ('454-5225 Tempus Street', '7.223', '-92.16421'), ('Ap #284-8640 Ut St.', '-19.60034', '-39.40646'), ('P.O. Box 175, 1529 Urna Avenue', '-13.50975', '69.16679'), ('Ap #759-5938 Tellus St.', '58.3227', '-87.05403'), ('3441 Et Rd.', '-80.12569', '-175.76517');
INSERT INTO "building" (address, latitude, longitude) VALUES ('Ap #691-678 Quisque Street', '35.41072', '173.10468'), ('4983 Ac Rd.', '-23.28401', '-80.90255'), ('Ap #746-1492 Sit Rd.', '-23.56432', '-123.26162'), ('311-8818 Vel Ave', '6.99628', '-148.69556'), ('Ap #387-1826 A Street', '29.71031', '-173.73432'), ('Ap #499-1353 Amet, Rd.', '64.86226', '-45.95407'), ('P.O. Box 877, 6558 Auctor, St.', '-88.66611', '124.17567'), ('2613 Cubilia Road', '15.05699', '167.36007'), ('553-2570 Ut Rd.', '-6.74759', '149.50149'), ('Ap #584-6730 Placerat Rd.', '-4.085', '54.91419');
INSERT INTO "building" (address, latitude, longitude) VALUES ('796-5036 Enim Av.', '49.41283', '103.8675'), ('Ap #369-5614 Et, Rd.', '-51.94006', '100.61896'), ('Ap #436-1454 Urna Rd.', '-51.39407', '-129.38576'), ('769-9906 Dictum St.', '-61.36618', '-39.05434'), ('Ap #829-5442 Bibendum. Avenue', '12.30295', '128.68609'), ('6553 Pede. Rd.', '27.32527', '-28.28684'), ('398 In Avenue', '-33.88817', '68.24929'), ('P.O. Box 422, 3050 Egestas. Rd.', '18.14471', '-139.50127'), ('6933 Dapibus Avenue', '-42.80657', '51.90034'), ('P.O. Box 828, 2048 Pede, Rd.', '76.10311', '-99.24398');
INSERT INTO "building" (address, latitude, longitude) VALUES ('929-304 Ante Street', '85.00379', '-25.62117'), ('512-2663 Eget St.', '71.51707', '-137.76026'), ('295-9713 Metus St.', '79.4359', '26.77924'), ('Ap #990-9230 Pede, Avenue', '88.05898', '-47.22729'), ('373-4470 Sagittis. Ave', '39.33129', '66.75474'), ('P.O. Box 497, 3126 Morbi Road', '-88.59142', '66.58918'), ('Ap #661-8555 Eu St.', '-37.19628', '-125.91691'), ('252-5719 Ut Av.', '-63.59692', '-115.80737'), ('P.O. Box 546, 899 Fringilla St.', '-33.46724', '119.24466'), ('P.O. Box 436, 976 Ullamcorper, Road', '24.04854', '98.56601');
INSERT INTO "building" (address, latitude, longitude) VALUES ('289-6302 Pede. St.', '24.97782', '-139.49344'), ('7325 At Avenue', '-63.59314', '144.53058'), ('P.O. Box 107, 7144 Id Rd.', '-63.42595', '5.75514'), ('2277 Quam. Rd.', '45.04063', '53.57753'), ('Ap #307-1779 In Av.', '51.52626', '51.18868'), ('7212 Est, St.', '-10.7348', '-82.70641'), ('Ap #326-6966 Elit. Road', '-42.1435', '80.301'), ('Ap #565-8907 Phasellus Rd.', '6.86114', '48.11079'), ('Ap #897-5588 Suspendisse Road', '-32.6302', '129.51786'), ('667-5873 Montes, Ave', '-21.38352', '-57.10257');
INSERT INTO "building" (address, latitude, longitude) VALUES ('P.O. Box 745, 3934 A, Ave', '13.71798', '79.64663'), ('234-9605 Malesuada Rd.', '-51.99696', '-9.90485'), ('785-5186 Massa. St.', '61.4561', '-175.19361'), ('521-262 Enim Rd.', '-29.81624', '-145.2117'), ('1330 Orci Road', '-80.18302', '172.72218'), ('669-4212 Sem St.', '89.50478', '-83.86615'), ('374-576 Vehicula Av.', '-84.30149', '18.67085'), ('8350 Non, Street', '-18.0807', '132.03867'), ('P.O. Box 663, 5414 Sed St.', '58.53961', '-136.7131'), ('P.O. Box 692, 2046 Fringilla St.', '-77.11775', '99.80304');

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO "category" (name, level, lft, rgt) VALUES
('Общая', 0, 1, 28),
('Еда', 1, 2, 11),
('Полуфабрикаты оптом', 2, 3, 4),
('Мясная продукция', 2, 5, 6),
('Кафе', 2, 7, 10),
('Суши', 3, 8, 9),
('Авто', 1, 12, 21),
('грузовые', 2, 13, 14),
('легковые', 2, 15, 20),
('запчасти', 3, 16, 17),
('Шины и диски', 3, 18, 19),
('Спорт', 1, 22, 27),
('Тренажёрные залы', 2, 23, 24),
('Бассейны', 2, 25, 26);

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO "company" (building_id, name, phones) VALUES (75, 'Ut Lacus Corp.', NULL)
                                                       , (96, 'Libero At LLP', NULL)
                                                       , (3, 'Tincidunt PC', '7-310-528-6218, 753-0900')
                                                       , (54, 'Eu Elit Ltd', '7-485-393-1594, 7-831-770-5878')
                                                       , (15, 'Luctus Company', '500-6037, 502-3775, 981-9484')
                                                       , (56, 'Eros Nec Tellus Company', '296-2830, 7-708-327-0102, 427-5217, 949-1091')
                                                       , (52, 'Auctor Velit Institute', '952-9570, 190-4828, 7-480-919-5956, 7-626-216-6369')
                                                       , (89, 'Ante Iaculis Nec Corporation', '366-4569, 7-424-355-5902')
                                                       , (10, 'Convallis Convallis Corporation', '7-269-731-3487, 7-580-567-0620, 7-711-761-7897')
                                                       , (32, 'Sem Semper Erat PC', '931-4562')
;
INSERT INTO "company" (building_id, name, phones) VALUES (43, 'Nunc Sed Pede Corporation', NULL)
                                                       , (81, 'Magnis Associates', '7-616-102-5321, 814-4259')
                                                       , (80, 'Dolor PC', '7-842-472-2045')
                                                       , (67, 'Vel Sapien LLP', NULL)
                                                       , (58, 'Luctus Associates', '7-455-125-1972')
                                                       , (46, 'Non PC', '203-0101, 924-0244, 7-555-222-3611')
                                                       , (39, 'Dictum Proin Company', '7-890-749-0533, 7-737-512-0116, 639-1353, 7-747-117-9265, 7-607-899-6444')
                                                       , (5, 'Cum Ltd', NULL)
                                                       , (20, 'Vestibulum Neque Corporation', '595-0184, 7-189-756-4459')
                                                       , (13, 'Purus Ltd', '825-6520')
;
INSERT INTO "company" (building_id, name, phones) VALUES (46, 'Risus Foundation', '7-566-701-9908, 7-513-347-4439')
                                                       , (58, 'Sagittis Augue Eu PC', '155-5196, 7-949-752-4547')
                                                       , (76, 'Non Enim Foundation', '7-563-172-3254')
                                                       , (55, 'Est Ac Facilisis Inc.', '7-572-236-1464')
                                                       , (57, 'Mauris A Associates', '7-692-187-7810, 308-7358')
                                                       , (80, 'In Tempus Eu Consulting', '7-922-904-9931, 523-6975, 483-4741, 7-325-545-7020')
                                                       , (88, 'Non Limited', '7-712-984-2234, 7-645-665-8974')
                                                       , (18, 'Eu Eleifend Nec Foundation', '7-192-188-7097')
                                                       , (95, 'Dolor Limited', '828-4413, 213-8653')
                                                       , (40, 'Praesent Interdum Ligula Industries', '298-2049')
;
INSERT INTO "company" (building_id, name, phones) VALUES (83, 'Sit Inc.',
                                                          '7-630-857-9074, 666-7701, 733-6113, 7-371-560-7702, 7-365-155-6040')
                                                       , (78, 'Pharetra Corp.', '7-915-724-2154, 7-475-275-4063')
                                                       , (90, 'Ornare Elit LLP', '638-2145, 758-0887, 685-7048')
                                                       , (5, 'Neque Tellus Imperdiet LLC', '7-644-951-2437, 7-203-795-2156, 7-993-275-7258, 7-684-170-1335')
                                                       , (30, 'Aliquam Ornare Libero Institute', '7-197-233-1181, 7-759-720-6374')
                                                       , (39, 'Commodo Tincidunt Nibh Corp.', '7-798-568-0121, 7-366-558-0771, 7-301-843-9547, 773-2036')
                                                       , (89, 'Consectetuer Limited', '7-445-638-7281')
                                                       , (96, 'Lectus Sit Consulting', '7-522-537-4357')
                                                       , (83, 'Arcu Inc.', '765-0195, 7-807-318-4893')
                                                       , (20, 'Luctus PC', '7-170-510-8828')
;
INSERT INTO "company" (building_id, name, phones) VALUES (22, 'Semper Incorporated',
                                                          '7-519-796-3160, 7-414-466-8434, 982-1762, 7-355-116-6160, 7-822-320-0446')
                                                       , (56, 'Quisque Ac Libero Consulting', '428-8330, 559-1769, 7-279-859-7603, 102-3443, 7-149-732-7601')
                                                       , (82, 'Neque Non LLC', '7-860-978-5012, 474-3353, 905-7362')
                                                       , (3, 'Quisque LLP', '253-4267, 523-2548')
                                                       , (81, 'Proin Eget Limited', '630-2083')
                                                       , (87, 'Est Congue A Associates', '7-140-814-3187, 7-337-884-2955, 529-2168')
                                                       , (39, 'Fermentum Metus Aenean Corporation', '7-780-951-6634')
                                                       , (45, 'Augue PC', '7-519-428-7637, 273-8903')
                                                       , (24, 'Enim LLP', '137-1196')
                                                       , (23, 'Montes Company', '7-163-259-7127, 7-773-818-3988, 890-6876, 7-265-227-4809, 7-655-551-7660, 129-7920')
;
INSERT INTO "company" (building_id, name, phones) VALUES (52, 'Nec Ligula Consectetuer Industries', NULL)
                                                       , (78, 'Quisque Porttitor Foundation', NULL)
                                                       , (84, 'Penatibus Et Magnis LLC', '441-6899, 7-531-279-7664, 7-302-965-4119, 613-4499')
                                                       , (29, 'Tempor Limited', '995-7574, 7-889-707-6581')
                                                       , (86, 'In Molestie Limited', '689-8990, 7-972-277-0372, 7-647-237-0643, 987-5818')
                                                       , (23, 'Cum Institute', '7-210-312-8987')
                                                       , (67, 'Sed Industries', '7-862-845-8162')
                                                       , (21, 'Neque Vitae Semper Inc.', '7-590-922-1011, 7-817-898-3683, 607-4405')
                                                       , (84, 'Integer LLP', '313-6177, 953-6839')
                                                       , (46, 'Sem Semper Erat Corporation', '7-747-239-7849, 7-667-920-4696, 780-5108, 724-0656')
;
INSERT INTO "company" (building_id, name, phones) VALUES (98, 'Nunc Lectus Foundation', NULL)
                                                       , (17, 'Mauris Suspendisse Aliquet Limited', '260-2010, 745-5388')
                                                       , (98, 'Ante Dictum PC', '179-8632')
                                                       , (80, 'Donec Luctus LLP', '7-500-368-5370, 7-782-229-0833, 7-890-485-9305')
                                                       , (58, 'Rutrum LLP', '564-0125')
                                                       , (87, 'Tempus Risus Donec LLP', '7-899-659-6313, 513-1172')
                                                       , (63, 'Nonummy Industries', '7-587-431-3569, 7-804-685-1126, 7-717-878-3351, 7-804-510-6457')
                                                       , (24, 'Montes Corp.', '661-3456, 603-6003, 555-7130')
                                                       , (96, 'Risus In Industries', '688-0540')
                                                       , (8, 'Lectus Quis Massa PC', NULL)
;
INSERT INTO "company" (building_id, name, phones) VALUES (78, 'Fringilla Corp.', '7-822-377-2352, 7-501-598-5970, 177-7440')
                                                       , (94, 'In Condimentum Donec Associates', '640-1605, 323-2592')
                                                       , (35, 'Penatibus LLP', '7-556-257-9606, 7-574-201-9628')
                                                       , (61, 'Mauris Consulting', NULL)
                                                       , (16, 'Eros Non Enim LLC', '346-6398, 7-461-637-3088, 7-656-802-1878, 376-5417')
                                                       , (9, 'Ut Corp.', '850-6788, 7-218-110-9741')
                                                       , (15, 'Iaculis Industries', NULL)
                                                       , (26, 'Suspendisse Dui Fusce Corp.', '7-176-239-6361, 986-6102, 440-1785, 7-104-861-1753')
                                                       , (28, 'Ac Metus Vitae Ltd', NULL)
                                                       , (27, 'Morbi Non Sapien Incorporated', '656-4005')
;
INSERT INTO "company" (building_id, name, phones) VALUES (9, 'Risus Varius Orci Foundation',
                                                          '7-933-156-3615, 7-223-133-8921, 7-142-229-5204, 7-555-240-5397')
                                                       , (17, 'Fusce Aliquet Corporation', '7-767-254-1629, 7-961-715-8325')
                                                       , (10, 'A Magna Foundation', NULL)
                                                       , (54, 'Libero Integer Corp.', '674-8502, 976-3378')
                                                       , (1, 'Fermentum Industries', '769-3730')
                                                       , (32, 'Ligula Tortor Dictum LLP', '161-3525, 409-3824, 477-0127')
                                                       , (44, 'Purus Ac Tellus Company', '7-369-341-8352, 176-9154, 7-485-339-3678')
                                                       , (95, 'Aliquam Enim Consulting',
                                                          '597-1137, 975-5859, 7-892-900-5987, 7-468-159-9647, 7-876-806-0555, 198-5081, 953-1952, 108-4094')
                                                       , (20, 'Lacinia Sed LLC', '7-182-251-3042, 7-480-191-3405')
                                                       , (31, 'Sed Id Foundation', '804-0625')
;
INSERT INTO "company" (building_id, name, phones) VALUES
(3, 'Ligula Nullam Enim Inc.', '331-6787, 7-416-630-6812, 7-412-639-5697')
                                                       , (100, 'Dis Parturient Montes Consulting', '7-258-823-2584, 687-3688, 326-2544, 144-1871')
                                                       , (87, 'Ante Company', '947-8384')
                                                       , (26, 'Tellus Company', NULL)
                                                       , (82, 'Sed Industries', '7-454-126-7908, 7-973-881-6944, 7-930-230-0282, 7-767-938-7832')
                                                       , (31, 'Fringilla Cursus LLC', '7-498-704-9915, 791-6795, 7-794-780-8171')
                                                       , (13, 'Dictum Foundation', '7-583-441-4244, 7-789-715-7768, 971-1217, 540-6721')
                                                       , (21, 'Sed Associates', '189-0147, 7-856-941-9211')
                                                       , (92, 'Elit Foundation', '7-958-327-9722, 284-0463, 351-7941, 7-230-400-7067')
                                                       , (84, 'Duis Volutpat Nunc Limited', '7-149-728-3851, 163-1759')
;
INSERT INTO "company" (building_id, name, phones) VALUES (54, 'Natoque Penatibus Industries', '897-1355')
                                                       , (17, 'Mattis Ornare Associates', '7-977-598-2372, 638-6576, 946-7168, 843-7028, 706-9740, 506-0221')
                                                       , (66, 'Ipsum Curabitur LLC', '7-488-297-6249')
                                                       , (65, 'Dictum Mi Foundation', '650-4079, 170-0732')
                                                       , (68, 'Vulputate LLP', '951-9902')
                                                       , (56, 'Massa Mauris LLP', '7-975-250-5283, 562-9020, 699-6089, 7-722-930-5866, 7-356-247-0711')
                                                       , (42, 'Enim Nisl Elementum Inc.', '306-1376')
                                                       , (53, 'Adipiscing Lobortis Risus Ltd', '7-518-518-8177')
                                                       , (87, 'Cum Company', '7-376-104-1634, 7-321-514-8882, 7-790-672-4978, 7-279-675-4089, 7-271-813-6899')
                                                       , (47, 'Mus Proin Inc.', '330-1295, 574-9303, 830-2150, 7-593-522-2151, 7-939-180-6249')
;
INSERT INTO "company" (building_id, name, phones) VALUES (65, 'Interdum Curabitur Limited', '7-199-999-7276, 256-5842')
                                                       , (67, 'Dui Company', '7-179-757-1247, 323-4641, 989-1083, 934-7257, 7-230-325-3755, 842-4200, 7-702-885-8733')
                                                       , (71, 'Consequat LLP', '811-3817')
                                                       , (67, 'Sagittis Nullam Vitae Incorporated', '7-542-406-3570')
                                                       , (10, 'Cursus Nunc Mauris Incorporated', '7-319-495-6746, 7-502-833-6781, 840-3875, 7-826-839-2134, 7-825-352-0648')
                                                       , (61, 'Risus Institute', '405-2954')
                                                       , (54, 'Ornare Fusce Industries', '7-898-599-1727, 7-941-709-9145, 826-8200')
                                                       , (69, 'Pellentesque LLP', '438-0103, 570-7460, 278-6045, 651-8724')
                                                       , (71, 'Eleifend Inc.', '593-4094, 112-5175, 7-822-635-1093, 827-9860')
                                                       , (60, 'In Tincidunt Corp.', '981-7452, 7-288-594-5913, 857-5802, 992-0477, 135-3908')
;
INSERT INTO "company" (building_id, name, phones) VALUES (77, 'Ornare PC', '840-5213')
                                                       , (50, 'Ultrices A Auctor Institute', '295-4682')
                                                       , (33, 'Consectetuer Adipiscing Institute', '7-482-745-5031, 155-4671, 264-5753')
                                                       , (43, 'Venenatis LLP', '7-120-390-5009, 7-608-491-7728, 7-622-274-3704')
                                                       , (16, 'Eu Eleifend Nec Limited', '698-3769, 7-457-188-8948')
                                                       , (35, 'Blandit Congue PC', '435-7540, 862-4105, 7-997-816-8239, 7-736-902-7528')
                                                       , (11, 'Et Netus Ltd', '7-370-518-0627, 7-915-527-7352')
                                                       , (45, 'Non Institute', '7-128-798-4663')
                                                       , (5, 'Primis In Foundation', '165-4011, 7-540-470-8327, 140-2676, 350-7599')
                                                       , (72, 'Commodo At PC', '955-9377, 677-9424, 7-748-427-8714, 929-7621')
;
INSERT INTO "company" (building_id, name, phones) VALUES (10, 'Nulla Facilisi LLC', '892-9118, 370-1868, 7-279-297-7963')
                                                       , (52, 'Arcu Sed Et Limited', '7-862-531-8712')
                                                       , (34, 'Orci LLP', '899-7410, 7-367-555-0173')
                                                       , (66, 'Mi Fringilla Mi Ltd', '7-761-183-1782')
                                                       , (70, 'Mauris Inc.', '7-983-330-8604')
                                                       , (41, 'Et Tristique Inc.', '552-6464, 965-5185, 7-715-850-8415, 645-3668')
                                                       , (47, 'Orci Tincidunt Associates', '755-1246, 7-754-302-9565, 7-815-650-9600, 817-5827, 483-9818')
                                                       , (45, 'Curae; Phasellus Company', '439-5327, 7-991-637-8097')
                                                       , (11, 'Facilisis Magna Incorporated', '249-9507, 7-415-155-0065, 880-3165')
                                                       , (76, 'Et Malesuada Fames Corp.', '567-0927')
;
INSERT INTO "company" (building_id, name, phones) VALUES (70, 'Aenean Eget Metus Associates',
                                                          '7-958-315-2791, 7-514-999-5002, 7-390-578-5212, 167-6254')
                                                       , (99, 'Felis Ullamcorper Viverra Consulting', '7-617-555-2908')
                                                       , (65, 'Mauris Associates', '728-1322, 7-327-659-5074')
                                                       , (100, 'Sit Foundation', '7-248-684-8196, 486-9654, 7-349-669-1304')
                                                       , (79, 'Mauris Sagittis LLP', '7-170-404-4151')
                                                       , (42, 'Vel Venenatis Corp.', '210-5363, 469-0546, 786-3305, 973-0708, 295-0495')
                                                       , (35, 'Interdum Libero Dui LLC', '961-6482, 7-426-771-2753, 7-628-489-5562, 424-2397')
                                                       , (79, 'Aliquet Sem Ut Inc.', '823-1931, 298-8580')
                                                       , (95, 'Laoreet Lectus Consulting', '7-905-478-1483')
                                                       , (29, 'Magna Sed Inc.', '7-948-870-5184, 722-3527')
;
INSERT INTO "company" (building_id, name, phones) VALUES (61, 'Turpis Incorporated', '7-111-677-6077, 544-9446')
                                                       , (33, 'Sed Tortor Corp.', '7-496-604-5120, 777-7236, 334-8989, 7-404-497-9664')
                                                       , (52, 'Neque Consulting', '250-4992, 418-4311, 7-995-753-8705, 116-9573')
                                                       , (60, 'Ultrices Vivamus Rhoncus Institute', NULL)
                                                       , (98, 'In Scelerisque Scelerisque LLP', '550-8325')
                                                       , (8, 'Consequat Lectus Sit Incorporated', '7-348-770-6879, 7-502-592-4123, 7-233-498-1026')
                                                       , (25, 'Ultrices Iaculis Inc.', '903-4322, 7-955-325-0104, 7-557-298-8048')
                                                       , (92, 'Felis Nulla Company', NULL)
                                                       , (68, 'Vitae Semper PC', '697-4888, 7-642-966-4729, 7-768-954-8190, 162-6158, 7-135-371-2698')
                                                       , (60, 'Cras Industries', NULL)
;
INSERT INTO "company" (building_id, name, phones) VALUES (3, 'Phasellus Ornare Fusce Incorporated', '595-2971, 425-6078')
                                                       , (8, 'Ridiculus Mus Aenean Consulting', NULL)
                                                       , (100, 'Vulputate Mauris Sagittis Industries', '236-1886, 7-796-107-9933, 7-972-289-4094')
                                                       , (51, 'Eu Industries', '131-0921')
                                                       , (11, 'Donec Limited', '7-106-537-1485, 161-3247')
                                                       , (56, 'Sed Corp.', '193-8317, 681-2467')
                                                       , (25, 'Eget Magna Foundation', '316-3405')
                                                       , (90, 'Dui Semper LLP', '893-5043, 321-9939')
                                                       , (84, 'Nisl Ltd', '717-7033, 7-257-951-0588')
                                                       , (94, 'Montes Nascetur Ridiculus LLP', NULL)
;
INSERT INTO "company" (building_id, name, phones) VALUES (98, 'Dis Parturient Industries', '724-7474')
                                                       , (81, 'Curabitur LLP', '981-3667, 7-132-442-2085, 7-500-973-6211, 7-761-687-2152, 283-0967, 230-6367')
                                                       , (11, 'Neque Tellus Imperdiet Ltd', '7-721-733-3955, 7-282-500-3410')
                                                       , (96, 'Feugiat Industries', '7-710-852-0422, 434-6937, 341-8943, 7-903-799-3183, 991-2031')
                                                       , (2, 'Pellentesque Sed Dictum LLC', '271-0456')
                                                       , (97, 'Malesuada Consulting', '7-488-354-5449, 376-3837')
                                                       , (16, 'Ipsum Leo Elementum Consulting', '571-2173')
                                                       , (17, 'Posuere At Velit Institute', '7-127-669-5653')
                                                       , (19, 'Magna PC', '7-655-967-6543, 490-5179')
                                                       , (23, 'Aliquet Metus Urna Associates', '7-162-303-7481, 871-4804, 7-596-632-5679, 7-520-544-3255, 7-652-781-1515')
;
INSERT INTO "company" (building_id, name, phones) VALUES (74, 'Vivamus Sit Amet Foundation', NULL)
                                                       , (44, 'Commodo Ipsum Company', '7-747-660-9685, 419-8114, 949-2829, 7-287-280-3042, 7-875-134-8782')
                                                       , (18, 'Sit Amet Associates', '7-732-976-0860, 205-3083, 608-2434, 7-991-211-2961, 7-215-785-3961')
                                                       , (93, 'Parturient Montes Consulting', '7-669-796-5823')
                                                       , (7, 'Montes Company', '167-5240, 529-9827, 7-812-389-6973, 7-644-411-4569, 7-347-644-1490')
                                                       , (75, 'Nulla Integer Vulputate Limited', '145-4672, 452-0069, 835-0641, 657-4124, 7-362-712-0640')
                                                       , (47, 'Facilisis Non Consulting', '531-8403, 891-0141')
                                                       , (44, 'Tempus Risus Donec Limited', '803-0155, 7-521-210-2631, 7-210-450-5438, 423-6311')
                                                       , (45, 'Purus PC', '7-675-750-9658')
                                                       , (15, 'Mauris Company', '266-9883, 835-0168, 7-122-822-3017')
;
INSERT INTO "company" (building_id, name, phones) VALUES (91, 'Eget Volutpat Ornare Corp.',
                                                          '710-9883, 999-1607, 7-706-903-0014, 979-1567')
                                                       , (57, 'Pede Consulting', NULL)
                                                       , (34, 'Nullam Vitae Diam Ltd', '7-321-168-9646, 7-744-119-8653')
                                                       , (85, 'Mauris Industries', '772-4488, 645-8295, 556-9470, 7-462-262-1228')
                                                       , (84, 'Urna Et PC', NULL)
                                                       , (15, 'Cum Sociis Natoque PC', '254-8258, 388-0727')
                                                       , (2, 'Volutpat Inc.', '7-903-773-7102, 7-787-892-0849, 187-8739')
                                                       , (36, 'Fringilla Corp.', '389-3959, 398-1912')
                                                       , (78, 'Lobortis Ultrices Vivamus Limited', '7-762-732-0499')
                                                       , (7, 'Ipsum Cursus Vestibulum Institute', '786-8781, 596-2969')
;
INSERT INTO "company" (building_id, name, phones) VALUES (7, 'Vehicula PC', '219-3487, 7-666-233-0140, 671-5615')
                                                       , (51, 'Diam Foundation', '7-886-293-2955, 7-993-212-1401, 707-1430, 664-7193')
                                                       , (57, 'Eu Sem Corp.', '183-7965, 900-4452')
                                                       , (71, 'Dignissim Industries', '7-170-431-5100')
                                                       , (21, 'Id Industries', '7-101-177-3256')
                                                       , (81, 'Neque Industries', '757-6162, 430-8616, 7-776-747-7755, 7-134-786-2667')
                                                       , (77, 'Sem Eget Massa Ltd', '240-6036, 7-998-309-5136, 495-4297')
                                                       , (23, 'Urna Nunc Inc.', '7-775-204-9650, 905-3908, 7-538-140-7938')
                                                       , (99, 'Auctor Nunc PC', '7-242-458-2183, 621-1006')
                                                       , (46, 'Nunc Ac PC', '782-0495, 225-9574, 7-910-194-6129, 977-7778, 7-322-231-4540')
;
INSERT INTO "company" (building_id, name, phones) VALUES (66, 'Nonummy Ac Foundation', '334-6688')
                                                       , (72, 'Eu Incorporated', '7-632-629-1193')
                                                       , (50, 'Donec PC', '7-177-191-6798')
                                                       , (70, 'Eu Augue Incorporated', '160-2555, 356-0483, 573-8712')
                                                       , (51, 'Aliquet Incorporated', '398-6038, 349-3070, 7-840-104-2825, 636-1730, 381-1591, 7-840-101-4967')
                                                       , (4, 'Libero Nec Limited', '7-982-316-5848')
                                                       , (29, 'Suspendisse Dui Fusce Incorporated', '7-690-256-6927, 7-797-553-7041, 514-9642')
                                                       , (75, 'Et Limited', NULL)
                                                       , (8, 'Nonummy Fusce Fermentum Ltd', '7-484-621-7121, 919-7524, 663-1092, 126-7395, 7-609-187-5111')
                                                       , (44, 'Ullamcorper Industries', NULL)
;
INSERT INTO "company" (building_id, name, phones) VALUES (60, 'Rutrum Inc.', '7-454-673-6787, 415-7499')
                                                       , (2, 'Sed Est Associates', '946-7882, 7-308-619-2824, 511-9188')
                                                       , (18, 'Tristique PC', NULL)
                                                       , (59, 'Dolor Dapibus Gravida Corporation', '178-0077')
                                                       , (9, 'Amet Limited', '156-7432, 7-153-911-7582, 436-5181, 7-422-378-1457')
                                                       , (25, 'Vulputate Nisi Limited', '7-697-424-0593, 7-713-967-9641, 807-2189, 334-0639')
                                                       , (100, 'Tellus Inc.', '764-6174, 7-975-512-0995')
                                                       , (6, 'Erat Volutpat PC', '465-5078, 159-6223')
                                                       , (62, 'Vitae Ltd', '7-265-961-4731, 7-478-997-4726, 7-402-929-8142')
                                                       , (94, 'Ullamcorper Associates', '270-7783, 640-4872')
;
INSERT INTO "company" (building_id, name, phones) VALUES (67, 'Molestie Corp.', NULL)
                                                       , (83, 'Augue Consulting', '7-464-740-0377, 7-545-735-2844, 613-2650')
                                                       , (80, 'A Dui Institute', '520-9492')
                                                       , (4, 'Accumsan Company', '7-699-287-6874')
                                                       , (99, 'Et Netus Et Corporation', '914-6377, 7-392-819-2556, 473-6643, 447-4487, 156-3171')
                                                       , (71, 'Mauris Institute', '7-370-336-1184')
                                                       , (69, 'Ut Corp.', NULL)
                                                       , (46, 'At Lacus Quisque Industries', '595-7651')
                                                       , (88, 'Mi Duis Risus Institute', '845-9644, 7-105-206-5789, 554-6015')
                                                       , (26, 'A Inc.', '7-433-105-9274')
;
INSERT INTO "company" (building_id, name, phones) VALUES (3, 'Cubilia Curae; Inc.', '7-496-204-9444, 938-5749, 775-2538')
                                                       , (69, 'Nisi A Odio Corporation', NULL)
                                                       , (6, 'Accumsan Sed Facilisis Industries', '7-451-891-7222, 7-145-573-2525, 567-4220')
                                                       , (75, 'Urna PC', NULL)
                                                       , (73, 'Velit Egestas Lacinia PC', '245-0002, 7-956-121-5220, 391-3515')
                                                       , (55, 'Nisi Aenean Eget LLC', '7-345-678-8601, 7-336-577-2750, 7-264-332-2521')
                                                       , (74, 'Eu Dui Cum Consulting', '7-327-143-3350')
                                                       , (19, 'Quisque Ltd', '458-5795, 7-370-192-8347, 7-181-558-7395')
                                                       , (43, 'Convallis Limited', '598-6846, 572-8445, 446-4689, 7-403-768-8808, 786-6692, 7-827-495-1563')
                                                       , (100, 'Senectus Et Corporation', '694-2037, 613-1596, 7-953-380-9947')
;
INSERT INTO "company" (building_id, name, phones) VALUES (24, 'Molestie Institute', '7-622-851-7297, 7-157-838-2674')
                                                       , (32, 'Sapien Cras Corporation', '841-5998, 344-9453, 7-327-709-6280, 7-191-843-9881')
                                                       , (61, 'Dolor PC', '7-374-741-2800')
                                                       , (76, 'Nulla Corporation', '7-358-980-2486, 460-1734, 7-837-270-0690, 7-567-193-1000, 833-0166, 298-2722')
                                                       , (88, 'Magnis Dis PC', '7-563-385-5412, 7-280-580-0395')
                                                       , (62, 'Fusce Aliquet Magna Limited', '7-706-312-1472, 7-590-456-0657, 7-552-100-9016')
                                                       , (97, 'Iaculis Odio Nam Limited', '7-736-634-7377')
                                                       , (70, 'Nullam Scelerisque Neque Ltd', '207-7989, 171-9476')
                                                       , (26, 'A Dui LLC', '7-480-489-2565, 327-4665')
                                                       , (1, 'Ullamcorper Velit In Corp.', '969-1779')
;
INSERT INTO "company" (building_id, name, phones) VALUES (6, 'Euismod Corporation', NULL)
                                                       , (22, 'Tincidunt Nunc Industries', '292-9200, 7-995-554-8502, 999-2691, 737-5094')
                                                       , (4, 'Consequat Nec LLC', '432-8061')
                                                       , (82, 'Orci Inc.', '7-730-891-9882, 7-121-642-3064')
                                                       , (76, 'Phasellus Dolor Elit Ltd', '813-5173, 7-285-515-2374, 974-9120, 626-8255')
                                                       , (94, 'Tellus Consulting', '7-226-469-9973, 447-5762, 643-6721')
                                                       , (18, 'Phasellus At Augue Corp.', '190-4448, 7-358-239-1345, 7-522-222-9141')
                                                       , (1, 'Vestibulum Ante Ipsum LLP', '781-9453, 186-4137, 595-7448')
                                                       , (55, 'Etiam Gravida Inc.', '7-479-461-8303')
                                                       , (65, 'Sed Congue Elit LLC', '7-322-697-2054, 846-1435, 7-655-982-5946')
;
INSERT INTO "company" (building_id, name, phones) VALUES (77, 'Nec Consulting', '526-7288')
                                                       , (21, 'Amet Risus Donec Industries', NULL)
                                                       , (56, 'Mollis Ltd', '7-431-394-9418, 7-847-966-3415, 7-463-589-1003, 417-6155, 256-1277, 7-585-524-5612')
                                                       , (25, 'Praesent Eu Dui Institute', '7-981-271-0114, 7-803-575-6050')
                                                       , (52, 'Mauris Ut Mi LLP',
                                                          '7-188-323-2435, 7-293-988-7428, 7-344-709-1952, 7-830-817-9091, 238-8798, 7-996-512-7371, 815-5610, 7-410-651-5295')
                                                       , (60, 'Euismod Mauris Eu Company', '7-929-585-9901, 7-533-776-6964, 156-6575, 7-213-980-4323')
                                                       , (93, 'Nisl Maecenas Corp.', '7-216-930-9216, 857-6886, 7-623-966-2388, 357-3968')
                                                       , (90, 'Cursus Et Magna Inc.', '295-7547')
                                                       , (2, 'Lacus Nulla Tincidunt Institute', '7-253-876-0997, 703-5997, 7-354-953-7583, 672-4787')
                                                       , (18, 'Nibh Donec LLP', '452-6187, 203-5508, 213-5800, 385-3273, 7-893-129-5313')
;
INSERT INTO "company" (building_id, name, phones) VALUES (29, 'Sagittis Company',
                                                          '7-927-138-9737, 7-957-451-9589, 383-1044, 626-1378, 7-355-792-7085')
                                                       , (22, 'Porttitor Vulputate Corp.', '635-1259, 7-682-466-0667, 7-588-851-5602, 463-9507')
                                                       , (49, 'Facilisis Lorem Corp.', '7-931-825-7194, 7-142-274-7319')
                                                       , (49, 'Aliquet Lobortis Limited', '312-7194')
                                                       , (24, 'Dui Fusce Industries', '467-4884')
                                                       , (78, 'Id Sapien Associates', NULL)
                                                       , (41, 'Quisque Nonummy Associates', NULL)
                                                       , (97, 'Morbi Accumsan Corporation', '538-1355, 7-438-845-8001, 7-578-620-1712')
                                                       , (20, 'Fringilla Consulting', '700-7712, 7-210-460-6521')
                                                       , (98, 'Et Rutrum Corp.', '551-1052')
;
INSERT INTO "company" (building_id, name, phones) VALUES (69, 'Vel Mauris Integer LLC', '653-8763, 697-9589')
                                                       , (95, 'Tempor Est Incorporated', '7-242-219-8802')
                                                       , (82, 'Et Netus Et Foundation', '282-8277, 7-514-838-1679')
                                                       , (26, 'Sem Ut Limited', '280-4262')
                                                       , (46, 'Viverra Industries', NULL)
                                                       , (83, 'Fringilla Donec Consulting', '425-0773')
                                                       , (97, 'Eget Odio Company', '444-8633, 262-1048, 726-0759')
                                                       , (28, 'Egestas Duis Ac Foundation', '7-539-524-1933, 711-0185, 141-8585')
                                                       , (6, 'Vitae Aliquam Eros LLP', '955-5375, 822-4486, 491-9635')
                                                       , (19, 'A Auctor LLC', '960-4219, 466-3320, 7-269-949-2202, 210-7705');

-- ----------------------------
-- Records of company_category
-- ----------------------------
INSERT INTO "company_category" (company_id, category_id) VALUES (24, 8), (68, 14), (291, 5), (276, 2), (146, 9), (180, 7), (161, 7), (108, 4), (110, 4), (4, 8);
INSERT INTO "company_category" (company_id, category_id) VALUES (214, 12), (283, 5), (247, 6), (299, 2), (87, 14), (128, 8), (140, 2), (221, 7), (173, 4), (229, 3);
INSERT INTO "company_category" (company_id, category_id) VALUES (61, 10), (177, 10), (23, 7), (137, 5), (286, 10), (221, 13), (210, 5), (243, 2), (26, 14), (143, 13);
INSERT INTO "company_category" (company_id, category_id) VALUES (54, 14), (266, 9), (275, 9), (197, 2), (233, 14), (73, 10), (126, 7), (235, 13), (99, 10), (36, 7);
INSERT INTO "company_category" (company_id, category_id) VALUES (185, 7), (148, 8), (186, 14), (60, 8), (229, 12), (243, 10), (168, 14), (7, 9), (269, 8), (269, 9);
INSERT INTO "company_category" (company_id, category_id) VALUES (245, 14), (238, 10), (290, 10), (129, 10), (100, 5), (7, 6), (112, 9), (43, 7), (292, 6), (31, 2);
INSERT INTO "company_category" (company_id, category_id) VALUES (168, 7), (186, 10), (184, 3), (261, 12), (64, 14), (258, 13), (4, 5), (168, 12), (64, 2), (145, 7);
INSERT INTO "company_category" (company_id, category_id) VALUES (119, 7), (52, 3), (215, 8), (100, 7), (64, 10), (79, 14), (297, 14), (129, 3), (49, 7), (176, 7);
INSERT INTO "company_category" (company_id, category_id) VALUES (298, 12), (161, 11), (77, 2), (252, 7), (204, 3), (241, 7), (240, 11), (253, 10), (69, 13), (30, 13);
INSERT INTO "company_category" (company_id, category_id) VALUES (79, 9), (243, 7), (180, 13), (130, 9), (219, 3), (243, 7), (98, 3), (7, 14), (122, 6), (291, 7);

INSERT INTO "company_category" (company_id, category_id) VALUES (108, 4), (96, 10), (154, 8), (151, 11), (14, 11), (63, 13), (59, 7), (279, 5), (214, 11), (212, 12);
INSERT INTO "company_category" (company_id, category_id) VALUES (108, 2), (283, 9), (217, 5), (249, 5), (108, 3), (31, 4), (250, 8), (114, 14), (28, 7), (102, 12);
INSERT INTO "company_category" (company_id, category_id) VALUES (66, 3), (120, 4), (220, 13), (167, 5), (33, 11), (9, 11), (283, 11), (14, 13), (7, 7), (112, 8);
INSERT INTO "company_category" (company_id, category_id) VALUES (11, 13), (202, 8), (291, 9), (277, 13), (161, 8), (167, 5), (17, 8), (286, 8), (163, 9), (165, 13);
INSERT INTO "company_category" (company_id, category_id) VALUES (285, 10), (202, 13), (96, 2), (200, 12), (290, 2), (1, 6), (14, 5), (25, 6), (191, 12), (279, 9);
INSERT INTO "company_category" (company_id, category_id) VALUES (291, 7), (155, 3), (33, 13), (142, 14), (10, 2), (218, 3), (258, 5), (201, 2), (115, 9), (107, 14);
INSERT INTO "company_category" (company_id, category_id) VALUES (32, 3), (37, 14), (126, 2), (255, 7), (181, 13), (211, 3), (158, 14), (250, 13), (97, 4), (149, 11);
INSERT INTO "company_category" (company_id, category_id) VALUES (262, 4), (178, 6), (267, 2), (208, 2), (243, 3), (163, 14), (202, 12), (217, 13), (116, 14), (255, 9);
INSERT INTO "company_category" (company_id, category_id) VALUES (272, 14), (136, 6), (267, 3), (101, 5), (262, 10), (56, 10), (192, 10), (103, 14), (226, 4), (128, 11);
INSERT INTO "company_category" (company_id, category_id) VALUES (299, 7), (56, 5), (114, 10), (24, 11), (48, 13), (239, 2), (63, 14), (254, 5), (195, 5), (43, 13);

INSERT INTO "company_category" (company_id, category_id) VALUES (200, 11), (49, 6), (152, 3), (299, 6), (134, 3), (177, 6), (7, 4), (41, 7), (152, 2), (191, 10);
INSERT INTO "company_category" (company_id, category_id) VALUES (116, 10), (268, 14), (38, 9), (179, 9), (19, 12), (295, 3), (83, 10), (236, 5), (146, 11), (243, 2);
INSERT INTO "company_category" (company_id, category_id) VALUES (205, 5), (55, 9), (24, 7), (72, 3), (39, 10), (22, 12), (89, 3), (289, 14), (194, 6), (238, 4);
INSERT INTO "company_category" (company_id, category_id) VALUES (79, 7), (140, 4), (254, 3), (117, 14), (7, 13), (116, 7), (8, 7), (196, 5), (154, 7), (81, 9);
INSERT INTO "company_category" (company_id, category_id) VALUES (300, 5), (241, 5), (7, 7), (47, 7), (13, 11), (254, 3), (111, 7), (112, 2), (161, 8), (153, 11);
INSERT INTO "company_category" (company_id, category_id) VALUES (103, 10), (147, 11), (7, 4), (172, 5), (38, 11), (74, 3), (282, 2), (213, 13), (274, 10), (52, 12);
INSERT INTO "company_category" (company_id, category_id) VALUES (100, 7), (41, 14), (238, 5), (76, 3), (234, 12), (79, 5), (265, 5), (97, 11), (41, 8), (120, 9);
INSERT INTO "company_category" (company_id, category_id) VALUES (71, 5), (138, 14), (235, 6), (224, 8), (91, 7), (289, 6), (41, 4), (36, 2), (125, 7), (255, 14);
INSERT INTO "company_category" (company_id, category_id) VALUES (264, 9), (239, 11), (246, 7), (218, 3), (57, 10), (193, 12), (296, 12), (87, 12), (159, 10), (41, 5);
INSERT INTO "company_category" (company_id, category_id) VALUES (245, 4), (89, 14), (68, 11), (264, 2), (197, 12), (170, 4), (181, 4), (175, 5), (2, 2), (239, 3);

INSERT INTO "company_category" (company_id, category_id) VALUES (47, 8), (171, 14), (185, 6), (17, 12), (72, 2), (36, 2), (225, 4), (46, 6), (18, 10), (10, 4);
INSERT INTO "company_category" (company_id, category_id) VALUES (266, 12), (32, 10), (179, 14), (162, 4), (201, 6), (94, 8), (296, 12), (169, 2), (130, 2), (19, 8);
INSERT INTO "company_category" (company_id, category_id) VALUES (147, 5), (46, 12), (196, 2), (73, 2), (297, 3), (63, 2), (48, 4), (169, 13), (5, 3), (38, 8);
INSERT INTO "company_category" (company_id, category_id) VALUES (243, 9), (94, 4), (151, 10), (10, 3), (105, 12), (292, 14), (285, 7), (201, 10), (47, 11), (33, 6);
INSERT INTO "company_category" (company_id, category_id) VALUES (192, 8), (130, 8), (130, 6), (242, 10), (133, 5), (113, 5), (92, 10), (41, 8), (209, 11), (45, 8);
INSERT INTO "company_category" (company_id, category_id) VALUES (180, 3), (84, 7), (199, 8), (110, 10), (120, 10), (253, 2), (243, 4), (251, 6), (93, 5), (206, 12);
INSERT INTO "company_category" (company_id, category_id) VALUES (175, 14), (133, 13), (209, 14), (91, 14), (24, 11), (172, 13), (148, 6), (244, 5), (62, 14), (225, 6);
INSERT INTO "company_category" (company_id, category_id) VALUES (56, 4), (114, 3), (170, 13), (86, 14), (17, 10), (117, 4), (162, 4), (242, 9), (171, 9), (140, 11);
INSERT INTO "company_category" (company_id, category_id) VALUES (203, 3), (97, 8), (61, 13), (28, 6), (93, 9), (275, 3), (209, 10), (171, 2), (125, 8), (1, 13);
INSERT INTO "company_category" (company_id, category_id) VALUES (104, 4), (123, 13), (178, 8), (76, 14), (106, 3), (106, 11), (211, 7), (213, 9), (129, 3), (90, 10);

INSERT INTO "company_category" (company_id, category_id) VALUES (139, 2), (143, 12), (151, 6), (153, 14), (50, 3), (165, 11), (15, 7), (151, 10), (85, 9), (210, 14);
INSERT INTO "company_category" (company_id, category_id) VALUES (147, 2), (195, 10), (109, 4), (100, 9), (97, 2), (125, 2), (290, 2), (27, 8), (250, 5), (226, 13);
INSERT INTO "company_category" (company_id, category_id) VALUES (115, 7), (239, 3), (193, 6), (138, 12), (156, 3), (205, 13), (252, 5), (201, 10), (159, 12), (131, 14);
INSERT INTO "company_category" (company_id, category_id) VALUES (279, 12), (55, 2), (156, 5), (186, 7), (192, 14), (74, 5), (3, 5), (245, 11), (238, 13), (79, 4);
INSERT INTO "company_category" (company_id, category_id) VALUES (66, 10), (118, 13), (108, 9), (299, 5), (114, 14), (111, 14), (175, 5), (101, 6), (246, 10), (257, 2);
INSERT INTO "company_category" (company_id, category_id) VALUES (112, 10), (204, 10), (34, 5), (131, 12), (123, 7), (274, 5), (282, 9), (41, 5), (231, 10), (80, 10);
INSERT INTO "company_category" (company_id, category_id) VALUES (150, 14), (24, 14), (39, 7), (32, 14), (53, 6), (10, 5), (84, 9), (289, 14), (231, 7), (287, 12);
INSERT INTO "company_category" (company_id, category_id) VALUES (113, 2), (151, 10), (125, 11), (2, 4), (202, 4), (185, 10), (291, 2), (67, 6), (97, 8), (129, 10);
INSERT INTO "company_category" (company_id, category_id) VALUES (88, 10), (190, 4), (162, 10), (256, 9), (166, 11), (249, 13), (97, 11), (17, 3), (137, 9), (182, 2);
INSERT INTO "company_category" (company_id, category_id) VALUES (22, 13), (83, 7), (297, 8), (244, 9), (104, 5), (129, 11), (4, 11), (45, 4), (259, 14), (283, 3);