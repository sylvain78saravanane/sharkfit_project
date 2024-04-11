DROP SCHEMA IF EXISTS `sharkfit-boutique`;

CREATE SCHEMA `sharkfit-boutique`;
USE `sharkfit-boutique` ;

-- Table `sharkfit-boutique`.`product_category`
CREATE TABLE IF NOT EXISTS `sharkfit-boutique`.`product_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;


-- Table `sharkfit-boutique`.`product`
CREATE TABLE IF NOT EXISTS `sharkfit-boutique`.`product` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `code_produit` VARCHAR(255) DEFAULT NULL,
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


INSERT INTO product_category(category_name) VALUES ('OUVRAGES');
INSERT INTO product_category(category_name) VALUES ('EQUIPEMENTS');
INSERT INTO product_category(category_name) VALUES ('ALIMENTATIONS');
INSERT INTO product_category(category_name) VALUES ('ACCESSOIRES');
INSERT INTO product_category(category_name) VALUES ('VÊTEMENTS');

-- OUVRAGES
INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1001', 'L`assiette du sportif', 'Nutritions sportifs','assets/images/products/ouvrages/livre-assiette-du-sportif.jpg',1,100,19.99,1,NOW()); --

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1002', 'Guide des compléments alimentaires','Guide','assets/images/products/ouvrages/nutrimuscle.webp.png',1,100,20.99,1,NOW()); --

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1003', 'Physiologie du sport et de l`exercice','Physiologie','assets/images/products/ouvrages/physiologie.jpeg',1,100,31.99,1,NOW()); --



-- EQUIPEMENTS
INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2001', 'DOMYOS - Tapis de course', 'Tapis de course connecté','assets/images/products/equipements/tapis-de-course-connecte-run500-pliage-compact-10-inclinaison-motorisee.jpg.avif',1,100,229.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2002', 'SharkFit - Haltere', 'Haltere 1kg', 'assets/images/products/equipements/haltere1kg.png',1,100,6.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2003', 'SharkFit - Set Halteres+Barbell+Poids', 'Set complet pour travailler la force :)', 'assets/images/products/equipements/istockphoto-1096483858-612x612.jpg',1,100,1299.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2004', 'SharkFit - Barbell with plates', 'Barbell with 8 plates of 25kg ','assets/images/products/equipements/barbell_olympique.jpeg',1,100,499.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2005', 'SharkFit - Squat Bench with plates', 'Squat Bench','assets/images/products/equipements/power-rack-squat-bench-exercise-equipment-weight-training-barbell.jpg',1,100,599.99,2,NOW());

-- ALIMENTATIONS
INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ALIM-NUTRI-3001', 'Isostar - Barre de chocolat', '30g de protéines','assets/images/products/alimentations/barrechocolat.png.webp',1,100,1.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3002', 'Isostar - Fast Hydratation Gout Citron','500ml','assets/images/products/alimentations/boisson_isostar.png.webp',1,100,1.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3003', 'ÔNature - Whey Native Isolate','1,5kg','assets/images/products/alimentations/whey.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3004', 'ÔNature - Collagen','1,5kg','assets/images/products/alimentations/collagen.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3005', 'ÔNature - Multimineral','1,5kg','assets/images/products/alimentations/multimineral.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3006', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/omega3.webp',1,100,33.50,3,NOW());


-- ACCESSOIRES 
INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4001', 'Mug - Shark Fit', 'Ceramique','assets/images/products/accessoires/mug_sharkfit.webp',1,100,3.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4002', 'Shaker Noir', '250ml','assets/images/products/accessoires/shaker_noir.webp',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/shaker_rouge.webp',1,100,5.50,4,NOW());

-- VÊTEMENTS
INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5001', 'JOKO - Jogging (Noir)','Pantalon de jogging - NOIR','assets/images/products/vetements/jogging.webp',1,100,15.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5002', 'JOKO - Jogging (Rouge)','Pantalon de jogging - ROUGE','assets/images/products/vetements/joko_rouge.webp',1,100,15.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5003', 'JOKO - Jogging (Bleu)','Pantalon de jogging - BLEU','assets/images/products/vetements/joko_bleu.webp',1,100,15.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5004', 'JOGGO - Jogging','Pantalon de jogging - NOIR','assets/images/products/vetements/joggo.webp',1,100,15.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5005', 'ADIDAS - Jogging','Pantalon de jogging - NOIR','assets/images/products/vetements/adidas-tango.webp',1,100,15.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5006', 'ADIDAS - Pureboost 22','Chaussure de sport','assets/images/products/vetements/chaussure_adidas.webp',1,100,65.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5007', 'ADIDAS - Forcebounce 2.0','Chaussure de sport','assets/images/products/vetements/chaussure_bleu_adidas.webp',1,100,65.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5008', 'NIKE - SWOOSH ROUGE','Chaussure de sport','assets/images/products/vetements/op.png.webp',1,100,75.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5009', 'NIKE - Air Zoom Mercurial Superfly XI','Chaussure de sport','assets/images/products/vetements/nike_chaussure_vert.webp',1,100,75.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5010', 'UMBRO - Speciali Eternal Club','Chaussure de sport','assets/images/products/vetements/umbro_speciali.webp',1,100,35.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5011', 'UMBRO - Tshirt Blanc','T-Shirt blanc','assets/images/products/vetements/tshirt_blanc.webp',1,100,12.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5012', 'Adidas - Tshirt Bleu','T-Shirt bleu','assets/images/products/vetements/adidas_tshirt_bleu.webp',1,100,12.99,5,NOW());






