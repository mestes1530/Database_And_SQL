/* Used to link to correct Database */
USE [db_zooTest2]
GO

/* Assignmnet 1 */
SELECT * FROm tb1_habitat;

/* Assignmnet 2 */
SELECT * FROM tb1_species
WHERE species_order = 3;

/* Assignment 3 */
SELECT * FROM tb1_nutrition
WHERE nutrition_cost <= 600.00;

/* Assignmnet 4 */
SELECT * FROM tb1_species
WHERE species_nutrition BETWEEN 2202 AND 2206;

/* Assignmnet 5 */
SELECT species_name AS 'Species Name:', nutrition_type AS 'Nutrittion Type:'
FROM tb1_species
INNER JOIN tb1_nutrition ON species_nutrition = nutrition_id;

/* Assignmnet 6 */
SELECT specialist_fname, specialist_lname, specialist_contact
FROM tb1_specialist
INNER JOIN tb1_care ON care_specialist = specialist_id
INNER JOIN tb1_species ON species_care = care_id
WHERE species_name = 'penguin';
