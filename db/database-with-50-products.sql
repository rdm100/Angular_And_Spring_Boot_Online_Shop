-- -----------------------------------------------------
-- Schema full-stack-onlineshop
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `full-stack-onlineshop`;

CREATE SCHEMA `full-stack-onlineshop`;
USE `full-stack-onlineshop` ;

-- -----------------------------------------------------
-- Table `full-stack-onlineshop`.`product_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-onlineshop`.`product_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `full-stack-onlineshop`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `full-stack-onlineshop`.`product` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `unit_price` DECIMAL(13,2) DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `active` BIT DEFAULT 1,
  `units_in_stock` INT(11) DEFAULT NULL,
  `date_created` DATETIME(6) DEFAULT NULL,
  `last_updated` DATETIME(6) DEFAULT NULL,
  `category_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Categories
-- -----------------------------------------------------
INSERT INTO product_category(category_name) VALUES ('Books');
INSERT INTO product_category(category_name) VALUES ('Mugs');

-- -----------------------------------------------------
-- Books
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
unit_price, category_id, date_created)
VALUES ('BOOK-CLASSIC-1000', 'The Lord of the Rings', 'Fantasy novel',
'assets/images/products/books/the_lord_of_the_rings.png'
,1,100,9.99,1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
unit_price, category_id, date_created)
VALUES ('BOOK-CLASSIC-1001', 'The Hobbit', 'Fantasy novel',
'assets/images/products/books/the_hobbit.png'
,1,100,9.99,1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
unit_price, category_id, date_created)
VALUES ('BOOK-CLASSIC-1002', 'To Kill A Mockingbird', 'Fiction',
'assets/images/products/books/to_kill_a_mockingbird.png'
,1,100,4.99,1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
unit_price, category_id, date_created)
VALUES ('BOOK-CLASSIC-1003', '1984 Nineteen Eighty-Four', 'Science Fiction',
'assets/images/products/books/1984.png'
,1,100,7.99,1, NOW());

INSERT INTO product (sku, name, description, image_url, active, units_in_stock,
unit_price, category_id, date_created)
VALUES ('BOOK-CLASSIC-1004', 'Brave New World', 'Science Fiction',
'assets/images/products/books/brave_new_world.png'
,1,100,8.99,1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) 
VALUES ('BOOK-CLASSIC-1005', 'Animal Farm', 'Fiction', 
'assets/images/products/books/animal_farm.png', 1, 100, 3.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) 
VALUES ('BOOK-CLASSIC-1006', 'Contact', 'Science Fiction', 'assets/images/products/books/contact.png', 1, 100, 4.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) 
VALUES ('BOOK-CLASSIC-1007', 'The handmaids tale', 'Science Fiction', 'assets/images/products/books/the_handmaids_tale.png', 1, 100, 6.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) 
VALUES ('BOOK-CLASSIC-1008', 'Vertigo', 'Fiction', 'assets/images/products/books/vertigo.png', 1, 100, 5.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) 
VALUES ('BOOK-CLASSIC-1009', 'Murder on the Orient express', 'Crime', 
'assets/images/products/books/murder_on_the_orient_express.png', 1, 100, 3.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) 
VALUES ('BOOK-CLASSIC-1010', 'Nemesis Miss Marple', 'Crime', 
 'assets/images/products/books/nemesis.png', 1, 100, 4.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) 
VALUES ('BOOK-CLASSIC-1011', 'The Queens gambit', 'Fiction', 
'assets/images/products/books/the_queens_gambit.png', 1, 100, 9.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1012', 'The Silmarillion', 'Fantasy', 
'assets/images/products/books/the_silmarillion.png', 1, 100, 4.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1013', 'The Odyssey', 'Poetry', 
'assets/images/products/books/the_odyssey.png', 1, 100, 9.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1014', 'A pocketful of rye', 'Crime', 'assets/images/products/books/a_pocketful_of_rye.png', 1, 100, 2.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1015', 'Rebecca', 'Fiction', 
'assets/images/products/books/rebecca.png', 1, 100, 4.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1016', 'The last kingdom', 'Fantasy', 
'assets/images/products/books/the_last_kingdom.png', 1, 100, 7.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1017', 'Wuthering Heights', 'Fiction', 
'assets/images/products/books/wuthering_heights.png', 1, 100, 3.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1018', 'Dune', 'Science fiction', 
'assets/images/products/books/dune.png', 1, 100, 6.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1019', 'Fahrenheit 451', 'Science Fiction', 
 'assets/images/products/books/fahrenheit_451.png', 1, 100, 3.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1020', 'Foundation', 'Science fiction', 
'assets/images/products/books/foundation.png', 1, 100, 9.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1021', 'The catcher in the Rye', 'Fiction', 
'assets/images/products/books/the_catcher_in_the_rye.png', 1, 100, 8.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1022', 'The house in the cerulean Sea', 'Fantasy', 
 'assets/images/products/books/the_house_in_the_cerulean_sea.png', 1, 100, 6.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1023', 'A tale of 2 cities', 'Fiction', 
'assets/images/products/books/a_tale_of_2_cities.png', 1, 100, 5.99, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, 
category_id,date_created) VALUES ('BOOK-CLASSIC-1024', 'The adventures of Sherlock Holmes', 'Crime', 
'assets/images/products/books/the_adventures_of_sherlock_holmes.png', 1, 100, 6.99, 1, NOW());

-- -----------------------------------------------------
--  Mugs
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1000', 'Musical Mug', 'Umi Musical Guitar Coffee Mug with Lid and Handle, 400ml Ceramic Tea Cup', 
'assets/images/products/mugs/mug_1.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1001', 'Mummy mug', 'Mama bear new presents for mum', 'assets/images/products/mugs/mug_2.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1002', 'Camel mug', 'Mug with camel picture', 'assets/images/products/mugs/mug_3.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1003', 'Le Creuset Stoneware Mug', 'Le Creuset Stoneware Mug blue', 'assets/images/products/mugs/mug_4.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1004', '36 White Mugs', '36 White Sublimation Coated Heat Press Printing Mugs', 'assets/images/products/mugs/mug_5.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1005', 'Sabichi Mug', 'Grey mug', 'assets/images/products/mugs/mug_6.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1006', '720°DGREE Travel Mug', '720°DGREE Travel Mug PleasureToGo - 450ml', 'assets/images/products/mugs/mug_7.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1007', 'Bodum Mug', 'Bodum Vacuum Mug', 'assets/images/products/mugs/mug_8.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1008', 'Ecooe Mug', 'Ecooe Mug Double Walled Coffee Glasses', 'assets/images/products/mugs/mug_9.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1009', 'DOWAN Mug', 'DOWAN Mug porcelain  mug', 'assets/images/products/mugs/mug_10.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1010', 'Smart Mug', 'Ember Temperature-Control Smart Mug', 'assets/images/products/mugs/mug_11.png', 1, 100, 99.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created)
VALUES ('MUG-1011', 'Cute Mug', ' Bear Tea Coffee Cup', 'assets/images/products/mugs/mug_12.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1012', 'Travel Mug', 'Travel Mug pink', 'assets/images/products/mugs/mug_13.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1013', 'Purezento Mug', 'Purezento Mug Coffee Mug for Dad', 'assets/images/products/mugs/mug_14.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1014', 'William Morris Mug', 'Strawberry design', 'assets/images/products/mugs/mug_15.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1015', 'Lesser & Pavey Mug', 'Bees design', 'assets/images/products/mugs/mug_16.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created)
VALUES ('MUG-1016', 'CAPACITEA Mug', 'CAPACITEA Mug glass', 'assets/images/products/mugs/mug_17.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1017', 'Ceramic Mug', 'Ceramic mug green', 'assets/images/products/mugs/mug_18.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1018', 'Doulton Mug', 'Royal Doulton Mug', 'assets/images/products/mugs/mug_19.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1019', 'Ravenhead Mug', 'Ravenhead mug glass', 'assets/images/products/mugs/mug_20.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1020', 'Star Wars Mug', 'Millennium Falcon Star Wars mug', 'assets/images/products/mugs/mug_21.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1021', 'Coffee Mug Warmer Mug', 'Electronic  mug warmer', 'assets/images/products/mugs/mug_22.png', 1, 100, 18.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1022', 'NEWANOVI Mug', 'Ceramic Cup Smooth Frosted Porcelain', 'assets/images/products/mugs/mug_23.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1023', 'Personalised Mug', 'Personalised mug and your own Text or picture', 'assets/images/products/mugs/mug_24.png', 1, 100, 8.99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) 
VALUES ('MUG-1024', 'Hot drinks Mug', 'MY CUPPA TEA mug', 'assets/images/products/mugs/mug_25.png', 1, 100, 8.99, 2, NOW());

