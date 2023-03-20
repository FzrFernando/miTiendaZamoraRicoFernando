-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: mysqlDawes2:3306
-- Tiempo de generación: 20-03-2023 a las 08:29:49
-- Versión del servidor: 5.7.22
-- Versión de PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `miTiendaZamoraRicoFernando`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Categoria`
--

CREATE TABLE `Categoria` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `description` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Categoria`
--

INSERT INTO `Categoria` (`id`, `name`, `description`) VALUES
(1, 'Refrescos', 'Bebidas refrescantes'),
(2, 'Comida', 'Todos los alimentos'),
(3, 'Alcohol', 'Bebidas con porcentaje de alcohol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Compra`
--

CREATE TABLE `Compra` (
  `idUsuario` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `codProduct` int(11) NOT NULL,
  `amount` int(9) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `datePurchase` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Producto`
--

CREATE TABLE `Producto` (
  `codProduct` int(11) NOT NULL,
  `name` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `description` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  `category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Producto`
--

INSERT INTO `Producto` (`codProduct`, `name`, `description`, `stock`, `price`, `category`) VALUES
(1, 'Irish Cream - Butterscotch', 'Ezy Change Mophandle', 100, '23.15', 1),
(2, 'Octopus', 'Basil - Primerba, Paste', 100, '71.85', 2),
(3, 'Petit Baguette', 'Pesto - Primerba, Paste', 100, '52.91', 3),
(4, 'Pie Shells 10', 'Brandy Apricot', 100, '78.73', 1),
(5, 'Salami - Genova', 'Coconut - Creamed, Pure', 100, '15.20', 2),
(6, 'Peach - Fresh', 'Nantucket - Orange Mango Cktl', 100, '66.31', 3),
(7, 'Wine - Periguita Fonseca', 'Pastry - French Mini Assorted', 100, '92.63', 1),
(8, 'Muffin Mix - Oatmeal', 'Cheese - Mozzarella', 100, '5.86', 2),
(9, 'Potatoes - Peeled', 'Lemonade - Pineapple Passion', 100, '60.08', 3),
(10, 'The Pop Shoppe - Black Cherry', 'Tahini Paste', 100, '60.98', 1),
(11, 'Container - Clear 32 Oz', 'Beef - Cow Feet Split', 100, '48.62', 2),
(12, 'Wine - White, Ej Gallo', 'Foil - Round Foil', 100, '80.27', 3),
(13, 'Bacardi Limon', 'Madeira', 100, '32.27', 1),
(14, 'Fish - Halibut, Cold Smoked', 'Lemonade - Pineapple Passion', 100, '41.89', 2),
(15, 'Swordfish Loin Portions', 'Soup - Campbells Chili Veg', 100, '3.98', 3),
(16, 'Bag Clear 10 Lb', 'Wakami Seaweed', 100, '85.53', 1),
(17, 'Pork - Chop, Frenched', 'Wine - Ruffino Chianti Classico', 100, '41.61', 2),
(18, 'Milk - 1%', 'Pears - Bartlett', 100, '14.20', 3),
(19, 'Wine - Riesling Alsace Ac 2001', 'Lemonade - Island Tea, 591 Ml', 100, '35.74', 1),
(20, 'Tea - Camomele', 'Lamb Leg - Bone - In Nz', 100, '84.13', 2),
(21, 'Rambutan', 'Soup - Knorr, Chicken Noodle', 100, '67.54', 3),
(22, 'Bagel - Everything', 'Pie Box - Cello Window 2.5', 100, '20.53', 1),
(23, 'Yeast - Fresh, Fleischman', 'Sugar - Crumb', 100, '29.97', 2),
(24, 'Red Currants', 'Sea Bass - Whole', 100, '24.38', 3),
(25, 'Ice Cream - Turtles Stick Bar', 'Chocolate - Pistoles, White', 100, '91.01', 1),
(26, 'Skirt - 22 Foot', 'Jameson - Irish Whiskey', 100, '55.32', 2),
(27, 'Energy Drink', 'Wine - Niagara,vqa Reisling', 100, '18.61', 3),
(28, 'Muffin - Banana Nut Individual', 'Carrots - Purple, Organic', 100, '59.62', 1),
(29, 'Arrowroot', 'Nut - Almond, Blanched, Ground', 100, '3.68', 2),
(30, 'Cocktail Napkin Blue', 'Apple - Macintosh', 100, '17.77', 3),
(31, 'Cut Wakame - Hanawakaba', 'Dried Cherries', 100, '84.79', 1),
(32, 'Lobster - Base', 'Cheese - Feta', 100, '79.59', 2),
(33, 'Chocolate - Dark', 'Soup - Campbells', 100, '29.96', 3),
(34, 'Puree - Passion Fruit', 'Cheese - Mascarpone', 100, '7.27', 1),
(35, 'Cognac - Courvaisier', 'Plate Pie Foil', 100, '87.41', 2),
(36, 'Crab - Meat', 'Veal - Brisket, Provimi,bnls', 100, '22.96', 3),
(37, 'Lamb - Leg, Diced', 'Cornish Hen', 100, '44.95', 1),
(38, 'Wine - Alsace Gewurztraminer', 'Bread Sour Rolls', 100, '83.44', 2),
(39, 'Tart Shells - Sweet, 2', 'Ham - Cooked Bayonne Tinned', 100, '9.27', 3),
(40, 'Kellogs Raisan Bran Bars', 'Island Oasis - Mango Daiquiri', 100, '41.32', 1),
(41, 'Cookie Dough - Chocolate Chip', 'Couscous', 100, '15.41', 2),
(42, 'Mini - Vol Au Vents', 'Shrimp - 100 / 200 Cold Water', 100, '17.63', 3),
(43, 'Wine - Segura Viudas Aria Brut', 'Asparagus - Mexican', 100, '81.72', 1),
(44, 'Carbonated Water - Blackberry', 'Seedlings - Buckwheat, Organic', 100, '75.11', 2),
(45, 'Sage Derby', 'Flour - Masa De Harina Mexican', 100, '67.54', 3),
(46, 'Bread - Italian Corn Meal Poly', 'Crab - Dungeness, Whole, live', 100, '66.26', 1),
(47, 'Garlic - Elephant', 'Spinach - Baby', 100, '98.02', 2),
(48, 'Tart Shells - Barquettes, Savory', 'Energy Drink - Franks Original', 100, '14.35', 3),
(49, 'Pie Filling - Apple', 'Mushroom - Chantrelle, Fresh', 100, '87.37', 1),
(50, 'Cheese - Cream Cheese', 'Chocolate - Mi - Amere Semi', 100, '83.42', 2),
(51, 'Carrots - Mini, Stem On', 'Salmon - Sockeye Raw', 100, '73.35', 3),
(52, 'Compound - Pear', 'Dates', 100, '45.52', 1),
(53, 'Cheese - Fontina', 'Cheese - Oka', 100, '71.54', 2),
(54, 'Thyme - Lemon, Fresh', 'Mousse - Mango', 100, '40.29', 3),
(55, 'Coffee - Espresso', 'Lettuce - Iceberg', 100, '27.01', 1),
(56, 'Dehydrated Kelp Kombo', 'Soup - Knorr, Chicken Gumbo', 100, '97.90', 2),
(57, 'Chocolate - Semi Sweet', 'Kiwi Gold Zespri', 100, '34.06', 3),
(58, 'Club Soda - Schweppes, 355 Ml', 'Pork - European Side Bacon', 100, '27.59', 1),
(59, 'Cafe Royale', 'Schnappes Peppermint - Walker', 100, '49.69', 2),
(60, 'Cloves - Whole', 'Melon - Watermelon, Seedless', 100, '58.46', 3),
(61, 'Onions Granulated', 'Filling - Mince Meat', 100, '55.88', 1),
(62, 'Hog / Sausage Casing - Pork', 'Calypso - Pineapple Passion', 100, '93.25', 2),
(63, 'Cookie Dough - Double', 'Kirsch - Schloss', 100, '68.42', 3),
(64, 'Melon - Watermelon Yellow', 'Sunflower Seed Raw', 100, '63.25', 1),
(65, 'Bread - Burger', 'Longos - Chicken Wings', 100, '58.93', 2),
(66, 'Skirt - 24 Foot', 'Cafe Royale', 100, '96.82', 3),
(67, 'Initation Crab Meat', 'Paper - Brown Paper Mini Cups', 100, '24.39', 1),
(68, 'Nantucket Cranberry Juice', 'Beer - Sleeman Fine Porter', 100, '17.74', 2),
(69, 'Chestnuts - Whole,canned', 'Juice - Ocean Spray Cranberry', 100, '29.59', 3),
(70, 'Pastry - Cherry Danish - Mini', 'Water - Mineral, Natural', 100, '66.46', 1),
(71, 'Glucose', 'Bread - White, Sliced', 100, '12.55', 2),
(72, 'Shrimp - 16/20, Iqf, Shell On', 'Coffee - Dark Roast', 100, '48.91', 3),
(73, 'Latex Rubber Gloves Size 9', 'Gooseberry', 100, '52.45', 1),
(74, 'Lettuce - Curly Endive', 'Tarragon - Fresh', 100, '2.74', 2),
(75, 'Ham - Cooked', 'Beans - Black Bean, Dry', 100, '77.48', 3),
(76, 'Beets', 'Clementine', 100, '76.05', 1),
(77, 'Venison - Ground', 'Cherries - Frozen', 100, '25.86', 2),
(78, 'Nantucket - Carrot Orange', 'Coffee - Espresso', 100, '17.47', 3),
(79, 'Spic And Span All Purpose', 'Smirnoff Green Apple Twist', 100, '47.76', 1),
(80, 'Otomegusa Dashi Konbu', 'Sprouts - Brussel', 100, '36.53', 2),
(81, 'Baguette', 'Beef - Striploin Aa', 100, '46.62', 3),
(82, 'The Pop Shoppe - Root Beer', 'Cookies - Oreo, 4 Pack', 100, '80.65', 1),
(83, 'Chicken - White Meat, No Tender', 'Carbonated Water - Blackberry', 100, '50.20', 2),
(84, 'Soup - Base Broth Beef', 'Sea Urchin', 100, '97.00', 3),
(85, 'Chicken - Whole', 'Pecan Raisin - Tarts', 100, '46.57', 1),
(86, 'Pastry - Apple Large', 'Wine - Muscadet Sur Lie', 100, '96.80', 2),
(87, 'Juice - V8 Splash', 'Chocolate - Milk Coating', 100, '59.35', 3),
(88, 'Radish', 'Veal - Kidney', 100, '84.47', 1),
(89, 'Trout Rainbow Whole', 'Wine - Chardonnay Mondavi', 100, '75.09', 2),
(90, 'Veal - Bones', 'Wine - Bourgogne 2002, La', 100, '22.20', 3),
(91, 'Bandage - Fexible 1x3', 'Veal - Kidney', 100, '51.89', 1),
(92, 'Monkfish Fresh - Skin Off', 'Cheese - Grie Des Champ', 100, '20.48', 2),
(93, 'Soup - Knorr, Ministrone', 'Flower - Commercial Bronze', 100, '94.62', 3),
(94, 'Dry Ice', 'Butter - Salted, Micro', 100, '7.93', 1),
(95, 'Cheese - Pont Couvert', 'Milk - Homo', 100, '99.26', 2),
(96, 'Soup - Campbells Mac N Cheese', 'Muffin Mix - Raisin Bran', 100, '4.00', 3),
(97, 'Crackers - Melba Toast', '7up Diet, 355 Ml', 100, '34.21', 1),
(98, 'Honey - Comb', 'Squid - Tubes / Tenticles 10/20', 100, '45.45', 2),
(99, 'Salmon - Fillets', 'Lemonade - Black Cherry, 591 Ml', 100, '80.27', 3),
(100, 'Bread - Pumpernickel', 'Coffee Decaf Colombian', 100, '33.84', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuario`
--

CREATE TABLE `Usuario` (
  `nameuser` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `name` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `sex` varchar(1) COLLATE latin1_spanish_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Volcado de datos para la tabla `Usuario`
--

INSERT INTO `Usuario` (`nameuser`, `password`, `name`, `birthdate`, `sex`, `admin`) VALUES
('fernando', 'fernando', 'Fernando Zamora', '1999-08-04', 'M', 1),
('inma', 'inma', 'Inmaculada Olias', '1990-05-21', 'F', 1),
('javi', 'javi', 'Javier Martínez', '2001-03-25', 'M', 0),
('juanma', 'juanma', 'Juanma García', '1994-04-14', 'M', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Categoria`
--
ALTER TABLE `Categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Compra`
--
ALTER TABLE `Compra`
  ADD PRIMARY KEY (`idUsuario`,`codProduct`),
  ADD KEY `codProduct` (`codProduct`);

--
-- Indices de la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD PRIMARY KEY (`codProduct`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category` (`category`);

--
-- Indices de la tabla `Usuario`
--
ALTER TABLE `Usuario`
  ADD PRIMARY KEY (`nameuser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Categoria`
--
ALTER TABLE `Categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Producto`
--
ALTER TABLE `Producto`
  MODIFY `codProduct` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Compra`
--
ALTER TABLE `Compra`
  ADD CONSTRAINT `Compra_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`nameuser`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Compra_ibfk_2` FOREIGN KEY (`codProduct`) REFERENCES `Producto` (`codProduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `Producto`
--
ALTER TABLE `Producto`
  ADD CONSTRAINT `Producto_ibfk_1` FOREIGN KEY (`category`) REFERENCES `Categoria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
