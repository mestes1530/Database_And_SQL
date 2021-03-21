/* COMMENTED OUT SINCE NOT NEEDED
/* Used to create the database titled db_zooTest2 */
CREATE DATABASE db_zooTest2
GO
/* Speciefies the database used */
USE db_zooTest2
*/

/* Creates a procuder that builds a zoo database */
CREATE PROCEDURE createZooDB
AS
BEGIN

	/* Creates all the tables used by the database */
	CREATE TABLE tb1_animalia (
		animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		animalia_type VARCHAR(50) NOT NULL
	);

	CREATE TABLE tb1_class (
		class_id INT PRIMARY KEY NOT NULL IDENTITY (100, 1),
		class_type VARCHAR(50) NOT NULL
	);

	CREATE TABLE tb1_order (
		order_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		order_type VARCHAR(50) NOT NULL
	);

	CREATE TABLE tb1_care (
		care_id VARCHAR(50) PRIMARY KEY NOT NULL,
		care_type VARCHAR(50) NOT NULL,
		care_specialist INT NOT NULL
	);

	CREATE TABLE tb1_nutrition (
		nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (2200,1),
		nutrition_type VARCHAR(50) NOT NULL,
		nutrition_cost MONEY NOT NULL
	);

	CREATE TABLE tb1_habitat (
		habitat_id INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
		habitat_type VARCHAR(50) NOT NULL,
		habitat_cost MONEY NOT NULL
	);

	CREATE TABLE tb1_specialist (
		specialist_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		specialist_fname VARCHAR(50) NOT NULL,
		specialist_lname VARCHAR(50) NOT NULL,
		specialist_contact VARCHAR(50) NOT NULL
	);

	CREATE TABLE tb1_species (
		species_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		species_name VARCHAR(50) NOT NULL,
		species_animalia INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tb1_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tb1_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_order INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tb1_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tb1_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_nutrition INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tb1_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
		species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tb1_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

	/* Fills in the recently created tables with data */
	INSERT INTO tb1_animalia
		(animalia_type)
		VALUES
		('vertebrate'),
		('invertebrates')
	;
	SELECT * FROM tb1_animalia;

	INSERT INTO tb1_class
		(class_type)
		VALUES
		('bird'),
		('reptilian'),
		('mammal'),
		('arthropod'),
		('fish'),
		('worm'),
		('cnidaria'),
		('echinoderm')
	;
	SELECT * FROM tb1_class;

	INSERT INTO tb1_order
		(order_type)
		VALUES
		('carnivore'),
		('herbivore'),
		('omnivore')
	;
	SELECT * FROM tb1_order;

	INSERT INTO tb1_care
		(care_id, care_type, care_specialist)
		VALUES
		('care_0', 'replace the straw', 1),
		('care_1', 'repair or replace broken toys', 4),
		('care_2', 'bottle feed vitamins', 1),
		('care_3', 'human contact_pet subject', 2),
		('care_4', 'clean up animal waste', 1),
		('care_5', 'move subject to exercise pen', 3),
		('care_6', 'drain and refill aquarium', 1),
		('care_7', 'extensive dental work', 3)
	;
	SELECT * FROM tb1_care;

	INSERT INTO tb1_nutrition
		(nutrition_type, nutrition_cost)
		VALUES
		('raw fish', 1500),
		('living rodents', 600),
		('mixture of fruit and rice', 800),
		('warm bottle of milk', 600),
		('syringe fed broth', 600),
		('lard and seed mix', 300),
		('aphids', 150),
		('vitamins and marrow', 3500)
	;
	SELECT * FROM tb1_nutrition;

	INSERT INTO tb1_habitat
		(habitat_type, habitat_cost)
		VALUES
		('tundra', 40000),
		('grassy knoll with trees', 12000),
		('10 ft pond and rocks', 30000),
		('icy aquarium with snowy facade', 50000),
		('short grass, shade and moat', 50000),
		('netted forest atrium', 10000),
		('jungle vines and winding branches', 15000),
		('cliff with shaded cave', 15000)
	;
	SELECT * FROM tb1_habitat;

	INSERT INTO tb1_specialist
		(specialist_fname, specialist_lname, specialist_contact)
		VALUES
		('margaret', 'nguyen', '384-576-2899'),
		('mary', 'fischer', '384-784-4856'),
		('arnold', 'holden', '385-475-3944'),
		('kem', 'byesan', '384-485-4855'),
		('delmonte', 'fyedo', '768-288-3749')
	;
	SELECT * FROM tb1_specialist;

	INSERT INTO tb1_species
		(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
		VALUES
		('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
		('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
		('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
		('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
		('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
		('panda', 1, 102, 3, 5006, 2202, 'care_4'),
		('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
		('grey wolf', 1, 102, 1, 5000, 2201, 'care_4')
	;
	SELECT * FROM tb1_species;

	/* The following queries database using INNER JOINS. */
	SELECT
		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type, a5.habitat_type,
		a6.nutrition_type, a7.care_type
		FROM tb1_species a1
		INNER JOIN tb1_animalia a2 ON a2.animalia_id = a1.species_animalia
		INNER JOIN tb1_class a3 ON a3.class_id = a1.species_class
		INNER JOIN tb1_order a4 ON a4.order_id = a1.species_order
		INNER JOIN tb1_habitat a5 ON a5.habitat_id = a1.species_habitat
		INNER JOIN tb1_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
		INNER JOIN tb1_care a7 ON a7.care_id = a1.species_care
		WHERE species_name = 'brown bear'
	;

	SELECT
		a1.species_name, a2.animalia_type,
		a3.class_type, a4.order_type, a5.habitat_type,
		a6.nutrition_type, a7.care_type
		FROM tb1_species a1
		INNER JOIN tb1_animalia a2 ON a2.animalia_id = a1.species_animalia
		INNER JOIN tb1_class a3 ON a3.class_id = a1.species_class
		INNER JOIN tb1_order a4 ON a4.order_id = a1.species_order
		INNER JOIN tb1_habitat a5 ON a5.habitat_id = a1.species_habitat
		INNER JOIN tb1_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
		INNER JOIN tb1_care a7 ON a7.care_id = a1.species_care
		WHERE species_name = 'ghost bat'
	;

	SELECT
		a1.species_name, a2.habitat_type, a2.habitat_cost,
		a3.nutrition_type, a3.nutrition_cost
		FROM tb1_species a1
		INNER JOIN tb1_habitat a2 ON a2.habitat_id = a1.species_habitat
		INNER JOIN tb1_nutrition a3 ON a3.nutrition_id = a1.species_nutrition
		WHERE species_name = 'ghost bat'
	;

END