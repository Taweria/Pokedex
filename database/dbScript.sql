﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/7x90DI
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE DATABASE pokedex CHARACTER SET 'utf8';

USE pokedex;

CREATE TABLE `pokemon` (
                           `pokemonID` int NOT NULL AUTO_INCREMENT,
                           `name` varchar(255)  NOT NULL ,
                           `number` varchar(255)  NOT NULL ,
                           `healthPoints` int  NOT NULL ,
                           `attackDamages` int  NOT NULL ,
                           `defensePoints` int  NOT NULL ,
                           `specificDefense` int  NOT NULL ,
                           `specificAttack` int  NOT NULL ,
                           `speed` int  NOT NULL ,
                           `picture` varchar(255)  NOT NULL ,
                           PRIMARY KEY (
                                        `pokemonID`
                               )
);

CREATE TABLE `pokemonPreviousEvolution` (
                                            `pokPreviousID` int AUTO_INCREMENT NOT NULL ,
                                            `pokemonID` int  NOT NULL ,
                                            `previousEvolutionID` int  NOT NULL ,
                                            `level` int  NOT NULL ,
                                            PRIMARY KEY (
                                                         `pokPreviousID`
                                                )
);

CREATE TABLE `pokemonFutureEvolution` (
                                          `pokFuture` int AUTO_INCREMENT NOT NULL ,
                                          `pokemonID` int  NOT NULL ,
                                          `futureEvolution` int  NOT NULL ,
                                          `level` int  NOT NULL ,
                                          PRIMARY KEY (
                                                       `pokFuture`
                                              )
);

CREATE TABLE `types` (
                         `typeID` int AUTO_INCREMENT NOT NULL ,
                         `name` varchar(255)  NOT NULL ,
                         PRIMARY KEY (
                                      `typeID`
                             )
);

CREATE TABLE `pokemonType` (
                               `pokeTypeID` int AUTO_INCREMENT NOT NULL ,
                               `pokemonID` int  NOT NULL ,
                               `typeID` int  NOT NULL ,
                               PRIMARY KEY (
                                            `pokeTypeID`
                                   )
);

CREATE TABLE `users` (
                         `userID` int AUTO_INCREMENT NOT NULL ,
                         `username` varchar(255)  NOT NULL ,
                         `password` varchar(255)  NOT NULL ,
                         `roleID` int  NOT NULL ,
                         PRIMARY KEY (
                                      `userID`
                             )
);

CREATE TABLE `favorites` (
                             `favoriteID` int AUTO_INCREMENT NOT NULL ,
                             `userID` int  NOT NULL ,
                             `pokemonID` int  NOT NULL ,
                             PRIMARY KEY (
                                          `favoriteID`
                                 )
);

CREATE TABLE `roles` (
                         `roleID` int AUTO_INCREMENT NOT NULL ,
                         `name` varchar(255)  NOT NULL ,
                         PRIMARY KEY (
                                      `roleID`
                             )
);

ALTER TABLE `pokemonPreviousEvolution` ADD CONSTRAINT `fk_pokemonPreviousEvolution_pokemonID` FOREIGN KEY(`pokemonID`)
    REFERENCES `pokemon` (`pokemonID`);

ALTER TABLE `pokemonPreviousEvolution` ADD CONSTRAINT `fk_pokemonPreviousEvolution_previousEvolutionID` FOREIGN KEY(`previousEvolutionID`)
    REFERENCES `pokemon` (`pokemonID`);

ALTER TABLE `pokemonFutureEvolution` ADD CONSTRAINT `fk_pokemonFutureEvolution_pokemonID` FOREIGN KEY(`pokemonID`)
    REFERENCES `pokemon` (`pokemonID`);

ALTER TABLE `pokemonFutureEvolution` ADD CONSTRAINT `fk_pokemonFutureEvolution_futureEvolution` FOREIGN KEY(`futureEvolution`)
    REFERENCES `pokemon` (`pokemonID`);

ALTER TABLE `pokemonType` ADD CONSTRAINT `fk_pokemonType_pokemonID` FOREIGN KEY(`pokemonID`)
    REFERENCES `pokemon` (`pokemonID`);

ALTER TABLE `pokemonType` ADD CONSTRAINT `fk_pokemonType_typeID` FOREIGN KEY(`typeID`)
    REFERENCES `types` (`typeID`);

ALTER TABLE `users` ADD CONSTRAINT `fk_users_roleID` FOREIGN KEY(`roleID`)
    REFERENCES `roles` (`roleID`);

ALTER TABLE `favorites` ADD CONSTRAINT `fk_favorites_userID` FOREIGN KEY(`userID`)
    REFERENCES `users` (`userID`);

ALTER TABLE `favorites` ADD CONSTRAINT `fk_favorites_pokemonID` FOREIGN KEY(`pokemonID`)
    REFERENCES `pokemon` (`pokemonID`);

ALTER TABLE `favorites` ADD UNIQUE `favorite_unique`(`userID`, `pokemonID`);


ALTER TABLE `users` ADD UNIQUE (`username`);

CREATE INDEX `idx_pokemon_name`
    ON `pokemon` (`name`);
