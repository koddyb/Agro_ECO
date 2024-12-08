-- Cr�er la base de donn�es si elle n'existe pas
CREATE DATABASE IF NOT EXISTS agroeco_db;

-- Utiliser la base de donn�es agroeco_db
USE agroeco_db;

-- Cr�er la table user avec des validations strictes sur role et status
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Identifiant unique pour chaque utilisateur
    name VARCHAR(100) NOT NULL, -- Nom de l'utilisateur obligatoire
    first_name VARCHAR(100) NOT NULL, -- Pr�nom de l'utilisateur obligatoire
    email VARCHAR(255) NOT NULL UNIQUE, -- Adresse email unique et obligatoire
    password VARCHAR(255) NOT NULL, -- Mot de passe obligatoire
    role ENUM('admin', 'user') NOT NULL, -- R�le limit� � "admin" ou "user"
    status ENUM('new', 'verified', 'suspended') NOT NULL DEFAULT 'new', -- Statut limit� � des valeurs sp�cifiques avec "new" par d�faut
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Date de cr�ation par d�faut
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Mise � jour automatique de la date de modification
);
