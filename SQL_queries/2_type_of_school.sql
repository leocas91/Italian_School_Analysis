--How the choice of the type of school is influenced by the nationality (private schools excluded)

SELECT 
    t.tipo_scuola tipo,
    sum(d.alunnicittadinanzanonitalianapaesinonue) stranieri,
    sum(d.alunnicittadinanzaitaliana) italiani,
    ROUND(sum(d.alunnicittadinanzanonitalianapaesinonue)::NUMERIC / (sum(d.alunnicittadinanzanonitalianapaesinonue) + sum(d.alunnicittadinanzaitaliana))*100, 2) perc_stranieri
FROM distrib_cittadinanza d
INNER JOIN anagrafe a ON d.codicescuola = a.codicescuola
INNER JOIN tipoistituto t ON a.descrizionetipologiagradoistruzionescuola = t.descrizionetipologiagradoistruzionescuola
WHERE annoscolastico = 202223 AND
    ordinescuola = 'SCUOLA SECONDARIA II GRADO' AND
    t.tipo_scuola <> 'SCUOLA SEC SECONDO GRADO NON STATALE'
GROUP BY t.tipo_scuola
ORDER BY perc_stranieri DESC;


--Analyze the distribution in the territory (to be done)
SELECT 
    l.areageografica,
    t.tipo_scuola tipo,
    sum(d.alunni) alunni
FROM distrib_cittadinanza d
INNER JOIN anagrafe a ON d.codicescuola = a.codicescuola
INNER JOIN location l ON a.provincia = l.provincia
INNER JOIN tipoistituto t ON a.descrizionetipologiagradoistruzionescuola = t.descrizionetipologiagradoistruzionescuola
WHERE annoscolastico = 202223 AND
    ordinescuola = 'SCUOLA SECONDARIA II GRADO' AND
    t.tipo_scuola <> 'SCUOLA SEC SECONDO GRADO NON STATALE'
GROUP BY l.areageografica, t.tipo_scuola;

--Trend of students depending on type of school (secondary) in the territory
SELECT
    d.annoscolastico anno,
    a.areageografica area,
    CONCAT(d.tipopercorso, ' ', d.percorso) percorso,
    sum(alunni) alunni
FROM distrib_ind_secondaria d
INNER JOIN anagrafe a ON a.codicescuola = d.codicescuola
GROUP BY d.annoscolastico, a.areageografica, CONCAT(d.tipopercorso, ' ', d.percorso)
ORDER BY 1,2;

