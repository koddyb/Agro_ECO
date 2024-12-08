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

INSERT INTO user (name, first_name, email, password, role, status) 
VALUES 
('Admin', 'admin', 'admin@gmail.com', 'passer', 'admin', 'new');

INSERT INTO user (name, first_name, email, password, role, status) 
VALUES 
('User', 'user', 'user@gmail.com', 'passer', 'user', 'new');
