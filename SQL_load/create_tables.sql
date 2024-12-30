-- Create tables
CREATE TABLE public.anno_scolastico
(
    ANNOSCOLASTICO INT PRIMARY KEY
);

CREATE TABLE public.location
(
    PROVINCIA TEXT PRIMARY KEY,
    REGIONE TEXT,
    AREAGEOGRAFICA TEXT
);

CREATE TABLE public.tipoistituto
(
    DESCRIZIONETIPOLOGIAGRADOISTRUZIONESCUOLA TEXT PRIMARY KEY,
    TIPO_SCUOLA TEXT
);

CREATE TABLE public.anagrafe
(
    AREAGEOGRAFICA TEXT,	
    REGIONE TEXT,
    PROVINCIA TEXT,
    CODICESCUOLA TEXT PRIMARY KEY,
    DENOMINAZIONESCUOLA TEXT,
    INDIRIZZOSCUOLA	TEXT,
    CAPSCUOLA INT,
    CODICECOMUNESCUOLA TEXT,
    DESCRIZIONECOMUNE TEXT,
    DESCRIZIONETIPOLOGIAGRADOISTRUZIONESCUOLA TEXT,	
    INDIRIZZOEMAILSCUOLA TEXT,	
    INDIRIZZOPECSCUOLA	TEXT, 
    SITOWEBSCUOLA TEXT, 
    CODICEISTITUTORIFERIMENTO TEXT,
    DENOMINAZIONEISTITUTORIFERIMENTO TEXT,
    DESCRIZIONECARATTERISTICASCUOLA	TEXT,
    INDICAZIONESEDEDIRETTIVO TEXT,
    INDICAZIONESEDEOMNICOMPRENSIVO TEXT,
    SEDESCOLASTICA TEXT,
    FOREIGN KEY (DESCRIZIONETIPOLOGIAGRADOISTRUZIONESCUOLA) REFERENCES public.tipoistituto (DESCRIZIONETIPOLOGIAGRADOISTRUZIONESCUOLA)
);


CREATE TABLE public.distrib_cittadinanza
(
    ANNOSCOLASTICO INT,
    CODICESCUOLA TEXT,
    ORDINESCUOLA TEXT,
    ANNOCORSO INT,
    ALUNNI INT,
    ALUNNICITTADINANZAITALIANA	INT,
    ALUNNICITTADINANZANONITALIANA INT,
    ALUNNICITTADINANZANONITALIANAPAESIUE INT,
    ALUNNICITTADINANZANONITALIANAPAESINONUE INT,
    FOREIGN KEY (CODICESCUOLA) REFERENCES public.anagrafe (CODICESCUOLA),
    FOREIGN KEY (ANNOSCOLASTICO) REFERENCES public.anno_scolastico (ANNOSCOLASTICO)
);


CREATE TABLE public.distrib_eta
(
    ANNOSCOLASTICO INT,
    CODICESCUOLA TEXT,
    ORDINESCUOLA TEXT,
    ANNOCORSO INT,
    FASCIAETA TEXT,
    ALUNNI INT,
    FOREIGN KEY (CODICESCUOLA) REFERENCES public.anagrafe (CODICESCUOLA),
    FOREIGN KEY (ANNOSCOLASTICO) REFERENCES public.anno_scolastico (ANNOSCOLASTICO)
);

CREATE TABLE public.distrib_genere
(
    ANNOSCOLASTICO INT,
    CODICESCUOLA TEXT,
    ORDINESCUOLA TEXT,
    ANNOCORSO INT,
    CLASSI INT,
    ALUNNIMASCHI INT,
    ALUNNIFEMMINE INT,
    FOREIGN KEY (CODICESCUOLA) REFERENCES public.anagrafe (CODICESCUOLA),
    FOREIGN KEY (ANNOSCOLASTICO) REFERENCES public.anno_scolastico (ANNOSCOLASTICO)
);

CREATE TABLE public.distrib_ind_secondaria
(
    ANNOSCOLASTICO INT,
    CODICESCUOLA TEXT,
    ORDINESCUOLA TEXT,
    ANNOCORSO INT,
    TIPOPERCORSO TEXT,
    PERCORSO TEXT,
    INDIRIZZO TEXT,
    ALUNNIMASCHI INT,
    ALUNNIFEMMINE INT,
    FOREIGN KEY (CODICESCUOLA) REFERENCES public.anagrafe (CODICESCUOLA),
    FOREIGN KEY (ANNOSCOLASTICO) REFERENCES public.anno_scolastico (ANNOSCOLASTICO)
);

CREATE TABLE public.num_bambini_cittadinanza
(
    ANNOSCOLASTICO INT,
    CODICESCUOLA TEXT,
    BAMBINICITTADINANZAITALIANA INT,
    BAMBINICITTADINANZANONITALIANA INT,
    FOREIGN KEY (CODICESCUOLA) REFERENCES public.anagrafe (CODICESCUOLA),
    FOREIGN KEY (ANNOSCOLASTICO) REFERENCES public.anno_scolastico (ANNOSCOLASTICO)
);

CREATE TABLE public.num_bambini
(
    ANNOSCOLASTICO INT,
    CODICESCUOLA TEXT,
    CLASSI INT,
    BAMBINIMASCHI INT,
    BAMBINIFEMMINE INT,
    FOREIGN KEY (CODICESCUOLA) REFERENCES public.anagrafe (CODICESCUOLA),
    FOREIGN KEY (ANNOSCOLASTICO) REFERENCES public.anno_scolastico (ANNOSCOLASTICO),
    FOREIGN KEY (PROVINCIA) REFERENCES public.location (PROVINCIA)
);

CREATE TABLE public.num_docenti_indet
(
    ANNOSCOLASTICO INT,
    PROVINCIA TEXT,
    ORDINESCUOLA TEXT,
    TIPOPOSTO TEXT,
    FASCIAETA TEXT,
    DOCENTITITOLARIMASCHI INT,
    DOCENTITITOLARIFEMMINE INT,
    FOREIGN KEY (ANNOSCOLASTICO) REFERENCES public.anno_scolastico (ANNOSCOLASTICO),
    FOREIGN KEY (PROVINCIA) REFERENCES public.location (PROVINCIA)
);

CREATE TABLE public.num_docenti_suppl
(
    ANNOSCOLASTICO INT,
    PROVINCIA TEXT,
    ORDINESCUOLA TEXT,
    TIPOPOSTO TEXT,
    TIPOSUPPLENZA TEXT,
    FASCIAETA TEXT,
    DOCENTISUPPLENTIMASCHI INT,
    DOCENTISUPPLENTIFEMMINE INT,
    FOREIGN KEY (ANNOSCOLASTICO) REFERENCES public.anno_scolastico (ANNOSCOLASTICO)
    FOREIGN KEY (PROVINCIA) REFERENCES public.location (PROVINCIA)
);


CREATE TABLE public.codice_livello (
    TIPOLOGIAVOCE TEXT,
    CODICELIVELLO1 TEXT,
    DESCRIZIONELIVELLO1 TEXT,
    CODICELIVELLO2 TEXT,
    DESCRIZIONELIVELLO2 TEXT
);

CREATE TABLE public.bilancio_consuntivo
(
    ANNOSCOLASTICO INT,
    ANNOFINANZIARIO INT,
    REGIONE TEXT,
    CODICESCUOLA TEXT,
    DATAAPPROVAZIONEDS TEXT,
    DATAAPPROVAZIONEGIUNTA TEXT,
    DATAAPPROVAZIONECONSIGLIO TEXT,
    TIPOLOGIAVOCE TEXT,
    CODICELIVELLO1 TEXT,
    CODICELIVELLO2 TEXT,
    IMPORTO NUMERIC,
    IMPORTOACCERTATOIMPEGNATO NUMERIC,
    IMPORTORISCOSSOPAGATO NUMERIC,
    IMPORTODARISCUOTEREDAPAGARE NUMERIC,
    FOREIGN KEY (ANNOSCOLASTICO) REFERENCES public.anno_scolastico (ANNOSCOLASTICO),
    FOREIGN KEY (CODICESCUOLA) REFERENCES public.anagrafe (CODICESCUOLA)
);

--ADD 202425 in anno_scolastico
INSERT INTO anno_scolastico (annoscolastico)
VALUES (202425);

--String manipulations
UPDATE anagrafe
SET regione = 'FRIULI-VENEZIA GIULIA' 
WHERE regione = 'FRIULI-VENEZIA G.';

UPDATE location
SET regione = 'FRIULI-VENEZIA GIULIA' 
WHERE regione = 'FRIULI-VENEZIA G.';

UPDATE bilancio_consuntivo
SET regione = 'FRIULI-VENEZIA GIULIA' 
WHERE regione = 'FRIULI-VENEZIA G.';

UPDATE public.tipoistituto
SET tipo_scuola = 'IST PROFESSIONALE'
WHERE tipo_scuola = 'IST PROFESSIONAL';

UPDATE public.tipoistituto
SET tipo_scuola = 'SCUOLA SEC SECONDO GRADO NON STATALE'
WHERE tipo_scuola = 'SCUOLA SEC SECONDO GRADO';

--Let's create some useful columns
ALTER TABLE public.codice_livello 
ADD COLUMN CODICELIVELLOKEY TEXT,
ADD COLUMN DESCRIZIONE TEXT;

UPDATE public.codice_livello
SET
    CODICELIVELLOKEY = CODICELIVELLO1 || CODICELIVELLO2,
    DESCRIZIONE = CONCAT(DESCRIZIONELIVELLO1,' ',DESCRIZIONELIVELLO2);

ALTER TABLE public.codice_livello
ADD CONSTRAINT codice_livello_pkey PRIMARY KEY (CODICELIVELLOKEY);

ALTER TABLE public.bilancio_consuntivo
ADD COLUMN CODICELIVELLOKEY TEXT;

UPDATE public.bilancio_consuntivo
SET CODICELIVELLOKEY = CODICELIVELLO1 || CODICELIVELLO2;

ALTER TABLE num_docenti_indet ADD COLUMN docenti INTEGER;

UPDATE num_docenti_indet
SET docenti = docentititolarimaschi + docentititolarifemmine;

ALTER TABLE num_docenti_suppl ADD COLUMN docenti INTEGER;

UPDATE num_docenti_suppl
SET docenti = docentisupplentimaschi + docentisupplentifemmine;

ALTER TABLE distrib_ind_secondaria ADD COLUMN alunni INTEGER;

UPDATE distrib_ind_secondaria
SET alunni = alunnimaschi + alunnifemmine;


-- Set ownership of the tables to the postgres user
ALTER TABLE public.anagrafe OWNER to postgres;
ALTER TABLE public.distrib_cittadinanza OWNER to postgres;
ALTER TABLE public.distrib_eta OWNER to postgres;
ALTER TABLE public.distrib_genere OWNER to postgres;
ALTER TABLE public.distrib_ind_secondaria OWNER to postgres;
ALTER TABLE public.num_bambini OWNER to postgres;
ALTER TABLE public.num_bambini_cittadinanza OWNER to postgres;
ALTER TABLE public.num_docenti_indet OWNER to postgres;
ALTER TABLE public.num_docenti_suppl OWNER to postgres;
ALTER TABLE public.anno_scolastico OWNER to postgres;
ALTER TABLE public.location OWNER to postgres;
ALTER TABLE public.tipoistituto OWNER to postgres;
ALTER TABLE public.codice_livello OWNER to postgres;
ALTER TABLE public.bilancio_consuntivo OWNER to postgres;



-- Create indexes on foreign key columns for better performance
CREATE INDEX idx_distrib_cittadinanza_codicescuola ON public.distrib_cittadinanza(codicescuola);
CREATE INDEX idx_distrib_eta_codicescuola ON public.distrib_eta(codicescuola);
CREATE INDEX idx_distrib_genere_codicescuola ON public.distrib_genere(codicescuola);
CREATE INDEX idx_distrib_ind_secondaria_codicescuola ON public.distrib_ind_secondaria(codicescuola);
CREATE INDEX idx_num_bambini_codicescuola ON public.num_bambini(codicescuola);
CREATE INDEX idx_num_bambini_cittadinanza_codicescuola ON public.num_bambini_cittadinanza(codicescuola);
CREATE INDEX idx_bilancio_consuntivo_codicescuola ON public.bilancio_consuntivo(codicescuola);
CREATE INDEX idx_codice_livello_clkey ON public.codice_livello(codicelivellokey);
CREATE INDEX idx_bilancio_consuntivo_clkey ON public.bilancio_consuntivo(codicelivellokey);