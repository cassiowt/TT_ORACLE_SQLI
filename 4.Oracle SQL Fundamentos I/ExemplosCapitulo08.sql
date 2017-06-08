SELECT
    tc.id contrato,
    c.nome,
    total
FROM
    tcontratos tc,
    tclientes c
WHERE
        tc.tclientes_id = c.id
    AND
        total > (
            SELECT
                MAX(total)
            FROM
                tcontratos
            WHERE
                tclientes_id = 110
        )
ORDER BY 2;

