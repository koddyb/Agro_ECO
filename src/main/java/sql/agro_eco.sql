-- Créer la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS agroeco_db;

-- Utiliser la base de données agroeco_db
USE agroeco_db;

-- Créer la table user avec des validations strictes sur role et status
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identifiant unique pour chaque utilisateur
    name VARCHAR(100) NOT NULL, -- Nom de l'utilisateur obligatoire
    first_name VARCHAR(100) NOT NULL, -- Prénom de l'utilisateur obligatoire
    email VARCHAR(255) NOT NULL UNIQUE, -- Adresse email unique et obligatoire
    password VARCHAR(255) NOT NULL, -- Mot de passe obligatoire
    role ENUM('admin', 'user') NOT NULL, -- Rôle limité à "admin" ou "user"
    status ENUM('new', 'verified', 'suspended') NOT NULL DEFAULT 'new', -- Statut limité à des valeurs spécifiques avec "new" par défaut
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date de création par défaut
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Mise à jour automatique de la date de modification
);
