-- create table: physical_properties
CREATE TABLE physical_properties (
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
[insert ddl statement here]

-- create table: group
[insert ddl statement here]

-- create table: block
[insert ddl statement here]

-- create table: period
[insert ddl statement here]

-- create table: electron_configuration
CREATE TABLE electron_configuration (
  id SERIAL PRIMARY KEY ,
  electron_configuration TEXT ) ;
  /*
  rather than include the atomic_number and core_charge fields in this table
  I thought it might be better to create a separate table (elec_config_mapping)
  to map the relationship between atomic_number and electron_configuration_id .
  */
ALTER SEQUENCE electron_configuration_id_seq RESTART WITH 1001 ;

-- create table: elec_config_mapping
CREATE TABLE elec_config_mapping (
  atomic_number_PK INTEGER ,
  electron_configuration_id_FK INT REFERENCES electron_configuration ( id ) ,
  core_charge  /* not sure about the data type for this field */ ) ;

-- create table: atomic_properties
CREATE TABLE atomic_properties (
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
[insert ddl statement here]

-- create table: element_category
[insert ddl statement here]
