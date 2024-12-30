import pandas as pd
import glob


def transform_df(path, nome_file):

    # Percorso ai file CSV (puoi specificare un pattern, ad esempio '*.csv')
    file_path = glob.glob(f"{path}/*.csv")

    # Lista per memorizzare i DataFrame
    dataframes = []

    # Leggi ogni file e aggiungilo alla lista
    for file in file_path:
        df = pd.read_csv(file)
        dataframes.append(df)

     # Unisci tutti i DataFrame in uno solo
    df_concat = pd.concat(dataframes, ignore_index=True)

    # Esporta il risultato
    df_concat.to_csv(f"/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions_for_SQL/{nome_file}.csv", index=False) 


#Per ciascuna cartella, unisco tutti i file richiamando la funzione
#transform_df("/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions/Distribuzione per cittadinanza", "distrib_cittadinanza")
#transform_df("/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions/Distribuzione per indirizzo secondaria 2 grado", "distrib_indirizzo_secondaria")
#transform_df("/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions/Distribuzione studenti età", "distrib_età")
#transform_df("/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions/Distribuzione studenti genere", "distrib_genere")
#transform_df("/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions/Numero bambini", "num_bambini")
#transform_df("/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions/Numero bambini per cittadinanza", "num_bambini_cittadinanza")
#transform_df("/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions/Numero docenti indeterminato", "num_docenti_indet")
#transform_df("/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions/Numero docenti supplenti", "num_docenti_sup")
transform_df("/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions/Bilancio consuntivo", "bilancio_consuntivo")