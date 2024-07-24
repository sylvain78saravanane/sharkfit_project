USE `sharkfit-boutique`;

DROP TABLE IF EXISTS `avis`;

CREATE TABLE `avis` (
    `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
    `adherent_id` BIGINT(20) DEFAULT NULL,
    `admin_id` INT UNSIGNED DEFAULT NULL,
    `texte` TEXT NOT NULL,
    `date_creation` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`adherent_id`) REFERENCES `adherent`(`id`),
    FOREIGN KEY (`admin_id`) REFERENCES `administrator`(`id`)
) ENGINE=InnoDB AUTO_INCREMENT = 1;
