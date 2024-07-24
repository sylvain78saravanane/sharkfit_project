use `sharkfit-boutique`;

DROP TABLE `users`;
DROP TABLE `user_roles`;

CREATE TABLE `users`(
`id` BIGINT(20) AUTO_INCREMENT PRIMARY KEY,
`nom` VARCHAR(255) DEFAULT NULL,
`prenom` VARCHAR(255) DEFAULT NULL,
`email` varchar(255) UNIQUE,
`mot_de_passe` varchar(255))
ENGINE=InnoDB;

CREATE TABLE `user_roles`(
    user_id BIGINT,
    role VARCHAR(20)
);



