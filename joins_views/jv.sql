-- pauling_electronegativity & period_row example join
SELECT m.element_name, m.period_row, a.pauling_electronegativity
FROM periodic.main AS m
INNER JOIN periodic.atomic_properties AS a
ON m.atomic_number_pk = a.atomic_number_pk ;

--example of a triple table join
SELECT m.element_name, n.natural_occurence_name, b.block_name
FROM periodic.natural_occurrence AS n
LEFT JOIN periodic.block AS b ON n.atomic_number_PK = b.atomic_number_PK
INNER JOIN periodic.main AS m ON b.atomic_number_PK = m.atomic_number_PK ;

-- column & melting_point nested subquery statement example
SELECT m.element_name, m.group_column_FK AS group_column , y.melting_point
FROM periodic.main AS m, periodic.physical_properties AS y
WHERE y.atomic_number_pk IN
  ( SELECT m.atomic_number_pk FROM periodic.main AS m WHERE m.period_row IN
    ( SELECT p.periodic_table_row_num_PK FROM periodic.period AS p
      WHERE p.number_electron_shells < 4 ) )
AND m.atomic_number_pk = y.atomic_number_pk ;

-- various radii measurements example of view creation
CREATE VIEW radii_view
  (element_name, covalent_radius, atomic_radius, van_der_waals_radius)
AS SELECT m.element_name, p.covalent_radius, p.atomic_radius, p.van_der_waals_radius
FROM periodic.main AS m INNER JOIN periodic.atomic_properties AS p
ON m.atomic_number_pk = p.atomic_number_pk WHERE m.atomic_number_pk < 50 ;

--udf to return the electron_configuration given element_name
CREATE FUNCTION elec_config(VARCHAR(20)) RETURNS TEXT AS
$$
SELECT f.electron_configuration FROM periodic.electron_configuration AS f
WHERE f.id =
  (SELECT e.electron_configuration_id_FK FROM periodic.elec_config_mapping AS e
  WHERE e.atomic_number_pk =
    (SELECT m.atomic_number_pk FROM periodic.main AS m
    WHERE m.element_name = $1 ) ) ;
$$ LANGUAGE sql;
