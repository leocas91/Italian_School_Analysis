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

--Number of children in nursery school
SELECT
     annoscolastico school_year,
     sum(bambinimaschi + bambinifemmine) children,
     ROUND(
        (SUM(bambinimaschi + bambinifemmine) - LAG(SUM(bambinimaschi + bambinifemmine)) OVER (ORDER BY annoscolastico)) 
        * 100.0 
        / NULLIF(LAG(SUM(bambinimaschi + bambinifemmine)) OVER (ORDER BY annoscolastico), 0),
        2
    ) AS perc_YOY_variation ,
    ROUND(
        (SUM(bambinimaschi + bambinifemmine) - FIRST_VALUE(SUM(bambinimaschi + bambinifemmine)) OVER (ORDER BY annoscolastico))
        * 100.0
        / NULLIF(FIRST_VALUE(SUM(bambinimaschi + bambinifemmine)) OVER (ORDER BY annoscolastico), 0),
        2
    ) AS perc_YTD_variation
FROM num_bambini
GROUP BY annoscolastico
ORDER BY annoscolastico;