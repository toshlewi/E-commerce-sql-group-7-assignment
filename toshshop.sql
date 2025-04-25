-- Create database
CREATE DATABASE IF NOT EXISTS toshshop;
USE toshshop;

-- Create brand table
CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create product_category table
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Create product table
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    brand_id INT,
    base_price DECIMAL(10,2),
    category_id INT,
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Create product_image table
CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Create color table
CREATE TABLE color (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    hex_code VARCHAR(7)
);

-- Create size_category table
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Create size_option table
CREATE TABLE size_option (
    size_option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    value VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Create product_variation table
CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Create product_item table
CREATE TABLE product_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    variation_id INT,
    color_id INT,
    size_option_id INT,
    sku VARCHAR(255) UNIQUE,
    price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- Create attribute_category table
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);

-- Create attribute_type table
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    type_name VARCHAR(100) NOT NULL
);

-- Create product_attribute table
CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    attribute_name VARCHAR(255) NOT NULL,
    attribute_value VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);

-- Insert into brand
INSERT INTO brand (name, description) VALUES 
('Nike', 'Sportswear and shoes'),
('Apple', 'Technology company'),
('Samsung', 'Electronics manufacturer');

-- Insert into product_category
INSERT INTO product_category (name, description) VALUES 
('Clothing', 'Apparel and accessories'),
('Electronics', 'Gadgets and devices');

-- Insert into product
INSERT INTO product (name, brand_id, base_price, category_id, description) VALUES 
('Air Max 90', 1, 120.00, 1, 'Classic running shoes.'),
('iPhone 14', 2, 999.99, 2, 'Latest Apple smartphone.'),
('Galaxy S23', 3, 899.99, 2, 'Samsung flagship phone.');

-- Insert into color
INSERT INTO color (name, hex_code) VALUES 
('Red', '#FF0000'),
('Blue', '#0000FF'),
('Black', '#000000');

-- Insert into size_category
INSERT INTO size_category (name) VALUES 
('Clothing Sizes'),
('Shoe Sizes');

-- Insert into size_option
INSERT INTO size_option (size_category_id, value) VALUES 
(1, 'S'),
(1, 'M'),
(1, 'L'),
(2, '9'),
(2, '10'),
(2, '11');

-- Insert into product_variation
INSERT INTO product_variation (product_id) VALUES 
(1),
(2),
(3);

-- Insert into product_item
INSERT INTO product_item (variation_id, color_id, size_option_id, sku, price, stock_quantity) VALUES 
(1, 1, 5, 'NIKE-AM90-RED-10', 120.00, 50),
(2, 3, NULL, 'APPLE-IP14-BLACK', 999.99, 100),
(3, 3, NULL, 'SAMSUNG-GS23-BLACK', 899.99, 80);

-- Insert into attribute_category
INSERT INTO attribute_category (name) VALUES 
('Physical Attributes'),
('Technical Specifications');

-- Insert into attribute_type
INSERT INTO attribute_type (type_name) VALUES 
('Text'),
('Number'),
('Boolean');

-- Insert into product_attribute
INSERT INTO product_attribute (product_id, attribute_category_id, attribute_type_id, attribute_name, attribute_value) VALUES 
(1, 1, 1, 'Material', 'Leather'),
(2, 2, 2, 'Storage', '128GB'),
(3, 2, 2, 'Storage', '256GB');

-- Insert into product_image
INSERT INTO product_image (product_id, image_url) VALUES 
(1, 'https://images.pexels.com/photos/6295121/pexels-photo-6295121.jpeg?auto=compress&cs=tinysrgb&w=600'),
(2, 'https://images.pexels.com/photos/1647976/pexels-photo-1647976.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(3, 'https://images.pexels.com/photos/15493878/pexels-photo-15493878/free-photo-of-hands-on-samsung-galaxy-s23-ultra-5g-green-color-mention-zana_qaradaghy-on-instagram-while-use-this-photo-follow-on-instagram-zana_qaradaghy.jpeg?auto=compress&cs=tinysrgb&w=600');
