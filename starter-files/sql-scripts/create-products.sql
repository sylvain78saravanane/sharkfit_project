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
INSERT INTO product_category(category_name) VALUES ('CHAUSSURES');


-- OUVRAGES
INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1001', 'L`assiette du sportif', 'Nutritions sportifs','assets/images/products/ouvrages/livre-assiette-du-sportif.jpg',1,100,19.99,1,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1002', 'Guide des compléments alimentaires','Guide','assets/images/products/ouvrages/nutrimuscle.webp.png',1,100,20.99,1,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1003', 'Physiologie du sport et de l`exercice','Physiologie','assets/images/products/ouvrages/physiologie.jpeg',1,100,31.99,1,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1004', 'Le Guide indispensable de la nutrition','Ecrit par Mélanie Ouiilon-Simon','assets/images/products/ouvrages/product_10876785b.png',1,100,21.99,1,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1005', 'La meilleur façon de manger','Ecrit par Thierry Soucart (Directeur de la nutrition) et Angélique HOULBERT (Diététicienne-nutritionniste) ','assets/images/products/ouvrages/la-meilleure-facon-de-manger.jpg.png',1,100,21.99,1,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1006', 'Programme d`entraînement (sèche) ','Programme sportif','assets/images/products/ouvrages/programme-d-entrainement-seche.jpg.png',1,100,31.99,1,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1007', 'Les bases fondamentales de l`alimentation','Physiologie','assets/images/products/ouvrages/ebook-les-bases-fondamentales-de-l-alimentation.jpg.png',1,100,31.99,1,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1008', 'Programme d`entraînement (perte de poids)','Physiologie','assets/images/products/ouvrages/programme-d-entrainement-perte-de-poids.jpg.png',1,100,31.99,1,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1009', 'Programme d`entraînement (prise de masse)','Physiologie','assets/images/products/ouvrages/programme-d-entrainement-prise-de-masse.jpg.png',1,100,31.99,1,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1010', 'Ebook - FORCE MAX','Physiologie','assets/images/products/ouvrages/ebook-force-max.jpg.png',1,100,31.99,1,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1011', 'Purshape - Programme Home Training','Physiologie','assets/images/products/ouvrages/Programme-Home-Training-Maxime-Clergeau-Purshape-2-300x300.png',1,100,31.99,1,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1012', 'Purshape - Programme Prise de masse','Physiologie','assets/images/products/ouvrages/WS-Coaching-Programme-prise-de-masse-Purshape-300x300.png',1,100,31.99,1,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock,unit_price, category_id, date_created) 
VALUES ('BOOK-RECETTE-1013', 'Purshape - Programme Musculation Débutant','Physiologie','assets/images/products/ouvrages/Programme-prise-de-masse-Elias-Purshape-couverture-300x300.png',1,100,31.99,1,NOW());





-- EQUIPEMENTS
INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2001', 'DOMYOS - Tapis de course', 'Tapis de course connecté','assets/images/products/equipements/tapis_course.jpeg',1,100,229.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2002', 'SharkFit - Haltere', 'Haltere 1kg', 'assets/images/products/equipements/haltere_op.webp',1,100,6.99,2,NOW()); --

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2003', 'Sharkfit - Set Workout', '2x Haltères 0,5kg; 1x Presse-main; 1x Rouleau pour les abdos; 1x Kettlebell  ', 'assets/images/products/equipements/pngtree-bodybuilding-equipment-gym-photo-png-image_14304119.png',1,100,6.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2002', 'SharkFit - Set Haltere', 'Haltere 1kg', 'assets/images/products/equipements/pngtree-weight-training-fitness-barbell-png-image_6105436.jpg',1,100,6.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2002', 'SharkFit - Haltere', 'Haltere 1kg', 'assets/images/products/equipements/pngtree-training-fitness-equipment-weight-loss-dumbbell-exercise-png-image_6105248.jpg',1,100,6.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2002', 'SharkFit - Haltere', 'Haltere 1kg', 'assets/images/products/equipements/pngtree-weight-training-dumbbell-barbell-png-image_6105406.jpg',1,100,6.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2002', 'SharkFit - Haltere', 'Haltere 1kg', 'assets/images/products/equipements/pngimg.com - gym_equipment_PNG24.png',1,100,6.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2002', 'SharkFit - Haltere', 'Haltere 1kg', 'assets/images/products/equipements/pngimg.com - gym_equipment_PNG149.png',1,100,6.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2002', 'SharkFit - Haltere', 'Haltere 1kg', 'assets/images/products/equipements/bodysolid-pro-club-line-machine-multi-hip.png',1,100,6.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2002', 'SharkFit - Haltere', 'Haltere 1kg', 'assets/images/products/equipements/GSCL360_Hero02_grande.png.webp',1,100,6.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2002', 'SharkFit - Haltere', 'Haltere 1kg', 'assets/images/products/equipements/EX3_03.png',1,100,6.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2002', 'SharkFit - Haltere', 'Haltere 1kg', 'assets/images/products/equipements/GLCE365_Hero02.png.webp',1,100,6.99,2,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('EQUIP-SPORT-2002', 'SharkFit - Haltere', 'Haltere 1kg', 'assets/images/products/equipements/GLPH1100_HERO_800x.png.webp',1,100,6.99,2,NOW());


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
VALUES('ALIM-NUTRI-3006', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/omega3.webp',1,100,33.50,3,NOW()); --

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3007', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/76121340_46.png',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3008', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/3175681029941_front_fr_FR_178b.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3009', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/nutrimuscle-proteines-whey-native-choco-cookie-4-00-kg-50767136194889.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3010', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/images.jpeg',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3011', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/3175681161535_front_fr_FR_59be.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3012', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/3175681191440_front_fr_FR_5783.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3013', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/PACK_20ESSENTIEL_20-_20SPECIAL_20ONE-20230412102558.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3014', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/nutrimuscle-nutriments-nutri-fibres-en-poudre-50767160607049.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3015', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/nutrimuscle-proteines-proteines-totales-biologiques-50928125509961.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3016', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/Preworkout500.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3017', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/3175681283497_front_fr_BE_0f58.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3018', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/7612100008171_front_fr_FR_2e7c.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3019', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/creme_riz_complet_nutrimuscle_0000_CRIZ_0_b3bb592c-cea6-4f65-a4af-82790c46fc1c.jpg.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3020', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/enzymes-digestives-nutrimuscle.jpg.png',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3021', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/glycine-cristallisee-nutrimuscle.jpg.png',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3022', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/7612100031667_front_fr_FR_e3d4.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3023', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/Artboard-31-1.png',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3024', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/Artboard-62-1.png',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3025', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/3175681045897_front_fr_FR_0d03.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3026', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/isostar-500ml-pet-grapefruit-326049-n560.png.jpeg',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3027', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/contrex.png',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3028', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/evian.png',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3029', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/evianpetit.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3030', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/isostar_bundles_vignettes_3_.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3031', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/new_ren2308-00522_bic_pwis_petbtl_500ml_fra_fr_d_closed_54492653_038.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3032', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/new_ren2308-00524_bic_pwch_petbtl_500ml_fr_d_closed_42099017_886.png.webp',1,100,33.50,3,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES('ALIM-NUTRI-3033', 'ÔNature - Omega 3','1,5kg','assets/images/products/alimentations/new_ren2308-00525_bic_pwm_petbtl_500ml_fra_fr_d_closed_54023857_195.png.webp',1,100,33.50,3,NOW());

-- ACCESSOIRES 
INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4001', 'Mug - Shark Fit', 'Ceramique','assets/images/products/accessoires/mug_sharkfit.webp',1,100,3.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4002', 'Shaker Noir', '250ml','assets/images/products/accessoires/shaker_noir.webp',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/Product_Image_CreatorShaker_LoveHoly_02_1800x.png.webp',1,100,5.50,4,NOW()); --

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/bandeau-polyknit-light-eco.jpg.png',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/Wave_compact_500_smoke_500x500_d5b3e0a7-8a45-4ca8-a9f3-67b3147afd1d_x500.png.webp',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/Wave_compact_500_cyan_500x500_8365b021-7c2f-4e4e-aafb-ca571bc5b41a_x500.png.webp',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/wave_03_magenta_500x500_1aa44ead-8257-4d0a-b176-26e459df97c8_x500.png.webp',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/WaveP_Shaker_smoke_500x500_316f262e-64b6-4820-88c6-93bc10aa43d6_x500.png.webp',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/10996_8af6afdb8d9a.webp',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/10996_8f2f24fb9d60.webp',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/MT2R3ref_VW_34FR+watch-case-40-aluminum-midnight-nc-se_VW_34FR+watch-face-40-aluminum-midnight-se_VW_34FR.png',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/unnamed.png',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/whitewatch.png',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/xiaomi.png',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/Mi-Watch-Lite.png',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/corde-ajustable.jpg.png',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/corde-ajustable-professionnelle.jpg.png',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/tapisblanc.avif',1,100,5.50,4,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('ACCESS-SPORT-4003', 'Shaker Rouge', '250ml','assets/images/products/accessoires/tapisbleu.avif',1,100,5.50,4,NOW());



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
VALUES ('VET-FIT-5006', 'ADIDAS - Pureboost 22','Chaussure de sport','assets/images/products/vetements/tshirt_20noir-20230810031430.webp.png',1,100,65.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5007', 'ADIDAS - Forcebounce 2.0','Chaussure de sport','assets/images/products/vetements/tshirtnutriblanc.png',1,100,65.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5008', 'NIKE - SWOOSH ROUGE','Chaussure de sport','assets/images/products/vetements/whiteshirt.webp',1,100,75.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5009', 'NIKE - Air Zoom Mercurial Superfly XI','Chaussure de sport','assets/images/products/vetements/tshirt_blanc.webp',1,100,75.99,5,NOW()); --

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-5010', 'UMBRO - Speciali Eternal Club','Chaussure de sport','assets/images/products/vetements/redshirt.webp',1,100,35.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-50', 'UMBRO - Speciali Eternal Club','Chaussure de sport','assets/images/products/vetements/orangeshirt.webp',1,100,35.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-50', 'UMBRO - Speciali Eternal Club','Chaussure de sport','assets/images/products/vetements/blueshirt.webp',1,100,35.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-50', 'UMBRO - Speciali Eternal Club','Chaussure de sport','assets/images/products/vetements/20056_61893b3b6697b_PS_PA101_SPORTYRED.png',1,100,35.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-50', 'UMBRO - Speciali Eternal Club','Chaussure de sport','assets/images/products/vetements/20054_61893b2994e0b_PS_PA101_GREEN.png',1,100,35.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-50', 'UMBRO - Speciali Eternal Club','Chaussure de sport','assets/images/products/vetements/20046_61893ad852820_PS_PA101_BLACK.png',1,100,35.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-50', 'UMBRO - Speciali Eternal Club','Chaussure de sport','assets/images/products/vetements/puma-liga-core-short-f03-hose-kurz-teamsport-match-training-mannschaft-703436.png.webp',1,100,35.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-50', 'UBRO - Speciali Eternal Club','Chaussure de sport','assets/images/products/vetements/puma-liga-core-short-weiss-schwarz-f04-training-outfit-sportlich-alltag-freizeit-fussball-laufen-703436.png.webp',1,100,35.99,5,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-50', 'UMBRO - Tshirt Blanc','T-Shirt blanc','assets/images/products/vetements/tshirt_blanc.webp',1,100,12.99,5,NOW()); --

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('VET-FIT-50', 'Adidas - Tshirt Bleu','T-Shirt bleu','assets/images/products/vetements/adidas_tshirt_bleu.webp',1,100,12.99,5,NOW());

-- CHAUSSURES

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6001', 'Adidas - Tshirt Bleu','T-Shirt bleu','assets/images/products/chaussures/adidasgris.jpg.png',1,100,12.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6005', 'Adidas - Tshirt Bleu','T-Shirt bleu','assets/images/products/chaussures/vert.png.webp',1,100,12.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6006', 'Adidas - Tshirt Bleu','T-Shirt bleu','assets/images/products/chaussures/jaune.png.avif',1,100,12.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6007', 'Adidas - Tshirt Bleu','T-Shirt bleu','assets/images/products/chaussures/rose.png.avif',1,100,12.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6008', 'Adidas - Tshirt Bleu','T-Shirt bleu','assets/images/products/chaussures/marron.png.avif',1,100,12.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6009', 'Adidas - Tshirt Bleu','T-Shirt bleu','assets/images/products/chaussures/noir.png.webp',1,100,12.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6010', 'Adidas - Tshirt Bleu','T-Shirt bleu','assets/images/products/chaussures/chaussure-de-running-sur-route-interact-run-pour-GjCV2B.png',1,100,12.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6011', 'Adidas - Tshirt Bleu','T-Shirt bleu','assets/images/products/chaussures/giannis-immortality-2.jpg.png',1,100,12.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6012', 'Adidas - Tshirt Bleu','T-Shirt bleu','assets/images/products/chaussures/chaussure-femme-nike-roshe-g-vert-clair.jpg.png',1,100,12.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6013', 'ADIDAS - Pureboost 22','Chaussure de sport','assets/images/products/chaussures/chaussure_adidas.webp',1,100,65.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6014', 'ADIDAS - Forcebounce 2.0','Chaussure de sport','assets/images/products/chaussures/chaussure_bleu_adidas.webp',1,100,65.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6015', 'NIKE - SWOOSH ROUGE','Chaussure de sport','assets/images/products/chaussures/op.png.webp',1,100,75.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6016', 'NIKE - Air Zoom Mercurial Superfly XI','Chaussure de sport','assets/images/products/chaussures/nike_chaussure_vert.webp',1,100,75.99,6,NOW());

INSERT INTO product (code_produit, name, description, image_url, active, units_in_stock, unit_price, category_id, date_created)
VALUES ('SHOES-SPORT-6017', 'UMBRO - Speciali Eternal Club','Chaussure de sport','assets/images/products/chaussures/umbro_speciali.webp',1,100,35.99,6,NOW());



