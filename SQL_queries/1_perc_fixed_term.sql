-- % of fixed term teachers

WITH titolari AS (
SELECT 
    a.annoscolastico anno_scolastico,
    sum(i.docenti) docenti_titolari
FROM
    anno_scolastico a
INNER JOIN num_docenti_indet i ON a.annoscolastico = i.annoscolastico
GROUP BY a.annoscolastico
)
SELECT 
    s.annoscolastico anno,
    sum(s.docenti) supplenti,
    titolari.docenti_titolari titolari,
    ROUND(sum(s.docenti)::NUMERIC / (sum(s.docenti) + titolari.docenti_titolari)*100, 2) perc_supplenti
    FROM num_docenti_suppl s
INNER JOIN titolari ON s.annoscolastico = titolari.anno_scolastico
GROUP BY s.annoscolastico,titolari.docenti_titolari;


-- % of fixed term by region in 22-23
WITH admin AS (
SELECT
    i.provincia provincia,
    sum(i.docenti) titolari,
    (SELECT 
        sum(s.docenti)
    FROM num_docenti_suppl s
    WHERE s.annoscolastico = 202223 AND
    s.provincia = i.provincia
    ) supplenti
FROM num_docenti_indet i
INNER JOIN location l ON l.provincia = i.provincia
WHERE i.annoscolastico = 202223
GROUP BY i.provincia
)
SELECT 
    provincia, 
    titolari, 
    supplenti,
    ROUND(supplenti::NUMERIC / (titolari + supplenti)*100, 2) perc_supplenti
FROM admin
ORDER BY perc_supplenti DESC;


    

