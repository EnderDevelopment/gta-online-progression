CREATE TABLE IF NOT EXISTS gta_missions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    mission_id VARCHAR(50) NOT NULL,
    completed BOOLEAN DEFAULT FALSE,
    last_completed TIMESTAMP NULL,
    FOREIGN KEY (player_id) REFERENCES users(identifier)
);

CREATE TABLE IF NOT EXISTS gta_heists (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    heist_id VARCHAR(50) NOT NULL,
    completed BOOLEAN DEFAULT FALSE,
    last_completed TIMESTAMP NULL,
    FOREIGN KEY (player_id) REFERENCES users(identifier)
);

CREATE TABLE IF NOT EXISTS gta_businesses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    business_id VARCHAR(50) NOT NULL,
    level INT DEFAULT 1,
    last_upgraded TIMESTAMP NULL,
    FOREIGN KEY (player_id) REFERENCES users(identifier)
);

CREATE TABLE IF NOT EXISTS gta_properties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    property_id VARCHAR(50) NOT NULL,
    owned BOOLEAN DEFAULT FALSE,
    rented BOOLEAN DEFAULT FALSE,
    last_updated TIMESTAMP NULL,
    FOREIGN KEY (player_id) REFERENCES users(identifier)
);