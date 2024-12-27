CREATE DATABASE IF NOT EXISTS agroeco_db;

USE agroeco_db;

CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') NOT NULL,
    status ENUM('new', 'confirmed', 'suspended') NOT NULL DEFAULT 'new',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Table pour l'empreinte carbone
CREATE TABLE empreinte_carbone (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    type_emission INT NOT NULL,
    carbon_emission FLOAT NOT NULL,
    measurement_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (type_emission) REFERENCES type_emissions(id)
);
-- Table pour les catégories d'émissions
CREATE TABLE categories_emissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Insertion des catégories d'émissions
INSERT INTO categories_emissions (name) VALUES
('Émissions Indirectes liées à l\'Énergie'),
('Autres Émissions Indirectes');

-- Table pour les types d'émissions
CREATE TABLE type_emissions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories_emissions(id)
);

-- Insertion des types d'émissions
INSERT INTO type_emissions (category_id, name) VALUES
(1, 'Consommation d\'électricité'),
(1, 'Consommation de combustibles fossiles'),
(2, 'Production d\'intrants agricoles'),
(2, 'Transport des produits agricoles'),
(2, 'Transformation et distribution des produits agricoles');


INSERT INTO user (name, first_name, email, password, role, status) 
VALUES 
('Admin', 'admin', 'admin@gmail.com', 'passer', 'admin', 'new');

INSERT INTO user (name, first_name, email, password, role, status) 
VALUES 
('User', 'user', 'user@gmail.com', 'passer', 'user', 'new');
