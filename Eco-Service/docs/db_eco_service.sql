-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : jeu. 04 mars 2021 à 20:07
-- Version du serveur :  8.0.23
-- Version de PHP : 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_eco_service`
--

-- --------------------------------------------------------

--
-- Structure de la table `ADDRESS`
--

CREATE TABLE `ADDRESS` (
  `id` varchar(36) NOT NULL,
  `label` varchar(32) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `country_id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(64) NOT NULL,
  `postal_code` varchar(16) NOT NULL,
  `street` varchar(255) NOT NULL,
  `street_number` int NOT NULL,
  `tips` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `ADDRESS`
--

INSERT INTO `ADDRESS` (`id`, `label`, `firstname`, `lastname`, `country_id`, `city`, `postal_code`, `street`, `street_number`, `tips`, `created_at`, `created_by_id`, `updated_at`, `deleted_at`) VALUES
('226271F5-9001-6F41-496A-AD62A112FEA2', 'amet', 'Jerome', 'Whitney', 'ES', 'Burns Lake', '7128', '453-9033 Turpis Av.', 7, NULL, '2022-02-18 17:23:55', '3C922259-472A-ACC8-C08E-4EE2A17C118C', NULL, NULL),
('3CF45085-0D96-DFBC-F8FF-C1B4067C73E0', 'Integer', 'Todd', 'Valdez', 'B', 'San Mauro Cilento', '240675', '5680 Nullam Avenue', 2, NULL, '2021-06-27 05:59:46', '976C1037-47B4-F1D9-9D5B-7C300F53C225', NULL, NULL),
('63410263-2440-867C-695B-E7046DF5AA7D', 'ac', 'Keaton', 'Barlow', 'FR', 'Buin', '192232', '6764 Non Ave', 1, NULL, '2020-11-25 02:50:26', '010B6A30-187A-FB17-21C2-787E3D5E7230', NULL, NULL),
('7EEDCD0F-7D33-998F-4A5F-6A89591198E5', 'Nunc', 'Jason', 'Kirby', 'AN', 'Scunthorpe', '3391', 'Ap #908-873 Duis Ave', 2, NULL, '2022-01-20 20:27:51', '3916A402-8867-9133-E0FA-74527B286B0F', NULL, NULL),
('8AC4E70E-E1A3-DE53-16CC-CC1AF214632D', 'magna.', 'Herman', 'Case', 'P', 'Avellino', '265356', 'P.O. Box 488, 917 In Street', 5, NULL, '2021-12-05 07:38:21', '91FE7A59-D808-B374-4772-C9105030C073', NULL, NULL),
('B6B5B305-1F71-D9EF-573C-ACB5EAED61B3', 'arcu', 'Lane', 'Preston', 'RU', 'Avesta', 'K2N 7M3', 'P.O. Box 473, 4676 Volutpat. Road', 6, NULL, '2021-01-22 15:16:35', 'E63526A0-23E1-8AD2-2E58-FBA933E5657C', NULL, NULL),
('D2FA892A-044B-4318-3404-54F96B89E899', 'lectus.', 'Dorian', 'Drake', 'S', 'Lüneburg', '613847', 'P.O. Box 463, 930 Justo St.', 4, NULL, '2020-03-11 08:49:54', 'C1E49AF1-7652-DB9D-C932-6B32C446A684', NULL, NULL),
('EBEFAB9B-DBE7-5675-9DC4-627CA4E7D719', 'imperdiet', 'Jameson', 'Dudley', 'ALL', 'Uikhoven', '629903', 'Ap #834-3215 Risus, Road', 8, NULL, '2020-05-25 18:35:22', '51803617-4DD9-3510-AEB8-9F7124676EFD', NULL, NULL),
('F0FDBDE9-F69C-E47C-E10F-3AE51909953B', 'adipiscing', 'Emmanuel', 'Alvarez', 'PB', 'Lokeren', '08763', 'Ap #625-1607 Tincidunt Rd.', 6, NULL, '2020-03-19 19:39:39', '8E13CAC1-F269-13AF-00A4-7F0A7E5DE791', NULL, NULL),
('F6A381E7-959C-5346-2DD0-E0C1879DCF7A', 'In', 'Jack', 'Jimenez', 'IT', 'Etterbeek', '7286', 'P.O. Box 800, 7734 Arcu. St.', 10, NULL, '2020-06-14 11:12:58', '0D6378E7-B152-7C91-420C-D9F9E58F4E8C', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `CATEGORY`
--

CREATE TABLE `CATEGORY` (
  `id` varchar(36) NOT NULL,
  `label` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `icon` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `CATEGORY`
--

INSERT INTO `CATEGORY` (`id`, `label`, `description`, `icon`) VALUES
('2A376755-99A5-5B5A-3223-CDCA7EAE7384', 'Environnement', '', 'Morin'),
('394A9B7D-963F-FF1F-032A-54DBBCD90ECD', 'Santé', '', 'Townsend'),
('40DE7E6D-4F48-15A2-A9AC-B1946680E367', 'Ecologique', '', 'Parks'),
('6F097637-6720-FFC5-21EC-BB00F17E944E', 'Exterieur', '', 'Larson'),
('8AF2A4D3-12AF-37E4-8D36-7ED720AE865C', 'Décoration', '', 'Morgan');

-- --------------------------------------------------------

--
-- Structure de la table `COUNTRY`
--

CREATE TABLE `COUNTRY` (
  `id` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `label` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `COUNTRY`
--

INSERT INTO `COUNTRY` (`id`, `label`) VALUES
('ALL', 'Allemagne '),
('AN', 'Angleterre '),
('B', 'Belgique'),
('ES', 'Espagne'),
('FR', 'France'),
('IT', 'Italie'),
('P', 'Portugal'),
('PB', 'Pays-Bas'),
('RU', 'Russie'),
('S', 'Suisse');

-- --------------------------------------------------------

--
-- Structure de la table `CUSTOMER`
--

CREATE TABLE `CUSTOMER` (
  `user_id` varchar(36) NOT NULL,
  `email_verified` tinyint(1) DEFAULT NULL,
  `company_name` varchar(128) DEFAULT NULL,
  `company_siret` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `CUSTOMER`
--

INSERT INTO `CUSTOMER` (`user_id`, `email_verified`, `company_name`, `company_siret`) VALUES
('010B6A30-187A-FB17-21C2-787E3D5E7230', 1, 'enim', '121288898-00004'),
('0D6378E7-B152-7C91-420C-D9F9E58F4E8C', 1, 'Nullam', '703531731-00007'),
('1E1ECC12-3810-6A27-CCF7-1FEB181B62AE', 0, NULL, NULL),
('28216C33-D777-804D-DCF1-43B832AC5120', 1, NULL, NULL),
('2FD21F0A-7177-3BB5-1C0E-9E55CBB5FBA4', 0, NULL, NULL),
('3916A402-8867-9133-E0FA-74527B286B0F', 0, 'lacus', '498451426-00007'),
('3C922259-472A-ACC8-C08E-4EE2A17C118C', 0, 'Cras', '191429323-00006'),
('40946B42-10C9-2064-EFBD-BC27BAC1F0F5', 0, NULL, NULL),
('4257E069-1BE4-223A-629A-40892EAB3364', 0, NULL, NULL),
('51803617-4DD9-3510-AEB8-9F7124676EFD', 0, 'cursus', '880667910-00009'),
('6CEAFE8D-3FD7-890A-B984-1AC62D4A7EA5', 1, NULL, NULL),
('8E13CAC1-F269-13AF-00A4-7F0A7E5DE791', 0, 'tristique', '340139526-00008'),
('91FE7A59-D808-B374-4772-C9105030C073', 1, 'vitae', '050821255-00002'),
('976C1037-47B4-F1D9-9D5B-7C300F53C225', 0, 'libero', '122183338-00005'),
('C1E49AF1-7652-DB9D-C932-6B32C446A684', 1, 'sagittis', '537936148-00007'),
('dba28fa8-6d58-4f5a-b158-eeadddbb1ea4', 0, NULL, NULL),
('E63526A0-23E1-8AD2-2E58-FBA933E5657C', 1, 'non,', '529798183-00008'),
('EA6242D1-A334-03F9-5DEC-E89CE8617FFA', 1, NULL, NULL),
('EC8B65D7-1A57-5A74-DD03-00CEA9591B1E', 0, NULL, NULL),
('EF6F7903-24FC-D8A5-30D9-AEC4FD3FD54C', 0, NULL, NULL),
('F114D6BF-6E79-EB65-1429-828520C1B4CF', 0, NULL, NULL),
('f815b136-93f2-4f26-8cc5-2535dd67cd5e', NULL, 'apple', '49849849849849494');

-- --------------------------------------------------------

--
-- Structure de la table `PICTURE`
--

CREATE TABLE `PICTURE` (
  `id` varchar(36) NOT NULL,
  `extension` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `size` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `PICTURE`
--

INSERT INTO `PICTURE` (`id`, `extension`, `size`) VALUES
('13B96ED9-26D6-F72F-B8A8-16D2C943082A', 'jfif', 17500),
('194F80A3-B481-B85C-1259-FEA901BCACE3', 'webp', 17500),
('1B3823A8-5981-D04A-27B5-01A44F185FDE', 'webp', 17500),
('1FEA50F6-83F9-C877-6E55-941D465D257C', 'jpg', 17500),
('2B611A71-E2F9-11EF-0167-7DAA57B41F54', 'webp', 17500),
('2B6B7C2C-16A2-29ED-70C0-37C90FE3D91A', 'jfif', 17500),
('306A080D-D4CC-A994-AC64-99BE5B858E9D', 'webp', 17500),
('32E3935F-87F5-6021-7762-223FF60834C7', 'webp', 17500),
('34565D18-3243-D4AE-272D-47657CF0DB10', 'jpg', 17500),
('34C0C605-A3B0-6744-8216-CA416B1EE43F', 'webp', 17500),
('35CDE8D1-C748-A9C0-2CE5-2A0D54DB8F5C', 'jpg', 17500),
('3D1B9976-AE1D-94F8-51A5-CCD1B1FCA64A', 'jpg', 17500),
('3FC98A32-AD32-A853-765B-9CFB28556EE4', 'jpg', 17500),
('3FF5220E-BD91-9F66-B1F4-009B33C062D9', 'webp', 17500),
('45CFDB0E-AC78-BBC4-D84D-CB73B7483A95', 'jpg', 17500),
('4CB4387B-BC2D-AB5B-433E-94137F2B994F', 'jpg', 17500),
('532B9965-C225-32E7-32DB-AAB293AB2EBD', 'jpg', 17500),
('5796522D-0A1F-D094-665B-9BABE4C5DB37', 'jpg', 17500),
('5EF2EEE3-79F6-9A35-AB63-E0F37D6D9B53', 'jpg', 17500),
('603CFA5F-DD1B-206D-8F22-46C92CD38E63', 'jpg', 17500),
('6E5E5F31-DA65-566A-F132-FF3AB4AA5716', 'jfif', 17500),
('752FADA8-2B3B-F132-0CAE-E0330CB00D28', 'jpg', 17500),
('827C95BA-3A89-E151-8A7C-775F3B0E86D0', 'jpeg', 17500),
('8D845204-6211-1107-9720-06636CB6F479', 'jfif', 17500),
('8F4C5E3A-CF44-0C0A-18D2-B08804A43A35', 'jpg', 17500),
('96C89BBC-AFF8-E52A-7553-BBCE63D50E8B', 'jpg', 17500),
('A7A54F3A-B9A4-0B7E-F938-5242118F8263', 'jpg', 17200),
('AEC2CF73-C398-89ED-575B-D14B9F40C357', 'jfif', 17500),
('B5739E00-6096-24CA-4D85-3592CF5D3871', 'webp', 17200),
('BCCED7C3-C02D-52FE-4414-E8F9CE818192', 'jpg', 17500),
('C79A174B-A21F-4155-107F-0EBFB3DA3F0F', 'jpg', 17200),
('D2B43A96-3E01-84A3-6934-EE177988771F', 'jpg', 17500),
('D5ABC953-1A48-7F48-E400-F4AA82C41B34', 'jfif', 17500),
('DD41DEC0-630A-AF45-06A9-00AFA9995531', 'webp', 17500),
('E4D85169-1B49-06BD-77AB-64FA21641979', 'jpg', 17200),
('E6C82184-C1D4-F699-3DE8-8223292A48DF', 'jpg', 17500),
('E7D8D638-0C3B-E7A1-BB7B-B5AEF8D5F87A', 'jpg', 17200),
('F079B336-98BB-5441-AFED-7DDE6CDE3E99', 'jpg', 17500),
('F56C1179-8851-C7ED-477C-3F12DF2C72BA', 'jpg', 17500),
('FAFEA52C-8B05-0601-EC51-55F96160B794', 'jpg', 17500);

-- --------------------------------------------------------

--
-- Structure de la table `PRODUCT`
--

CREATE TABLE `PRODUCT` (
  `id` varchar(36) NOT NULL,
  `label` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `stock` int NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` varchar(36) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` varchar(36) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `PRODUCT`
--

INSERT INTO `PRODUCT` (`id`, `label`, `description`, `price`, `stock`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `deleted_by_id`) VALUES
('22374BD5-E5A9-9206-E815-2D1FBFB6CBFC', 'Brosse à dent en bambou', 'Vous aimeriez faire quelques choses quotidiennement pour diminuer votre impact sur l\'environnement ?<br><br>\r\n\r\nN\'attendez plus et faites le changement que vous désirez voir dans le monde aujourd\'hui! Grace à cette brosse dent vous allez faire le premier geste.<br><br>\r\n\r\n<strong>Cette brosse à dent permet de réduire l\'impact des produits plastiques dans le monde.</strong><br><br>\r\n\r\nLe manche conçu en bambou (non consommé par les pandas) et les soies en Nylon6 (fabriqué à partir de bio plastique) la rend recyclable (le manche est même compostable!). Pour cela il vous suffit de couper la tête que vous pouvez recycler et de mettre le corps au composteur, dans la cheminée ou bien même vous en servir comme tuteur pour vos plantes.<br><br>\r\n\r\n<strong>Les poils moyens souples vous permettront un brossage tout en douceur et en prenant soin de vos gencives.</strong><br><br>\r\n\r\nDe plus le bambou est naturellement anti-microbien, anti-fongique et anti-bactérien.<br><br>\r\n\r\nElle reste parfaitement utilisable avec votre dentifrice habituel.<br><br>\r\n\r\nGrâce à elle vous allez garder une parfaite hygiène Bucco dentaire, tout en diminuant votre impact en déchet plastique sur la planète. \r\n\r\n', 25, 85, '2020-10-21 04:36:35', 'EA6242D1-A334-03F9-5DEC-E89CE8617FFA', '2021-03-03 13:37:19', 'dba28fa8-6d58-4f5a-b158-eeadddbb1ea4', NULL, NULL),
('5A70C0B4-0863-B4B0-CEF1-DDBD0AC0257A', 'La bouteille en verre recyclé', 'La bouteille Édition, en verre borosilicate (600 ml), vous aidera à boire plus d\'eau où que vous soyez tout en limitant votre empreinte carbone. Elle est disponible dans l\'ensemble des couleurs de notre gamme.<br><br>\r\n\r\nChacune de nos bouteilles sont fournis avec un bouchon à vis en bambou spécialement conçu pour éliminer tout risque de fuite. Parfait pour vous accompagner partout.<br><br>\r\n\r\nChaque bouteille est livrée avec un manchon thermique de protection en Néoprène. Ainsi, vous pouvez conserver votre boisson au frais et en toute sécurité. La petite poignée ajoute une touche de confort pour prendre en main votre bouteille où que vous alliez.<br><br>\r\n\r\nVous avez plusieurs choix de bouteille en verre recyclé donc faite le bon choix !', 25, 145, '2021-02-16 07:39:02', 'EF6F7903-24FC-D8A5-30D9-AEC4FD3FD54C', '2020-05-13 00:32:01', NULL, NULL, NULL),
('5FC7E636-6A3E-8CB3-CA92-5F300919FCD7', 'Carnet en papier recyclé', 'Carnet en papier recyclé \r\nDescription: A6 calepin en papier recyclé avec ruban couleur assortie et bande élastique. 96 pages de papier vierge.<br><br>\r\n\r\nTaille: 14x9x1,4 cm\r\nPoids: 0.113 Kg<br><br>\r\n\r\nParfait pour les étudiants ou les personnes qui souhaite prendre des notes !<br><br>', 8.99, 2500, '2021-07-30 23:23:33', '28216C33-D777-804D-DCF1-43B832AC5120', '2020-12-01 01:26:40', NULL, NULL, NULL),
('86B0496F-7BA4-8C1B-2899-2B3134305BE9', 'Bol en Kraft', 'Ce bol en Kraft d\'une contenance de 750 ml est idéal pour vos salades composées de tailles moyennes. Ce produit est écoresponsable. Achat par Lot de 10<br><br>\r\n\r\nDimensions (mm) : Ø 150 X H 60\r\n\r\nContenance (ml) : 75 cl\r\n\r\nCouleur : Brun\r\n\r\nEpaisseur : 320 g/m²\r\n\r\nMatière : Kraft<br><br>\r\n\r\nCe bol est réutilisable parfait pour éviter de jeter du plastique ou emballage cela va réduire votre consommation de plastique !!', 12.5, 54, '2021-04-18 02:08:36', '6CEAFE8D-3FD7-890A-B984-1AC62D4A7EA5', '2021-09-25 15:19:19', NULL, NULL, NULL),
('94BEE6B9-25C6-DB13-0E55-B31165AB2E2B', 'Paillasson écologique', 'Gardez vos planchers et votre conscience propres avec ce paillasson écologique de Hug Rug fabriqué à partir de contenu recyclé.<br><br>\r\n\r\nLe design moucheté dans une couleur ardoise fraîche, non seulement se marie bien dans n\'importe quelle maison, mais aide à dissimuler la boue et la saleté afin de ne pas avoir besoin d\'être lavé aussi souvent.<br><br>\r\n\r\nEn piégeant jusqu\'à 95% de la saleté, de la boue et de la poussière, les fibres de coton sont parfaites pour pénétrer dans la bande de roulement des chaussures et des pattes pour aider à protéger vos tapis, et peuvent supporter jusqu\'à 3 fois son propre poids en eau aidant à éviter les glissades et les trébuchements.\r\nSols humides.\r\nConvient pour votre couloir, votre véranda, votre cuisine et même à l\'extérieur, ce tapis peut même être lavé à 30 ° C pour le garder comme neuf.<br><br>\r\n\r\nDisponible en plusieurs formes et colories !\r\n', 38, 541, '2021-06-03 23:06:37', '1E1ECC12-3810-6A27-CCF7-1FEB181B62AE', '2021-08-09 01:45:53', NULL, NULL, NULL),
('954F3E81-AE49-3467-A407-230D728D4F02', 'Poubelle tri sélectif', 'La Poubelle de tri sélectif Eco-Tri Évolution Trio est un conteneur de 160 litres qui dispose de 3 bacs de tri sélectif.<br><br>\r\n\r\nLes ouvertures moulées de ce conteneur peuvent comporter trois couleurs différentes et il est également possible d’y afficher du texte ou des symboles supplémentaires.<br><br>\r\n\r\nCet article ultra-polyvalent s’adapte parfaitement aux locaux et au programme de tri sélectif de votre organisation.\r\n', 450, 132, '2020-07-10 14:38:07', '40946B42-10C9-2064-EFBD-BC27BAC1F0F5', '2021-11-28 09:35:24', NULL, NULL, NULL),
('B0EFFB77-7EA2-8BA4-8DBF-12BAFB74CD8E', 'Gobelets kraft ', 'Gobelets kraft beiges simple paroi de 6oz laminage intérieur en PLA biodégradable et compostable D. 72 mm x H. 82 mm\r\nRéférence376KV\r\nQuantité par colis 1 000\r\n\r\nMatièreCarton\r\nContenance180 ml\r\nFormeRond\r\nCouleurBeige\r\nPersonnalisableOui\r\nDimensionØ 72 mm H 82 mm\r\nRecyclableOui (sauf métalisés)\r\nUsageChaud ou froid\r\n\r\nGobelets en Kraft réutilisable pour réduire votre consommation de plastique et l\'achat de verre en plastique !\r\n', 70, 15482, '2021-05-22 12:47:35', 'EC8B65D7-1A57-5A74-DD03-00CEA9591B1E', '2021-07-06 16:29:55', NULL, NULL, NULL),
('B5F1AEF1-3BB0-4111-861C-AD9830503419', 'Ballon de football ', 'Ce ballon décoratif a été construit entièrement en bidons récupérés et fabriqué artisanalement en Indonésie.<br><br>\r\n\r\nÀ 100% dans l\'air du temps: éthique et écologique, sa fabrication emploie des artisans et les matières premières connaissent une seconde vie.<br><br>\r\n\r\nType de ballon : Football\r\nMatériaux : Carton, Bidon<br><br>\r\n\r\nLe ballon est disponible en plusieurs choix de colories ! \r\n', 100, 400, '2020-03-15 01:40:01', '2FD21F0A-7177-3BB5-1C0E-9E55CBB5FBA4', '2020-11-01 23:50:18', NULL, NULL, NULL),
('D7BDFD9F-7DBF-C336-65E4-60A28787C343', 'Coussin en coton recyclé', 'Coussin en coton recyclé et coton beiges avec pompons 30x50<br><br>\r\n\r\nGraphique et authentique, le coussin  est plein de charme avec son jeu de tissage en coton blanc et jute et ses petits pompons aux coins !<br><br>\r\n\r\nEt il est confectionné avec 50% de coton recyclé, pour craquer de façon responsable...<br><br>\r\n\r\nGarnissage : 100% polyester\r\nHousse : 50% jute, 50% coton recyclé\r\nLe jute est une fibre végétale avec des variations de couleurs d’un produit à l’autre.<br><br>\r\n\r\nLe coussin est disponible en plusieurs colories et sous plusieurs formes !', 250, 7420, '2020-03-06 19:16:40', 'F114D6BF-6E79-EB65-1429-828520C1B4CF', '2020-05-06 06:30:29', NULL, NULL, NULL),
('F4A5D68B-43F8-BA86-D696-0483659B7545', 'Paille d\'acier inoxydable', 'Lot de 8 pailles en acier inoxydable poli avec un pinceau paille.<br><br>\r\n\r\nFabriqué en acier inoxydable 18/10, beaucoup plus sûr que la réutilisation de plastique.<br><br>\r\n\r\nDesign compact - Coffre-fort, 100% non toxique, respectueux de l\'environnement\r\nRéutilisables pailles pour vos besoins bar/les fêtes, confortable avec brosse nettoyer.<br><br>\r\n\r\nPratique au sein de fêtes de famille, les pique-niques d\'extérieur, les randonnées, les excursions, les restaurants et d\'autres groupes à utiliser.<br><br>\r\n\r\nLa paille vous fera moins consommer du plastique et surtout elle devient un objet écoresponsable pour notre planète.', 15.99, 9080, '2021-10-22 13:16:02', '4257E069-1BE4-223A-629A-40892EAB3364', '2020-07-10 23:46:33', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `PRODUCT_CATEGORY`
--

CREATE TABLE `PRODUCT_CATEGORY` (
  `product_id` varchar(36) NOT NULL,
  `category_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `PRODUCT_CATEGORY`
--

INSERT INTO `PRODUCT_CATEGORY` (`product_id`, `category_id`) VALUES
('5A70C0B4-0863-B4B0-CEF1-DDBD0AC0257A', '2A376755-99A5-5B5A-3223-CDCA7EAE7384'),
('5FC7E636-6A3E-8CB3-CA92-5F300919FCD7', '2A376755-99A5-5B5A-3223-CDCA7EAE7384'),
('86B0496F-7BA4-8C1B-2899-2B3134305BE9', '2A376755-99A5-5B5A-3223-CDCA7EAE7384'),
('94BEE6B9-25C6-DB13-0E55-B31165AB2E2B', '2A376755-99A5-5B5A-3223-CDCA7EAE7384'),
('954F3E81-AE49-3467-A407-230D728D4F02', '2A376755-99A5-5B5A-3223-CDCA7EAE7384'),
('B0EFFB77-7EA2-8BA4-8DBF-12BAFB74CD8E', '2A376755-99A5-5B5A-3223-CDCA7EAE7384'),
('F4A5D68B-43F8-BA86-D696-0483659B7545', '2A376755-99A5-5B5A-3223-CDCA7EAE7384'),
('22374BD5-E5A9-9206-E815-2D1FBFB6CBFC', '394A9B7D-963F-FF1F-032A-54DBBCD90ECD'),
('22374BD5-E5A9-9206-E815-2D1FBFB6CBFC', '40DE7E6D-4F48-15A2-A9AC-B1946680E367'),
('5A70C0B4-0863-B4B0-CEF1-DDBD0AC0257A', '40DE7E6D-4F48-15A2-A9AC-B1946680E367'),
('5FC7E636-6A3E-8CB3-CA92-5F300919FCD7', '40DE7E6D-4F48-15A2-A9AC-B1946680E367'),
('86B0496F-7BA4-8C1B-2899-2B3134305BE9', '40DE7E6D-4F48-15A2-A9AC-B1946680E367'),
('94BEE6B9-25C6-DB13-0E55-B31165AB2E2B', '40DE7E6D-4F48-15A2-A9AC-B1946680E367'),
('954F3E81-AE49-3467-A407-230D728D4F02', '40DE7E6D-4F48-15A2-A9AC-B1946680E367'),
('B0EFFB77-7EA2-8BA4-8DBF-12BAFB74CD8E', '40DE7E6D-4F48-15A2-A9AC-B1946680E367'),
('B5F1AEF1-3BB0-4111-861C-AD9830503419', '40DE7E6D-4F48-15A2-A9AC-B1946680E367'),
('D7BDFD9F-7DBF-C336-65E4-60A28787C343', '40DE7E6D-4F48-15A2-A9AC-B1946680E367'),
('F4A5D68B-43F8-BA86-D696-0483659B7545', '40DE7E6D-4F48-15A2-A9AC-B1946680E367'),
('94BEE6B9-25C6-DB13-0E55-B31165AB2E2B', '6F097637-6720-FFC5-21EC-BB00F17E944E'),
('954F3E81-AE49-3467-A407-230D728D4F02', '6F097637-6720-FFC5-21EC-BB00F17E944E'),
('954F3E81-AE49-3467-A407-230D728D4F02', '8AF2A4D3-12AF-37E4-8D36-7ED720AE865C'),
('B5F1AEF1-3BB0-4111-861C-AD9830503419', '8AF2A4D3-12AF-37E4-8D36-7ED720AE865C'),
('D7BDFD9F-7DBF-C336-65E4-60A28787C343', '8AF2A4D3-12AF-37E4-8D36-7ED720AE865C'),
('F4A5D68B-43F8-BA86-D696-0483659B7545', '8AF2A4D3-12AF-37E4-8D36-7ED720AE865C');

-- --------------------------------------------------------

--
-- Structure de la table `PRODUCT_PICTURE`
--

CREATE TABLE `PRODUCT_PICTURE` (
  `product_id` varchar(36) NOT NULL,
  `picture_id` varchar(36) NOT NULL,
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `PRODUCT_PICTURE`
--

INSERT INTO `PRODUCT_PICTURE` (`product_id`, `picture_id`, `position`) VALUES
('22374BD5-E5A9-9206-E815-2D1FBFB6CBFC', '194F80A3-B481-B85C-1259-FEA901BCACE3', 578),
('22374BD5-E5A9-9206-E815-2D1FBFB6CBFC', '1B3823A8-5981-D04A-27B5-01A44F185FDE', 578),
('22374BD5-E5A9-9206-E815-2D1FBFB6CBFC', '32E3935F-87F5-6021-7762-223FF60834C7', 493),
('5A70C0B4-0863-B4B0-CEF1-DDBD0AC0257A', '2B611A71-E2F9-11EF-0167-7DAA57B41F54', 578),
('5A70C0B4-0863-B4B0-CEF1-DDBD0AC0257A', '306A080D-D4CC-A994-AC64-99BE5B858E9D', 578),
('5A70C0B4-0863-B4B0-CEF1-DDBD0AC0257A', '34C0C605-A3B0-6744-8216-CA416B1EE43F', 1566),
('5FC7E636-6A3E-8CB3-CA92-5F300919FCD7', '35CDE8D1-C748-A9C0-2CE5-2A0D54DB8F5C', 728),
('5FC7E636-6A3E-8CB3-CA92-5F300919FCD7', '3FC98A32-AD32-A853-765B-9CFB28556EE4', 578),
('5FC7E636-6A3E-8CB3-CA92-5F300919FCD7', '3FF5220E-BD91-9F66-B1F4-009B33C062D9', 578),
('86B0496F-7BA4-8C1B-2899-2B3134305BE9', '45CFDB0E-AC78-BBC4-D84D-CB73B7483A95', 1219),
('86B0496F-7BA4-8C1B-2899-2B3134305BE9', '4CB4387B-BC2D-AB5B-433E-94137F2B994F', 578),
('86B0496F-7BA4-8C1B-2899-2B3134305BE9', '532B9965-C225-32E7-32DB-AAB293AB2EBD', 578),
('94BEE6B9-25C6-DB13-0E55-B31165AB2E2B', '5796522D-0A1F-D094-665B-9BABE4C5DB37', 578),
('94BEE6B9-25C6-DB13-0E55-B31165AB2E2B', '603CFA5F-DD1B-206D-8F22-46C92CD38E63', 578),
('94BEE6B9-25C6-DB13-0E55-B31165AB2E2B', 'A7A54F3A-B9A4-0B7E-F938-5242118F8263', 97),
('954F3E81-AE49-3467-A407-230D728D4F02', '752FADA8-2B3B-F132-0CAE-E0330CB00D28', 578),
('954F3E81-AE49-3467-A407-230D728D4F02', '8D845204-6211-1107-9720-06636CB6F479', 578),
('954F3E81-AE49-3467-A407-230D728D4F02', 'B5739E00-6096-24CA-4D85-3592CF5D3871', 674),
('B0EFFB77-7EA2-8BA4-8DBF-12BAFB74CD8E', '8F4C5E3A-CF44-0C0A-18D2-B08804A43A35', 578),
('B0EFFB77-7EA2-8BA4-8DBF-12BAFB74CD8E', '96C89BBC-AFF8-E52A-7553-BBCE63D50E8B', 578),
('B0EFFB77-7EA2-8BA4-8DBF-12BAFB74CD8E', 'C79A174B-A21F-4155-107F-0EBFB3DA3F0F', 1253),
('B5F1AEF1-3BB0-4111-861C-AD9830503419', 'AEC2CF73-C398-89ED-575B-D14B9F40C357', 578),
('B5F1AEF1-3BB0-4111-861C-AD9830503419', 'BCCED7C3-C02D-52FE-4414-E8F9CE818192', 578),
('B5F1AEF1-3BB0-4111-861C-AD9830503419', 'E4D85169-1B49-06BD-77AB-64FA21641979', 759),
('D7BDFD9F-7DBF-C336-65E4-60A28787C343', 'D2B43A96-3E01-84A3-6934-EE177988771F', 578),
('D7BDFD9F-7DBF-C336-65E4-60A28787C343', 'D5ABC953-1A48-7F48-E400-F4AA82C41B34', 578),
('D7BDFD9F-7DBF-C336-65E4-60A28787C343', 'E7D8D638-0C3B-E7A1-BB7B-B5AEF8D5F87A', 235),
('F4A5D68B-43F8-BA86-D696-0483659B7545', 'DD41DEC0-630A-AF45-06A9-00AFA9995531', 578),
('F4A5D68B-43F8-BA86-D696-0483659B7545', 'E6C82184-C1D4-F699-3DE8-8223292A48DF', 578),
('F4A5D68B-43F8-BA86-D696-0483659B7545', 'FAFEA52C-8B05-0601-EC51-55F96160B794', 1433);

-- --------------------------------------------------------

--
-- Structure de la table `PURCHASE`
--

CREATE TABLE `PURCHASE` (
  `id` varchar(36) NOT NULL,
  `customer_id` varchar(36) NOT NULL,
  `status_id` int NOT NULL,
  `address_id` varchar(36) NOT NULL,
  `stripe_session_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `canceled_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `PURCHASE`
--

INSERT INTO `PURCHASE` (`id`, `customer_id`, `status_id`, `address_id`, `stripe_session_id`, `created_at`, `canceled_at`) VALUES
('0F4ACDDA-03F5-5A8F-D109-BB9E5A8D4B40', '0D6378E7-B152-7C91-420C-D9F9E58F4E8C', 2, '3CF45085-0D96-DFBC-F8FF-C1B4067C73E0', NULL, '2021-09-17 11:09:03', '2021-03-18 08:40:32'),
('1D40D3DE-4ED8-561E-3326-5FA1D204A8D6', '976C1037-47B4-F1D9-9D5B-7C300F53C225', 2, 'EBEFAB9B-DBE7-5675-9DC4-627CA4E7D719', NULL, '2020-03-06 17:11:11', '2021-04-21 14:39:00'),
('2867A0FD-3E43-622E-9948-2F187476D15B', '8E13CAC1-F269-13AF-00A4-7F0A7E5DE791', 2, 'B6B5B305-1F71-D9EF-573C-ACB5EAED61B3', NULL, '2021-12-13 14:37:12', '2021-11-27 03:51:30'),
('3B989870-BDFE-A9B0-B325-0EF54832D3D0', 'E63526A0-23E1-8AD2-2E58-FBA933E5657C', 2, 'F6A381E7-959C-5346-2DD0-E0C1879DCF7A', NULL, '2021-05-22 10:37:43', '2022-02-13 12:04:52'),
('42470DEC-D50C-D64D-6252-20CB1CE194DA', '3C922259-472A-ACC8-C08E-4EE2A17C118C', 2, '7EEDCD0F-7D33-998F-4A5F-6A89591198E5', NULL, '2021-10-24 22:14:25', '2021-03-29 13:36:29'),
('50458EDB-A6EE-8FF8-79D7-770DD71A7081', 'C1E49AF1-7652-DB9D-C932-6B32C446A684', 1, 'F0FDBDE9-F69C-E47C-E10F-3AE51909953B', NULL, '2021-12-11 12:41:37', '2020-11-29 07:02:12'),
('7DCF1761-24A3-6B7E-A9B2-D4BBC164CF89', '3916A402-8867-9133-E0FA-74527B286B0F', 1, '63410263-2440-867C-695B-E7046DF5AA7D', NULL, '2020-11-05 13:32:53', '2020-06-13 12:57:57'),
('BF78B6A3-6AD6-07C8-596B-84F5FC9DA0CA', '010B6A30-187A-FB17-21C2-787E3D5E7230', 1, '226271F5-9001-6F41-496A-AD62A112FEA2', NULL, '2021-05-02 20:38:52', '2020-03-14 21:08:27'),
('E0613E0C-D1AC-23F2-9569-F739A9D60851', '51803617-4DD9-3510-AEB8-9F7124676EFD', 1, '8AC4E70E-E1A3-DE53-16CC-CC1AF214632D', NULL, '2020-09-15 12:39:06', '2020-07-07 05:45:43'),
('ED91280A-8CD9-39DF-7F8E-BF627D3A66A2', '91FE7A59-D808-B374-4772-C9105030C073', 1, 'D2FA892A-044B-4318-3404-54F96B89E899', NULL, '2021-07-12 00:16:27', '2021-09-04 09:19:08');

-- --------------------------------------------------------

--
-- Structure de la table `PURCHASE_PRODUCT`
--

CREATE TABLE `PURCHASE_PRODUCT` (
  `purchase_id` varchar(36) NOT NULL,
  `product_id` varchar(36) NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `PURCHASE_PRODUCT`
--

INSERT INTO `PURCHASE_PRODUCT` (`purchase_id`, `product_id`, `quantity`) VALUES
('0F4ACDDA-03F5-5A8F-D109-BB9E5A8D4B40', '22374BD5-E5A9-9206-E815-2D1FBFB6CBFC', 69),
('1D40D3DE-4ED8-561E-3326-5FA1D204A8D6', '5A70C0B4-0863-B4B0-CEF1-DDBD0AC0257A', 944),
('2867A0FD-3E43-622E-9948-2F187476D15B', '5FC7E636-6A3E-8CB3-CA92-5F300919FCD7', 279),
('3B989870-BDFE-A9B0-B325-0EF54832D3D0', '86B0496F-7BA4-8C1B-2899-2B3134305BE9', 275),
('42470DEC-D50C-D64D-6252-20CB1CE194DA', '94BEE6B9-25C6-DB13-0E55-B31165AB2E2B', 948),
('50458EDB-A6EE-8FF8-79D7-770DD71A7081', '954F3E81-AE49-3467-A407-230D728D4F02', 996),
('7DCF1761-24A3-6B7E-A9B2-D4BBC164CF89', 'B5F1AEF1-3BB0-4111-861C-AD9830503419', 547),
('BF78B6A3-6AD6-07C8-596B-84F5FC9DA0CA', 'B0EFFB77-7EA2-8BA4-8DBF-12BAFB74CD8E', 422),
('E0613E0C-D1AC-23F2-9569-F739A9D60851', 'D7BDFD9F-7DBF-C336-65E4-60A28787C343', 994),
('ED91280A-8CD9-39DF-7F8E-BF627D3A66A2', 'F4A5D68B-43F8-BA86-D696-0483659B7545', 796);

-- --------------------------------------------------------

--
-- Structure de la table `PURCHASE_STATUS`
--

CREATE TABLE `PURCHASE_STATUS` (
  `id` int NOT NULL,
  `label` varchar(16) NOT NULL,
  `color` varchar(6) NOT NULL,
  `icon` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `PURCHASE_STATUS`
--

INSERT INTO `PURCHASE_STATUS` (`id`, `label`, `color`, `icon`) VALUES
(1, 'Non Payé', 'green', 'fas fa-money-check-alt'),
(2, 'Payé', 'orange', 'fas fa-truck');

-- --------------------------------------------------------

--
-- Structure de la table `REQUEST`
--

CREATE TABLE `REQUEST` (
  `id` varchar(36) NOT NULL,
  `service_id` varchar(36) NOT NULL,
  `customer_id` varchar(36) NOT NULL,
  `status_id` int NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL,
  `canceled_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `REQUEST`
--

INSERT INTO `REQUEST` (`id`, `service_id`, `customer_id`, `status_id`, `message`, `created_at`, `canceled_at`) VALUES
('0B7BE3A8-5CFA-A6B6-2DD2-1FA79DA4239C', 'B5EAE087-49C1-9ECA-9D55-68A10084E1D2', '91FE7A59-D808-B374-4772-C9105030C073', 2, 'Mauris magna. Duis dignissim tempor arcu. Vestibulum ut eros non', '2021-04-14 23:22:43', '2021-12-08 04:41:51'),
('298D4000-B8CE-384D-61F1-91F558653275', '844B0DB4-44AB-9FA3-362F-FEC7E88E815F', '0D6378E7-B152-7C91-420C-D9F9E58F4E8C', 2, 'Vivamus molestie dapibus ligula. Aliquam erat volutpat. Nulla dignissim. Maecenas', '2021-12-04 03:50:45', '2021-09-15 08:56:13'),
('2FC6E42A-3E67-4B30-2D94-F02E2D1C4DAB', '98C25B94-F8A0-9700-F61E-01D67DF38CF3', '3C922259-472A-ACC8-C08E-4EE2A17C118C', 1, 'nunc id enim. Curabitur massa. Vestibulum accumsan neque et nunc.', '2020-05-15 06:29:01', '2021-03-13 00:52:50'),
('56759e4d-4525-4f01-9174-0886fbd0bc78', '9A8AC136-A5E7-3535-ECAA-CC1526F860EA', 'f815b136-93f2-4f26-8cc5-2535dd67cd5e', 1, 'Je souhaite recevoir un devis voir un RDV avec votre service pour une installation dans nos locaux', '2021-03-04 17:47:02', NULL),
('7D51CAD0-5EAD-9E7B-B68E-E278423095D9', 'ED46591C-0241-C90C-9DFF-9BBC7E8F1645', 'C1E49AF1-7652-DB9D-C932-6B32C446A684', 2, 'ut odio vel est tempor bibendum. Donec felis orci, adipiscing', '2022-01-01 14:56:59', '2020-11-11 04:12:43'),
('7FBAB0BE-0CE7-1101-2065-EC3AC83BC694', '9A8AC136-A5E7-3535-ECAA-CC1526F860EA', '51803617-4DD9-3510-AEB8-9F7124676EFD', 2, 'erat eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor.', '2021-03-07 18:40:38', '2021-11-17 14:15:06'),
('82699B9B-6A28-5435-29EA-1D50CB413642', '9AD96636-F3A0-11DA-2990-B70BB53D5342', '8E13CAC1-F269-13AF-00A4-7F0A7E5DE791', 1, 'adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis', '2021-03-24 13:44:47', '2021-04-20 15:11:54'),
('90380411-F3D3-A280-D010-782066FF986E', '4A65C8FA-780A-E802-53E3-DE17DFF1090D', '010B6A30-187A-FB17-21C2-787E3D5E7230', 1, 'adipiscing ligula. Aenean gravida nunc sed pede. Cum sociis natoque', '2020-07-05 14:25:41', '2020-11-27 20:35:45'),
('BEDF8855-C4A6-80FB-06AE-CC7F3E2BE563', 'D039A107-EA8C-027D-D327-0CB25009066E', '976C1037-47B4-F1D9-9D5B-7C300F53C225', 2, 'dolor dapibus gravida. Aliquam tincidunt, nunc ac mattis ornare, lectus', '2021-02-27 02:33:27', '2021-11-15 02:09:43'),
('C6EAF80B-991B-1EB3-8401-F95098DC8B9E', 'F6C35639-6219-F2A6-33EB-9B3D574E2A16', 'E63526A0-23E1-8AD2-2E58-FBA933E5657C', 2, 'blandit viverra. Donec tempus, lorem fringilla ornare placerat, orci lacus', '2020-12-28 11:47:11', '2021-01-12 16:32:59'),
('D29296F3-7F51-FDBD-51D1-63B58DC7FA92', '8D438A28-C7A7-C858-96B6-537B0E0907B5', '3916A402-8867-9133-E0FA-74527B286B0F', 2, 'sapien. Aenean massa. Integer vitae nibh. Donec est mauris, rhoncus', '2020-12-14 14:59:55', '2021-05-06 04:05:31');

-- --------------------------------------------------------

--
-- Structure de la table `REQUEST_STATUS`
--

CREATE TABLE `REQUEST_STATUS` (
  `id` int NOT NULL,
  `label` varchar(16) NOT NULL,
  `color` varchar(6) NOT NULL,
  `icon` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `REQUEST_STATUS`
--

INSERT INTO `REQUEST_STATUS` (`id`, `label`, `color`, `icon`) VALUES
(1, 'Non traité', 'red', 'far fa-envelope'),
(2, 'Traité', 'green', 'far fa-envelope-open');

-- --------------------------------------------------------

--
-- Structure de la table `SERVICE`
--

CREATE TABLE `SERVICE` (
  `id` varchar(36) NOT NULL,
  `label` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by_id` varchar(36) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by_id` varchar(36) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by_id` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `SERVICE`
--

INSERT INTO `SERVICE` (`id`, `label`, `description`, `created_at`, `created_by_id`, `updated_at`, `updated_by_id`, `deleted_at`, `deleted_by_id`) VALUES
('4A65C8FA-780A-E802-53E3-DE17DFF1090D', 'Eco-Panneau', 'Installez des panneaux solaires avec l\'offre Eco-Panneau de Eco-Service et faites des économies.<br><br>\r\n\r\nEn produisant votre propre électricité solaire , réalisez jusqu’à 750€ d’économies par an sur votre facture d’électricité pendant toute la durée de vie de votre installation. Et en plus vous bénéficiez d’aides de l’Etat.<br><br>\r\n\r\nVous produisez de l’électricité de source 100% renouvelable.<br><br>\r\n\r\nVous participez activement à la transition énergétique puisque l’énergie  produite à partir de la lumière du soleil n’émet pas de CO2 et elle est de source renouvelable.<br><br>\r\n\r\n<strong>C’est simple !</strong><br>\r\nEco-Panneau vous livre un projet clé en main (installation, démarches administratives, garanties, …) Votre projet solaire avec Eco-Panneau ! Une étude personnalisée et gratuite !<br><br>\r\n\r\nIl vous suffit de remplir le formulaire en ligne et nous vous recontactons dans les 48 heures. Le bureau d’étude solaire d’Eco-Panneau réalisera alors une étude détaillée et gratuite. Vous connaitrez directement les coûts et les économies pour votre projet solaire.<br><br>\r\n\r\nVotre installation solaire installée en 1 journée seulement\r\nUn installateur de votre région, partenaire Eco-Panneau et certifié RGE QualiPV,  interviendra chez vous pour poser les panneaux solaires sur votre toiture.<br><br>\r\n\r\n<strong>Eco-Panneau vous accompagne tout au long du projet.</strong>\r\nEco-Panneau réalise pour vous l’ensemble des démarches administratives et s’assure du bon déroulé du projet. Vous bénéficiez d’un interlocuteur Eco-Panneau dédié et une fois votre installation mise en service, vous pouvez suivre votre production et autoconsommation dans votre espace client Eco-Panneau.', '2020-11-07 06:49:11', '2FD21F0A-7177-3BB5-1C0E-9E55CBB5FBA4', '2021-01-06 10:44:28', NULL, NULL, NULL),
('844B0DB4-44AB-9FA3-362F-FEC7E88E815F', 'Eco-Eau', 'Recyclage d\'eau usées grâce à un appareil eco-friendly qui va venir récupérer votre eau usée et votre eau non utilisé pour la filtrer dans des bacs qui vont avoir un processus de filtrage pour que l\'eau devienne potable.<br><br>\r\n\r\n<strong>Grâce à Eco-Eau économiser jusqu\'à 541$ par an sur votre facture !</strong>\r\n', '2020-06-15 06:56:17', 'EC8B65D7-1A57-5A74-DD03-00CEA9591B1E', '2021-07-27 22:15:58', NULL, NULL, NULL),
('8D438A28-C7A7-C858-96B6-537B0E0907B5', 'Eco-Clim', 'Installation de chauffage et climatisation intelligent, Eco-Clim vous propose un système intelligent qui va gérer votre climatisation et votre chauffage pour éviter les surplus d\'énergie consommé, vous pouvez donc réaliser une énorme réduction de coût à l\'année sur votre facture.<br><br>\r\n\r\nNos techniciens Eco-Clim viendront faire une constations de vos locaux et un plan sera établie en 48h pour vos projet !  ', '2021-10-18 10:58:47', '1E1ECC12-3810-6A27-CCF7-1FEB181B62AE', '2021-11-18 03:48:02', NULL, NULL, NULL),
('98C25B94-F8A0-9700-F61E-01D67DF38CF3', 'Bio-Nature', 'Plantation de verdure pour vos entreprise et aussi pour les parcs et <strong>les forêts</strong> !!!<br><br>\r\n\r\nOui Bio-Nature et le premier service au monde à planter des arbres et de la verdure partout dans le monde, grâce à Bio-Nature l\'amélioration de la flore et en constante évolution mais sans vous rien ne serait possible en contribuant à vos projet vous améliorer l\'écosystème de notre planète et vous faites preuve de solidarité envers nos partenaire et nos salariés ! ', '2020-11-04 10:40:31', '40946B42-10C9-2064-EFBD-BC27BAC1F0F5', '2020-10-17 10:15:38', NULL, NULL, NULL),
('9A8AC136-A5E7-3535-ECAA-CC1526F860EA', 'Eco-Tri', 'Installation de poubelle à tri sélectif pour vos entreprise, Eco-Tri propose de venir installer des poubelles de tri sélectif recyclé pour que le recyclage se passe mieux !<br><br>\r\n\r\nDes techniciens viendront gratuitement faire l\'état des lieu pour ensuite pouvoir concevoir des plan d\'installation de ces poubelles de tri sélectif, après l\'achat et l\'installation de vos poubelles de tri sélectif nos techniciens s\'occuperont de mettre en relation vos locaux avec les éboueurs de votre régions qui viendront 3 fois par semaines récupérer vos déchets pour ensuite les déposer dans une usine de recyclage !', '2021-06-10 17:47:56', 'F114D6BF-6E79-EB65-1429-828520C1B4CF', '2020-08-19 07:41:34', NULL, NULL, NULL),
('9AD96636-F3A0-11DA-2990-B70BB53D5342', 'Eco-Borne', 'Installation de Borne électrique pour véhicule à domicile, Eco-Borne propose de venir installer des borne électrique de rechargement pour vos véhicules le principe et de réduire l\'émission de Co2.<br><br>\r\n\r\nGrâce au borne électrique de rechargement uniquement les véhicules électrique pourront recharger leur batterie. Si vous avez une entreprise avec des voitures de fonctions électrique nous sommes le service qu\'il vous faut, nos techniciens feront l\'état des lieux pour pouvoir faire un plan de construction et d\'installation en seulement 48h avec Eco-Borne améliorer le quotidien de notre planète !   ', '2021-05-06 22:18:23', 'EA6242D1-A334-03F9-5DEC-E89CE8617FFA', '2021-06-25 02:20:00', NULL, NULL, NULL),
('B5EAE087-49C1-9ECA-9D55-68A10084E1D2', 'Eco-Dechet', 'Ramassage de déchet autour de votre domicile ou votre entreprise, Eco-Dechet travail avec Eco-Tri c\'est à dire que le service Eco-Dechet récupère les déchets dans les poubelles de tri sélectif de Eco-Tri et ensuite Eco-Dechet va venir déposer les déchets dans une usine de recyclage pour pouvoir réutiliser les déchets dans la vie de tout les jours !<br><br>\r\n\r\nVos cartons, plastiques, papiers, verres servira à la création de bouteilles, pailles, boites, gobelets etc etc avec Eco-Dechet améliorer quotidiennement la vie du tri sélectif et de notre planète !', '2020-05-27 11:48:20', '6CEAFE8D-3FD7-890A-B984-1AC62D4A7EA5', '2021-07-09 01:13:00', NULL, NULL, NULL),
('D039A107-EA8C-027D-D327-0CB25009066E', 'Eco-Mer', 'Ramassage de déchet en mer autour de vos ports, stations pétrolières et stations de mer avec Eco-Mer sauver les animaux marins et nos eaux de mer qui sert à nous désaltérer.<br><br>\r\n\r\n<strong>Oui c\'est possible de nettoyer la mer des déchets humains, oui c\'est possible de rendre la vie meilleurs aux animaux marins, oui c\'est possible grâce à vous qui faite un devis pour venir nettoyer la mer des déchets avec nos bateaux électrique qui ne pollue pas la mer.</strong><br><br>\r\n\r\nUne estimation du temps de travail sera faite sur la zone que nos équipes devra nettoyer bien sur si cette activité vous tiens à cœur vous pouvez de vous même participer avec Eco-Mer changer le monde marin !  ', '2020-03-12 21:45:03', '4257E069-1BE4-223A-629A-40892EAB3364', '2021-04-28 21:48:53', NULL, NULL, NULL),
('ED46591C-0241-C90C-9DFF-9BBC7E8F1645', 'Eco-Recyclage', 'Récupération et recyclage de vos déchet avec Eco-Recyclage vos déchets seront recyclé et réutilisé pour de la fabrication écoresponsable.<br><br>\r\n\r\nnotre services Eco-recyclage travail avec Eco-Tri et Eco-Dechet, Eco-Dechet récupère les déchets dans les poubelles installé par Eco-Tri et nous les amènes dans nos usines pour que nous puissions commencer à les recyclé, vous pouvez faire appel à nos service si vous voulez vous débarrasser de vos déchets et vous pouvez aussi faire appelle à notre service Eco-Recyclage pour pouvoir acheter des produits écoresponsable recyclé !', '2021-06-17 02:47:46', 'EF6F7903-24FC-D8A5-30D9-AEC4FD3FD54C', '2020-08-20 17:50:14', NULL, NULL, NULL),
('F6C35639-6219-F2A6-33EB-9B3D574E2A16', 'Bio-Potager', 'Création de potager de fruit et légume à domicile ou entreprise oui Eco-Potager vous installe des potager de légumes et de fruit, vous en avez marre des pesticides des produits chimiques sur les légumes et fruits ?<br><br>\r\n\r\nAvec Eco-Potager crée votre propre potager avec des produits et des graines de haute qualité certifié par FEL Partenariat.<br><br>\r\n\r\nLe FeL Partenariat est une démarche entièrement fondée sur l\'autocontrôle agréée par les pouvoirs publics (DGCCRF) et accompagnée par les fédérations professionnelles.<br><br>\r\n\r\nIl s\'agit d\'un système de management de la qualité dédié au commerce des fruits et légumes. Eco-Potager vous propose donc de manger 5 fruits et légumes par jours et de permettre de réduire l\'achats de plastiques et d\'emballages. Nos techniciens viendront faire l\'état des lieux dans vos locaux pour pouvoir établir des plans 78h plus tard, avec Eco-Potager manger sainement !', '2021-12-26 14:19:17', '28216C33-D777-804D-DCF1-43B832AC5120', '2021-11-29 15:31:03', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `SERVICE_PICTURE`
--

CREATE TABLE `SERVICE_PICTURE` (
  `service_id` varchar(36) NOT NULL,
  `picture_id` varchar(36) NOT NULL,
  `position` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `SERVICE_PICTURE`
--

INSERT INTO `SERVICE_PICTURE` (`service_id`, `picture_id`, `position`) VALUES
('4A65C8FA-780A-E802-53E3-DE17DFF1090D', '13B96ED9-26D6-F72F-B8A8-16D2C943082A', 750),
('844B0DB4-44AB-9FA3-362F-FEC7E88E815F', '1FEA50F6-83F9-C877-6E55-941D465D257C', 750),
('8D438A28-C7A7-C858-96B6-537B0E0907B5', '2B6B7C2C-16A2-29ED-70C0-37C90FE3D91A', 750),
('98C25B94-F8A0-9700-F61E-01D67DF38CF3', '34565D18-3243-D4AE-272D-47657CF0DB10', 750),
('9A8AC136-A5E7-3535-ECAA-CC1526F860EA', '3D1B9976-AE1D-94F8-51A5-CCD1B1FCA64A', 750),
('9AD96636-F3A0-11DA-2990-B70BB53D5342', '5EF2EEE3-79F6-9A35-AB63-E0F37D6D9B53', 750),
('B5EAE087-49C1-9ECA-9D55-68A10084E1D2', '6E5E5F31-DA65-566A-F132-FF3AB4AA5716', 750),
('D039A107-EA8C-027D-D327-0CB25009066E', '827C95BA-3A89-E151-8A7C-775F3B0E86D0', 750),
('ED46591C-0241-C90C-9DFF-9BBC7E8F1645', 'F079B336-98BB-5441-AFED-7DDE6CDE3E99', 750),
('F6C35639-6219-F2A6-33EB-9B3D574E2A16', 'F56C1179-8851-C7ED-477C-3F12DF2C72BA', 750);

-- --------------------------------------------------------

--
-- Structure de la table `USER`
--

CREATE TABLE `USER` (
  `id` varchar(36) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `birthdate` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `roles` varchar(32) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by_id` varchar(36) DEFAULT NULL,
  `deleted_for` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `USER`
--

INSERT INTO `USER` (`id`, `firstname`, `lastname`, `birthdate`, `email`, `password`, `phone`, `roles`, `created_at`, `updated_at`, `deleted_at`, `deleted_by_id`, `deleted_for`) VALUES
('010B6A30-187A-FB17-21C2-787E3D5E7230', 'Oliver', 'Hunter', '2020-04-10', 'ante@risusQuisquelibero.ca', 'egestas', '05 75 87 11 92', '[\"ROLE_CUSTOMER\"]', '2021-04-11 00:04:45', '2021-04-11 00:04:45', NULL, NULL, NULL),
('0D6378E7-B152-7C91-420C-D9F9E58F4E8C', 'Daquan', 'Miranda', '2020-09-15', 'sed.consequat@duiFusce.edu', 'quam', '09 62 18 87 68', '[\"ROLE_CUSTOMER\"]', '2021-07-04 11:25:31', '2021-07-04 11:25:31', NULL, NULL, NULL),
('1E1ECC12-3810-6A27-CCF7-1FEB181B62AE', 'Armando', 'Scott', '2020-07-14', 'Phasellus.fermentum.convallis@vitaepurus.net', 'nunc', '09 02 76 67 31', '[\"ROLE_SUPERADMIN\"]', '2021-01-04 00:09:32', '2021-01-04 00:09:32', NULL, NULL, NULL),
('28216C33-D777-804D-DCF1-43B832AC5120', 'Patrick', 'Neal', '2020-08-31', 'nascetur@justosit.com', 'tellus', '03 73 32 05 95', '[\"ROLE_SALESMAN\"]', '2020-03-25 19:41:54', '2020-03-25 19:41:54', NULL, NULL, NULL),
('2FD21F0A-7177-3BB5-1C0E-9E55CBB5FBA4', 'Dorian', 'Solis', '2020-05-16', 'nisl.Quisque@fringilla.ca', 'luctus', '06 47 46 99 25', '[\"ROLE_SUPERADMIN\"]', '2020-11-21 14:56:20', '2020-11-21 14:56:20', NULL, NULL, NULL),
('3916A402-8867-9133-E0FA-74527B286B0F', 'Trevor', 'Buchanan', '2022-02-14', 'elit.fermentum.risus@acarcu.org', 'fames', '02 08 53 14 07', '[\"ROLE_CUSTOMER\"]', '2020-06-09 05:24:35', '2020-06-09 05:24:35', NULL, NULL, NULL),
('3C922259-472A-ACC8-C08E-4EE2A17C118C', 'Zeus', 'Klein', '2021-11-09', 'enim.non.nisi@lectusantedictum.com', 'cursus.', '04 40 41 10 15', '[\"ROLE_CUSTOMER\"]', '2020-11-24 13:35:23', '2020-11-24 13:35:23', NULL, NULL, NULL),
('40946B42-10C9-2064-EFBD-BC27BAC1F0F5', 'Yoshio', 'Dillard', '2020-05-04', 'nulla.at.sem@gravida.co.uk', 'posuere', '04 52 54 55 16', '[\"ROLE_SUPERADMIN\"]', '2021-03-30 01:15:33', '2021-03-30 01:15:33', NULL, NULL, NULL),
('4257E069-1BE4-223A-629A-40892EAB3364', 'Omar', 'Santos', '2021-12-30', 'mattis@luctusipsum.co.uk', 'Duis', '06 40 69 11 36', '[\"ROLE_SALESMAN\"]', '2021-07-28 05:44:37', '2021-07-28 05:44:37', NULL, NULL, NULL),
('51803617-4DD9-3510-AEB8-9F7124676EFD', 'Tiger', 'Parrish', '2020-03-30', 'Suspendisse.sagittis.Nullam@convallis.org', 'magna', '06 76 64 84 37', '[\"ROLE_CUSTOMER\"]', '2020-09-11 20:47:24', '2020-09-11 20:47:24', NULL, NULL, NULL),
('6CEAFE8D-3FD7-890A-B984-1AC62D4A7EA5', 'Bert', 'Ortega', '2021-11-30', 'aliquet.metus.urna@nonegestasa.net', 'lorem', '04 95 60 75 96', '[\"ROLE_SALESMAN\"]', '2021-03-26 15:32:19', '2021-03-26 15:32:19', NULL, NULL, NULL),
('6CF880BF-00B3-4BCE-38E8-36765409932E', 'Duncan', 'Myers', '2022-01-17', 'per.inceptos.hymenaeos@etnetuset.ca', 'sed', '07 97 86 75 68', '[\"ROLE_SUPERADMIN\"]', '2022-01-28 02:20:26', '2022-01-28 02:20:26', NULL, NULL, NULL),
('791DFC5B-EE12-493F-F977-544F39E83253', 'Odysseus', 'Lindsey', '2021-10-07', 'Donec@Duis.org', 'massa', '09 84 76 97 18', '[\"ROLE_SUPERADMIN\"]', '2021-02-17 19:26:33', '2021-02-17 19:26:33', NULL, NULL, NULL),
('8E13CAC1-F269-13AF-00A4-7F0A7E5DE791', 'Keegan', 'Brewer', '2020-08-06', 'dolor.sit@vehicula.co.uk', 'dictum.', '09 13 92 83 33', '[\"ROLE_CUSTOMER\"]', '2020-10-08 18:11:19', '2020-10-08 18:11:19', NULL, NULL, NULL),
('91FE7A59-D808-B374-4772-C9105030C073', 'Oliver', 'Copeland', '2020-10-27', 'lobortis.risus.In@Morbi.co.uk', 'nec', '04 54 79 19 26', '[\"ROLE_CUSTOMER\"]', '2022-01-01 04:08:30', '2022-01-01 04:08:30', NULL, NULL, NULL),
('976C1037-47B4-F1D9-9D5B-7C300F53C225', 'Eric', 'Oliver', '2020-08-07', 'rhoncus.id.mollis@dignissim.org', 'Aliquam', '07 60 68 62 05', '[\"ROLE_CUSTOMER\"]', '2021-09-07 04:39:24', '2021-09-07 04:39:24', NULL, NULL, NULL),
('AD09AEF3-F662-9AE1-6AC3-F3F27105283C', 'Griffith', 'William', '2021-06-23', 'dui.nec@interdumligula.edu', 'lorem', '05 92 90 33 04', '[\"ROLE_SUPERADMIN\"]', '2020-06-14 20:09:07', '2020-06-14 20:09:07', NULL, NULL, NULL),
('B7407408-86F1-1AE4-9468-B0A786407773', 'Reece', 'Doyle', '2020-10-01', 'dolor@natoquepenatibuset.edu', 'nulla', '06 96 85 75 60', '[\"ROLE_SALESMAN\"]', '2021-07-21 07:09:53', '2021-07-21 07:09:53', NULL, NULL, NULL),
('BF4C2315-AFB3-437C-397B-3E407CD99C08', 'Gabriel', 'Schmidt', '2020-10-08', 'Nam.nulla.magna@mattis.edu', 'ipsum', '07 51 17 94 98', '[\"ROLE_SUPERADMIN\"]', '2022-02-16 07:33:09', '2022-02-16 07:33:09', NULL, NULL, NULL),
('C1E49AF1-7652-DB9D-C932-6B32C446A684', 'Dominic', 'Velez', '2021-10-24', 'leo@eulacusQuisque.co.uk', 'auctor.', '05 38 36 26 85', '[\"ROLE_CUSTOMER\"]', '2021-10-23 05:23:35', '2021-10-23 05:23:35', NULL, NULL, NULL),
('CFDB0584-DE77-DC40-FDC8-4A527810009E', 'Keith', 'Abbott', '2021-03-10', 'egestas.Sed@urnaUt.edu', 'In', '04 18 07 57 24', '[\"ROLE_SALESMAN\"]', '2020-06-13 23:39:52', '2020-06-13 23:39:52', NULL, NULL, NULL),
('D07760AB-6EFD-26E7-A064-8E71677C2425', 'Odysseus', 'Conner', '2021-08-22', 'sed.pede.Cum@magna.com', 'massa', '09 07 97 23 61', '[\"ROLE_SALESMAN\"]', '2020-05-02 20:25:00', '2020-05-02 20:25:00', NULL, NULL, NULL),
('D76E81DD-8451-8307-6AF9-00D512BA14B2', 'Kane', 'Duncan', '2021-08-16', 'In.condimentum@laoreetposuereenim.ca', 'cursus', '09 58 82 84 10', '[\"ROLE_SALESMAN\"]', '2020-08-02 15:50:32', '2020-08-02 15:50:32', NULL, NULL, NULL),
('DB02D2F1-D7CB-5D2F-7C6D-8C12602B8A0C', 'Gareth', 'Stanton', '2020-03-23', 'nisi.sem@miAliquam.co.uk', 'Ut', '08 98 21 41 01', '[\"ROLE_SUPERADMIN\"]', '2021-08-02 16:32:19', '2021-08-02 16:32:19', NULL, NULL, NULL),
('dba28fa8-6d58-4f5a-b158-eeadddbb1ea4', 'Eco-Service', 'Superadmin', '2021-02-01', 'so_baron@hotmail.com', '$argon2id$v=19$m=65536,t=4,p=1$9IkKF7/4aqZdiqN36K935Q$i7GY4BVMFgTqUPLouxo7ojOZiQvYA9QQRlQb1dILGgE', '0626073302', '[\"ROLE_SUPERADMIN\"]', '2021-02-01 20:22:37', NULL, NULL, NULL, NULL),
('DDBD5D0D-C718-47D4-4D6F-5D7CC3A2F3AC', 'Berk', 'Joyce', '2020-09-04', 'Cras.convallis.convallis@temporarcuVestibulum.net', 'quis', '06 53 51 14 97', '[\"ROLE_SUPERADMIN\"]', '2020-12-08 16:28:40', '2020-12-08 16:28:40', NULL, NULL, NULL),
('E63526A0-23E1-8AD2-2E58-FBA933E5657C', 'Lucius', 'Richmond', '2020-07-07', 'dui.augue.eu@idliberoDonec.edu', 'blandit.', '03 76 15 78 27', '[\"ROLE_CUSTOMER\"]', '2021-05-09 01:39:07', '2021-05-09 01:39:07', NULL, NULL, NULL),
('EA6242D1-A334-03F9-5DEC-E89CE8617FFA', 'Daquan', 'Lara', '2021-12-04', 'elit.erat@egetipsumSuspendisse.co.uk', 'mollis.', '02 41 88 25 99', '[\"ROLE_SUPERADMIN\"]', '2021-10-18 17:35:47', '2021-10-18 17:35:47', NULL, NULL, NULL),
('EC8B65D7-1A57-5A74-DD03-00CEA9591B1E', 'Colby', 'Stuart', '2020-08-06', 'posuere.enim@amet.net', 'ac', '05 50 71 13 76', '[\"ROLE_SALESMAN\"]', '2021-02-28 14:04:48', '2021-02-28 14:04:48', NULL, NULL, NULL),
('EF6F7903-24FC-D8A5-30D9-AEC4FD3FD54C', 'Zachary', 'Hinton', '2021-05-06', 'neque.Nullam@Nunclectuspede.org', 'Nam', '04 66 26 68 49', '[\"ROLE_SALESMAN\"]', '2020-05-02 17:03:22', '2020-05-02 17:03:22', NULL, NULL, NULL),
('F114D6BF-6E79-EB65-1429-828520C1B4CF', 'Noble', 'Durham', '2021-04-25', 'fames@mauris.ca', 'tempor', '05 40 08 16 73', '[\"ROLE_SALESMAN\"]', '2020-05-28 19:41:07', '2020-05-28 19:41:07', NULL, NULL, NULL),
('f815b136-93f2-4f26-8cc5-2535dd67cd5e', 'testdusite', 'site', '2010-06-02', 'test@outlook.fr', '$argon2id$v=19$m=65536,t=4,p=1$Jo3MkOmGkAs9pLSIx2OCKw$3AybjHwf5g20jvpZUY9z/zuNbdtMvHMJUgPEgFg2Juc', '418498469416', '[\"ROLE_CUSTOMER\"]', '2021-03-04 17:44:59', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `WORKER`
--

CREATE TABLE `WORKER` (
  `user_id` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `WORKER`
--

INSERT INTO `WORKER` (`user_id`) VALUES
('1E1ECC12-3810-6A27-CCF7-1FEB181B62AE'),
('28216C33-D777-804D-DCF1-43B832AC5120'),
('2FD21F0A-7177-3BB5-1C0E-9E55CBB5FBA4'),
('40946B42-10C9-2064-EFBD-BC27BAC1F0F5'),
('4257E069-1BE4-223A-629A-40892EAB3364'),
('6CEAFE8D-3FD7-890A-B984-1AC62D4A7EA5'),
('dba28fa8-6d58-4f5a-b158-eeadddbb1ea4'),
('EA6242D1-A334-03F9-5DEC-E89CE8617FFA'),
('EC8B65D7-1A57-5A74-DD03-00CEA9591B1E'),
('EF6F7903-24FC-D8A5-30D9-AEC4FD3FD54C'),
('F114D6BF-6E79-EB65-1429-828520C1B4CF');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ADDRESS`
--
ALTER TABLE `ADDRESS`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `created_by_id` (`created_by_id`);

--
-- Index pour la table `CATEGORY`
--
ALTER TABLE `CATEGORY`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `COUNTRY`
--
ALTER TABLE `COUNTRY`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD PRIMARY KEY (`user_id`);

--
-- Index pour la table `PICTURE`
--
ALTER TABLE `PICTURE`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `PRODUCT`
--
ALTER TABLE `PRODUCT`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by_id` (`created_by_id`),
  ADD KEY `updated_by_id` (`updated_by_id`),
  ADD KEY `deleted_by_id` (`deleted_by_id`);

--
-- Index pour la table `PRODUCT_CATEGORY`
--
ALTER TABLE `PRODUCT_CATEGORY`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Index pour la table `PRODUCT_PICTURE`
--
ALTER TABLE `PRODUCT_PICTURE`
  ADD PRIMARY KEY (`product_id`,`picture_id`),
  ADD KEY `picture_id` (`picture_id`);

--
-- Index pour la table `PURCHASE`
--
ALTER TABLE `PURCHASE`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `address_id` (`address_id`);

--
-- Index pour la table `PURCHASE_PRODUCT`
--
ALTER TABLE `PURCHASE_PRODUCT`
  ADD PRIMARY KEY (`purchase_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `PURCHASE_STATUS`
--
ALTER TABLE `PURCHASE_STATUS`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `REQUEST`
--
ALTER TABLE `REQUEST`
  ADD PRIMARY KEY (`id`),
  ADD KEY `service_id` (`service_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Index pour la table `REQUEST_STATUS`
--
ALTER TABLE `REQUEST_STATUS`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `SERVICE`
--
ALTER TABLE `SERVICE`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by_id` (`created_by_id`),
  ADD KEY `updated_by_id` (`updated_by_id`),
  ADD KEY `deleted_by_id` (`deleted_by_id`);

--
-- Index pour la table `SERVICE_PICTURE`
--
ALTER TABLE `SERVICE_PICTURE`
  ADD PRIMARY KEY (`service_id`,`picture_id`),
  ADD KEY `picture_id` (`picture_id`);

--
-- Index pour la table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted_by_id` (`deleted_by_id`);

--
-- Index pour la table `WORKER`
--
ALTER TABLE `WORKER`
  ADD PRIMARY KEY (`user_id`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ADDRESS`
--
ALTER TABLE `ADDRESS`
  ADD CONSTRAINT `ADDRESS_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `COUNTRY` (`id`),
  ADD CONSTRAINT `ADDRESS_ibfk_2` FOREIGN KEY (`created_by_id`) REFERENCES `CUSTOMER` (`user_id`);

--
-- Contraintes pour la table `CUSTOMER`
--
ALTER TABLE `CUSTOMER`
  ADD CONSTRAINT `CUSTOMER_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`);

--
-- Contraintes pour la table `PRODUCT`
--
ALTER TABLE `PRODUCT`
  ADD CONSTRAINT `PRODUCT_ibfk_1` FOREIGN KEY (`created_by_id`) REFERENCES `WORKER` (`user_id`),
  ADD CONSTRAINT `PRODUCT_ibfk_2` FOREIGN KEY (`updated_by_id`) REFERENCES `WORKER` (`user_id`),
  ADD CONSTRAINT `PRODUCT_ibfk_3` FOREIGN KEY (`deleted_by_id`) REFERENCES `WORKER` (`user_id`);

--
-- Contraintes pour la table `PRODUCT_CATEGORY`
--
ALTER TABLE `PRODUCT_CATEGORY`
  ADD CONSTRAINT `PRODUCT_CATEGORY_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `PRODUCT` (`id`),
  ADD CONSTRAINT `PRODUCT_CATEGORY_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `CATEGORY` (`id`);

--
-- Contraintes pour la table `PRODUCT_PICTURE`
--
ALTER TABLE `PRODUCT_PICTURE`
  ADD CONSTRAINT `PRODUCT_PICTURE_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `PRODUCT` (`id`),
  ADD CONSTRAINT `PRODUCT_PICTURE_ibfk_2` FOREIGN KEY (`picture_id`) REFERENCES `PICTURE` (`id`);

--
-- Contraintes pour la table `PURCHASE`
--
ALTER TABLE `PURCHASE`
  ADD CONSTRAINT `PURCHASE_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `CUSTOMER` (`user_id`),
  ADD CONSTRAINT `PURCHASE_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `PURCHASE_STATUS` (`id`),
  ADD CONSTRAINT `PURCHASE_ibfk_3` FOREIGN KEY (`address_id`) REFERENCES `ADDRESS` (`id`);

--
-- Contraintes pour la table `PURCHASE_PRODUCT`
--
ALTER TABLE `PURCHASE_PRODUCT`
  ADD CONSTRAINT `PURCHASE_PRODUCT_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `PURCHASE` (`id`),
  ADD CONSTRAINT `PURCHASE_PRODUCT_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `PRODUCT` (`id`);

--
-- Contraintes pour la table `REQUEST`
--
ALTER TABLE `REQUEST`
  ADD CONSTRAINT `REQUEST_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `SERVICE` (`id`),
  ADD CONSTRAINT `REQUEST_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `CUSTOMER` (`user_id`),
  ADD CONSTRAINT `REQUEST_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `REQUEST_STATUS` (`id`);

--
-- Contraintes pour la table `SERVICE`
--
ALTER TABLE `SERVICE`
  ADD CONSTRAINT `SERVICE_ibfk_1` FOREIGN KEY (`created_by_id`) REFERENCES `WORKER` (`user_id`),
  ADD CONSTRAINT `SERVICE_ibfk_2` FOREIGN KEY (`updated_by_id`) REFERENCES `WORKER` (`user_id`),
  ADD CONSTRAINT `SERVICE_ibfk_3` FOREIGN KEY (`deleted_by_id`) REFERENCES `WORKER` (`user_id`);

--
-- Contraintes pour la table `SERVICE_PICTURE`
--
ALTER TABLE `SERVICE_PICTURE`
  ADD CONSTRAINT `SERVICE_PICTURE_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `SERVICE` (`id`),
  ADD CONSTRAINT `SERVICE_PICTURE_ibfk_2` FOREIGN KEY (`picture_id`) REFERENCES `PICTURE` (`id`);

--
-- Contraintes pour la table `USER`
--
ALTER TABLE `USER`
  ADD CONSTRAINT `USER_ibfk_1` FOREIGN KEY (`deleted_by_id`) REFERENCES `WORKER` (`user_id`);

--
-- Contraintes pour la table `WORKER`
--
ALTER TABLE `WORKER`
  ADD CONSTRAINT `WORKER_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `USER` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
