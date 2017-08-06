-- pauling_electronegativity & period_row example join
SELECT m.element_name, m.period_row, a.pauling_electronegativity FROM periodic.main AS m
INNER JOIN periodic.atomic_properties AS a ON m.atomic_number_pk = a.atomic_number_pk ;

-- column & melting_point nested subquery statement example
SELECT m.element_name, m.group_column_FK AS group_column , y.melting_point
FROM periodic.main AS m, periodic.physical_properties AS y
WHERE y.atomic_number_pk IN
  ( SELECT m.atomic_number_pk FROM periodic.main AS m WHERE m.period_row IN
    ( SELECT p.periodic_table_row_num_PK FROM periodic.period AS p WHERE p.number_electron_shells < 4 ) )
AND m.atomic_number_pk = y.atomic_number_pk ;

-- various radii measurements example of view creation
CREATE VIEW radii_view (element_name, covalent_radius, atomic_radius, van_der_waals_radius)
AS SELECT m.element_name, p.covalent_radius, p.atomic_radius, p.van_der_waals_radius
FROM periodic.main AS m INNER JOIN periodic.atomic_properties AS p ON m.atomic_number_pk = p.atomic_number_pk WHERE m.atomic_number_pk < 50 ;
