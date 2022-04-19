1. Inner join: regresa todas las instancias que cumplen con la condición.
2. Para hacer un inner join también se puede usar USING en lugar de una condición o especificar INNER JOIN

SELECT *
FROM district_2020 JOIN district_2035
USING (id)
ORDER BY district_2020.id;

3. || concatenate
4. RIGHT o LEFT JOIN te regresa todos los valores de la tabla (izq o derecha) aunque no haya ninguna coincidencia.

SELECT *
FROM district_2020 LEFT JOIN district_2035
ON district_2020.id = district_2035.id
ORDER BY district_2020.id;

5. FULL o FULL OUTER JOIN Te regresa las 2 tablas unidas sin importar que la condición de cumpla
6. CROSS JOIN te regresa todos los elementos de la primera tabla combinados con todos los elementos de la segunda tabla.
7. Puedes unir más de dos tablas. Siempre se unen de dos en dos.
8. UNION: se usa para juntar dos tablas que tengan las mismas columnas. Remueve los duplicados. Los nombres de las columnas tendrían que ser identicos.
9. UNION ALL: como UNION pero no elimina los duplicados.
10. INTERSECT: filas que son idénticas en las dos tablas.
