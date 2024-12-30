import pandas as pd
import glob


# Percorso ai file CSV (puoi specificare un pattern, ad esempio '*.csv')
file_paths_anagrafe = glob.glob("/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions/Anagrafe scuole/*.csv")

# Lista per memorizzare i DataFrame
dataframes_anagrafe = []

# Leggi ogni file e aggiungilo alla lista
for file in file_paths_anagrafe:
    df = pd.read_csv(file)
    dataframes_anagrafe.append(df)

# Unisci tutti i DataFrame in uno solo
anagrafe = pd.concat(dataframes_anagrafe, ignore_index=True)


# Rimuovi i duplicati
anagrafe_unique = anagrafe.drop_duplicates("CODICESCUOLA", keep="first", inplace=False).drop(columns="ANNOSCOLASTICO", inplace=False)

# Pulizia colonna CAPSCUOLA
anagrafe_unique["CAPSCUOLA"] = anagrafe_unique["CAPSCUOLA"].astype(str).str.replace(r'[^0-9]', '', regex=True)

# Esporta il risultato
anagrafe_unique.to_csv('/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions_for_SQL/anagrafe.csv', index=False)