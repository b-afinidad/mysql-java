DROP TABLE IF EXISTS material; 
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category; 
DROP TABLE IF EXISTS category; 
DROP TABLE IF EXISTS project; 

CREATE TABLE project ( 
project_id int AUTO_INCREMENT NOT NULL, 
project_name VARCHAR(128) NOT NULL, 
estimated_hours DECIMAL(7,2), 
actual_hours DECIMAL(7,2), 
difficulty INT, 
notes TEXT,
PRIMARY KEY (project_id)
); 

CREATE TABLE category ( 
category_id INT AUTO_INCREMENT NOT NULL, 
category_name VARCHAR(128) NOT NULL,
PRIMARY KEY (category_id)
); 

CREATE TABLE project_category ( 
project_id INT NOT NULL, 
category_id INT NOT NULL,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
UNIQUE KEY (project_id, category_id)
); 

CREATE TABLE step( 
step_id INT AUTO_INCREMENT NOT NULL, 
project_id INT NOT NULL, 
step_text TEXT, 
step_order INT NOT NULL,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
); 

CREATE TABLE material( 
material_id INT NOT NULL, 
project_id INT NOT NULL, 
material_name VARCHAR(128) NOT NULL, 
num_required INT, 
cost DECIMAL(7,2),
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Hang a door', 4, 3, 3, 'Use door hangers from Home Depot'); 
INSERT INTO material (material_id, project_id, material_name, num_required, cost) VALUES (1, 1, 'Door hangers', 8, 1); 
INSERT INTO material (material_id, project_id, material_name, num_required, cost) VALUES (2, 1, 'Screws', 20, 4.5); 
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Align hangers on opening side', 1); 
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Screw hangers into frame', 2); 
INSERT INTO category (category_id, category_name) VALUES (1, 'Doors and Windows'),(2, 'Repairs'),(3, 'Gardening'); 
INSERT INTO project_category (project_id, category_id) VALUES (1, 1),(1, 2);