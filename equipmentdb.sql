


CREATE TABLE Subdivisions (
    subdivision_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    contact_info TEXT,
    address TEXT,
    notes TEXT
);

CREATE TABLE Equipment_Features (
    feature_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Infrastructure_Requirements (
    requirement_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Equipment (
    equipment_id INT PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    technical_specs TEXT NOT NULL,
    internet_link VARCHAR(1000) NOT NULL,
    subdivision_id INT,
    category_id INT,
    supplier_id INT,
    purpose TEXT,
    estimated_cost DECIMAL(10,2),
    notes TEXT,
    FOREIGN KEY (subdivision_id) REFERENCES Subdivisions(subdivision_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Equipment_to_Features (
    equipment_id INT,
    feature_id INT,
    PRIMARY KEY (equipment_id, feature_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id),
    FOREIGN KEY (feature_id) REFERENCES Equipment_Features(feature_id)
);

CREATE TABLE Equipment_to_Requirements (
    equipment_id INT,
    requirement_id INT,
    PRIMARY KEY (equipment_id, requirement_id),
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id),
    FOREIGN KEY (requirement_id) REFERENCES Infrastructure_Requirements(requirement_id)
);

CREATE TABLE Maintenance (
    maintenance_id INT PRIMARY KEY,
    equipment_id INT,
    maintenance_date DATE NOT NULL,
    description TEXT,
    cost DECIMAL(10,2),
    performed_by VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (equipment_id) REFERENCES Equipment(equipment_id)
);
