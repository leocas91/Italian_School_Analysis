DROP TABLE public.codice_livello;
DROP TABLE public.bilancio_consuntivo;

UPDATE public.tipoistituto
SET tipo_scuola = 'IST PROFESSIONALE'
WHERE tipo_scuola = 'IST PROFESSIONAL';

UPDATE public.tipoistituto
SET tipo_scuola = 'SCUOLA SEC SECONDO GRADO NON STATALE'
WHERE tipo_scuola = 'SCUOLA SEC SECONDO GRADO';