use `sharkfit-boutique`;

DROP TABLE IF EXISTS `administrator`;

CREATE TABLE `administrator` (
    `id` INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `nom` VARCHAR(50) NOT NULL,
    `prenom` VARCHAR(50) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE
)ENGINE=InnoDB;

INSERT INTO `administrator` VALUES 
(1001,'Saravanane', 'Sylvain', 'sylvainsinou@yahoo.fr');

