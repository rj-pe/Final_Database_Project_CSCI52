--**--
--drop all previous instances of the db tables and views
DROP SCHEMA periodic CASCADE ;
/*
DROP TABLE periodic.physical_properties CASCADE ;
DROP TABLE periodic.natural_occurrence CASCADE ;
DROP TABLE periodic.main CASCADE ;
DROP TABLE periodic.element_group CASCADE ;
DROP TABLE periodic.period CASCADE ;
DROP TABLE periodic.electron_configuration CASCADE ;
DROP TABLE periodic.elec_config_mapping CASCADE ;
DROP TABLE periodic.atomic_properties CASCADE ;
DROP TABLE periodic.categories CASCADE ;
DROP TABLE periodic.element_category CASCADE ;
DROP TABLE periodic.block CASCADE ;
DROP SEQUENCE periodic.electron_configuration_id_seq CASCADE ;
uncomment this section only if schema object is not implemented in the build   */

--create a schema so that we can apply data_contol_language statements globally
CREATE SCHEMA periodic ;

--**--
--create table: physical_properties
CREATE TABLE periodic.physical_properties (
    atomic_number_PK INTEGER PRIMARY KEY,
    melting_point NUMERIC ,
    boiling_point NUMERIC ,
    density NUMERIC ,
    specific_volume NUMERIC ,
    brinell_hardness NUMERIC ,
    mohs_hardness NUMERIC ,
    bulk_modulus NUMERIC ,
    shear_modulus NUMERIC ,
    young_modulus NUMERIC ,
    poisson_ratio NUMERIC ,
    refractive_index NUMERIC ,
    speed_of_sound NUMERIC ,
    thermal_conductivity NUMERIC ,
    thermal_expansion NUMERIC ) ;
--insert data physical_properties
/*INSERT INTO periodic.physical_properties VALUES
values ommitted for the sake of clarity in evaluation of ddl
*/
--**--
--create table: natural_occurrence
--[insert ddl statement here]
--insert data: natural_occurrence

--**--
--create table: main
CREATE TABLE periodic.main (
  atomic_number_PK INTEGER PRIMARY KEY,
  element_name VARCHAR(20),
  symbol VARCHAR(3),
  period_row INTEGER,
  group_column_FK INTEGER ) ;
--insert data: main
/* INSERT INTO periodic.main VALUES
values ommitted for the sake of clarity in evaluation of ddl
*/

--**--
--create table: element_group
--[insert ddl statement here]
--insert data:element_group

--**--
--create table: period

CREATE TABLE periodic.period(
  atomic_number_PK INT ,
  periodic_table_row_num_PK INT ,
  number_electron_shells INT,
  PRIMARY KEY( atomic_number_PK, periodic_table_row_num_PK ) ) ;
  --insert data: period
  INSERT INTO periodic.period VALUES


--**--
--create table: electron_configuration
CREATE TABLE periodic.electron_configuration (
  id SERIAL PRIMARY KEY ,
  electron_configuration TEXT ) ;
ALTER SEQUENCE periodic.electron_configuration_id_seq RESTART WITH 1001 ;
--insert data: electron_configuration
/* INSERT INTO periodic.electron_configuration(electron_configuration) VALUES
values ommitted for the sake of clarity in evaluation of ddl
*/

--**--
--create table: elec_config_mapping
CREATE TABLE periodic.elec_config_mapping (
  atomic_number_PK INTEGER PRIMARY KEY,
  electron_configuration_id_FK INTEGER
    REFERENCES periodic.electron_configuration ( id ) ) ;
--insert data: elec_config_mapping
/* INSERT INTO periodic.elec_config_mapping VALUES
values ommitted for the sake of clarity in evaluation of ddl
*/

--**--
--create table: atomic_properties
CREATE TABLE periodic.atomic_properties (
  atomic_number_PK INTEGER PRIMARY KEY ,
  standard_atomic_weight NUMERIC ,
  electron_configuration TEXT ,
  atomic_radius NUMERIC ,
  first_ionization_energy NUMERIC ,
  pauling_electronegativity NUMERIC ,
  electron_affinity NUMERIC ,
  lattice TEXT ,
  covalent_radius NUMERIC ,
  van_der_waals_radius NUMERIC ,
  electron_configuration_id_FK INTEGER
    REFERENCES periodic.electron_configuration ( id ) ) ;
--insert data: atomic_properties
/* INSERT INTO periodic.atomic_properties VALUES
values ommitted for the sake of clarity in evaluation of ddl
*/

--**--
--create table: categories
CREATE TABLE periodic.categories (
  category TEXT ,
  category_id_PK INTEGER PRIMARY KEY ) ;
--insert data: categories
/* INSERT INTO periodic.categories VALUES
values omitted for the sake of clarity and evaluation
*/

--**--
--create table: element_category
CREATE TABLE periodic.element_category (
  atomic_number_PK INTEGER PRIMARY KEY,
  category TEXT,
  category_id_FK INTEGER
    REFERENCES periodic.categories( category_id_PK ) );
--insert data: element_category
/* INSERT INTO periodic.element_category VALUES
values ommitted for the sake of clarity in evaluation of ddl
*/

--**--
-- create table: block
CREATE TABLE periodic.block (
  atomic_number_PK INTEGER PRIMARY KEY,
  block_id VARCHAR(2) ,
  block_name VARCHAR(1),
  category_id_FK INTEGER
    REFERENCES periodic.categories( category_id_PK ) ) ;

-- insert data: block
/* INSERT INTO periodic.block VALUES
values ommitted for the sake of clarity in evaluation of ddl
*/
