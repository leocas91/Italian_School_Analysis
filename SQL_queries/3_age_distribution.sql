--Age distribution over the years
SELECT 
    annoscolastico, 
    fasciaeta,
    sum(alunni) alunni 
FROM distrib_eta
GROUP BY annoscolastico, fasciaeta
ORDER BY fasciaeta, annoscolastico;


--Trend in age groups
SELECT 
    annoscolastico,
    ordinescuola,
    sum(alunni) alunni 
FROM distrib_eta
GROUP BY annoscolastico, ordinescuola
ORDER BY ordinescuola, annoscolastico;

--Number of children in primary school
SELECT
     annoscolastico,
     sum(bambinimaschi + bambinifemmine) bambini,
     ROUND(
        (SUM(bambinimaschi + bambinifemmine) - LAG(SUM(bambinimaschi + bambinifemmine)) OVER (ORDER BY annoscolastico)) 
        * 100.0 
        / NULLIF(LAG(SUM(bambinimaschi + bambinifemmine)) OVER (ORDER BY annoscolastico), 0),
        2
    ) AS variazione_percentuale,
    ROUND(
        (SUM(bambinimaschi + bambinifemmine) - FIRST_VALUE(SUM(bambinimaschi + bambinifemmine)) OVER (ORDER BY annoscolastico))
        * 100.0
        / NULLIF(FIRST_VALUE(SUM(bambinimaschi + bambinifemmine)) OVER (ORDER BY annoscolastico), 0),
        2
    ) AS variazione_percentuale_prima_riga
FROM num_bambini
GROUP BY annoscolastico
ORDER BY annoscolastico;
