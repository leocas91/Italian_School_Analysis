--Analysis of the budget
SELECT 
    b.annoscolastico,
    a.regione regione,
    a.provincia provincia,
    c.descrizionelivello1 descrizione1,
    c.descrizionelivello2 descrizione2,
    c.tipologiavoce tipo,
    sum(b.importo) importo  
FROM bilancio_consuntivo b
INNER JOIN codice_livello c ON c.codicelivellokey = b.codicelivellokey
INNER JOIN anagrafe a ON a.codicescuola = b.codicescuola
GROUP BY b.annoscolastico, a.regione, a.provincia, c.tipologiavoce, c.descrizionelivello1, c.descrizionelivello2
ORDER BY importo DESC;

--% state, regional, private funds by region and province
SELECT 
    a.regione AS regione,
    a.provincia AS provincia2,
    b.annoscolastico AS anno,
    SUM(b.importo) AS importo,
    SUM(
        CASE 
            WHEN c.descrizionelivello1 IN (
                'CONTRIBUTI DA PRIVATI',
                'FINANZIAMENTI DALLA REGIONE',
                'FINANZIAMENTI DALLO STATO',
                'FINANZIAMENTI DA ENTI LOCALI O DA ALTRE ISTITUZIONI PUBBLICHE'
            )  
            THEN b.importo 
            ELSE 0 
        END
    ) AS funds,
    SUM(
        CASE 
            WHEN c.descrizionelivello1 IN (
                'CONTRIBUTI DA PRIVATI',
                'FINANZIAMENTI DALLA REGIONE',
                'FINANZIAMENTI DALLO STATO',
                'FINANZIAMENTI DA ENTI LOCALI O DA ALTRE ISTITUZIONI PUBBLICHE'
            )
            THEN b.importo 
            ELSE 0 
        END
    ) / NULLIF(SUM(b.importo), 0)*100 AS perc_funds
FROM bilancio_consuntivo b
INNER JOIN codice_livello c ON c.codicelivellokey = b.codicelivellokey
INNER JOIN anagrafe a ON a.codicescuola = b.codicescuola
WHERE b.tipologiavoce = 'ENTRATA'
GROUP BY a.regione, a.provincia, b.annoscolastico
ORDER BY importo DESC;

--% EU funds by region and province
SELECT 
    a.regione AS regione,
    a.provincia AS provincia,
    b.annoscolastico AS anno,
    SUM(b.importo) AS importo,
    SUM(
        CASE 
            WHEN c.descrizione LIKE '%EURO%' THEN b.importo 
            ELSE 0 
        END
    ) AS EU_funds,
    SUM(
        CASE 
            WHEN c.descrizione LIKE '%EURO%' THEN b.importo 
            ELSE 0 
        END
    ) / NULLIF(SUM(b.importo), 0)*100 AS perc_EU_funds
FROM bilancio_consuntivo b
INNER JOIN codice_livello c ON c.codicelivellokey = b.codicelivellokey
INNER JOIN anagrafe a ON a.codicescuola = b.codicescuola
WHERE b.tipologiavoce = 'ENTRATA'
GROUP BY a.regione, a.provincia, b.annoscolastico
ORDER BY importo DESC;



