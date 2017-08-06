-- drop all previous instances of the db tables and views
DROP TABLE physical_properties CASCADE ;
DROP TABLE natural_occurrence CASCADE ;
DROP TABLE main CASCADE ;
DROP TABLE element_group CASCADE ;
DROP TABLE period CASCADE ;
DROP TABLE electron_configuration CASCADE ;
DROP TABLE elec_config_mapping CASCADE ;
DROP TABLE atomic_properties CASCADE ;
DROP TABLE categories CASCADE ;
DROP TABLE element_category CASCADE ;
DROP TABLE block CASCADE ;
DROP SEQUENCE electron_configuration_id_seq CASCADE ;
/* PLEASE ADD TO THIS SECTION A DROP STATEMENT FOR NEW VIEWS  */

-- create a schema so that we can apply data_contol_language statements globally
CREATE SCHEMA periodic ;
-- create table: physical_properties
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

-- create table: natural_occurrence
[insert ddl statement here]

-- create table: main
CREATE TABLE periodic.main (
  atomic_number_PK INTEGER PRIMARY KEY,
  element_name VARCHAR(20),
  Symbol VARCHAR(3),
  period_row INTEGER,
  group_column_FK INTEGER ) ;

-- create table: element_group
[insert ddl statement here]

-- create table: period
[insert ddl statement here]

-- create table: electron_configuration
CREATE TABLE periodic.electron_configuration (
  id SERIAL PRIMARY KEY ,
  electron_configuration TEXT ) ;
ALTER SEQUENCE electron_configuration_id_seq RESTART WITH 1001 ;

-- create table: elec_config_mapping
CREATE TABLE periodic.elec_config_mapping (
  atomic_number_PK INTEGER PRIMARY KEY,
  electron_configuration_id_FK INTEGER
    REFERENCES electron_configuration ( id ) ;


-- create table: atomic_properties
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
    REFERENCES elec_config_mapping( electron_configuration_id_FK ) ) ;

-- create table: categories
CREATE TABLE periodic.categories (
  category_id_PK INTEGER PRIMARY KEY ,
  category TEXT ) ;

-- create table: element_category
CREATE TABLE periodic.element_category (
  atomic_number_PK INTEGER PRIMARY KEY,
  category TEXT,
  category_id_FK INTEGER
    REFERENCES categories( category_id_PK ) );

-- create table: block
CREATE TABLE periodic.block (
  atomic_number_PK INTEGER PRIMARY KEY,
  block_id INTEGER ,
  block_name VARCHAR(1),
  category_id_FK INTEGER
    REFERENCES categories( category_id_PK ) ) ;
