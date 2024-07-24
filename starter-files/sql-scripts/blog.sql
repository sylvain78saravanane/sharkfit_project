use `sharkfit-boutique`;

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id` smallint unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `blog` VALUES 
(1,'Blog - SHARKFIT');

DROP TABLE IF EXISTS `blog_text`;

CREATE TABLE `blog_text` (
    `id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) DEFAULT NULL,
    `description` TEXT NOT NULL,
    `date_created` DATETIME(6) DEFAULT NULL,
    `last_updated` DATETIME(6) DEFAULT NULL,
    `admin_id` INT UNSIGNED NOT NULL,
    `blog_id` SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (`admin_id`) REFERENCES administrator(`id`),
    FOREIGN KEY (`blog_id`) REFERENCES blog(`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1;



