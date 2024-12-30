#Assicuriamoci che le province siano tutte riportate in modo corretto

import pandas as pd

df_anagrafe = pd.read_csv('/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions_for_SQL/anagrafe.csv')
df_supplenti = pd.read_csv('/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions_for_SQL/num_docenti_sup.csv')
df_indeterminati = pd.read_csv('/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions_for_SQL/num_docenti_indet.csv')

#Creiamo file csv con valori unici delle locations e ripuliamo alcune stringhe
df_location = df_anagrafe[["PROVINCIA", "REGIONE", "AREAGEOGRAFICA"]].drop_duplicates("PROVINCIA", keep="first", inplace=False)

str_to_remove = ['FORLI\'-CESENA', r'^MASSA$', 'PESARO E URBINO']
regex_pattern = '|'.join(str_to_remove)
df_location_cleaned= df_location[~df_location['PROVINCIA'].str.contains(regex_pattern, case=False, na=False)]


df_location_cleaned.to_csv(f"/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions_for_SQL/locations.csv", index=False)


#Cleaning province altri dataframes
# Dizionario di sostituzioni
sostituzioni_indet = {
    r'^MASSA$': 'MASSA-CARRARA',
    'BARLETTA-ADRIA-TRANI': 'BARLETTA-ANDRIA-TRANI',
    'FORLI\'-CESENA': 'FORLI-CESENA',
    'MEDIO-CAMPITANO': 'MEDIO CAMPIDANO',
    'MONZA E BRIANZA': 'MONZA-BRIANZA',
    'PESARO E URBINO': 'PESARO-URBINO'
}

df_indeterminati['PROVINCIA'] = df_indeterminati['PROVINCIA'].replace(sostituzioni_indet, regex=True)
df_supplenti['PROVINCIA'] = df_supplenti['PROVINCIA'].replace(sostituzioni_indet, regex= True)

df_indeterminati.to_csv('/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions_for_SQL/num_docenti_indet.csv', index=False)
df_supplenti.to_csv('/Users/leocas91/Documents/SQL/Italian_School_Analysis/Extractions_for_SQL/num_docenti_sup.csv', index=False)

#Cleaning check
#df_location_indet = df_indeterminati[['PROVINCIA']].drop_duplicates('PROVINCIA', keep='first', inplace=False)
#df_location_indet['Check'] = df_location_indet['PROVINCIA'].isin(df_location_cleaned['PROVINCIA'])
#df_location_cleaned['Check'] = df_location_cleaned['PROVINCIA'].isin(df_indeterminati['PROVINCIA'])

#df_location_sup = df_supplenti[['PROVINCIA']].drop_duplicates('PROVINCIA', keep='first', inplace=False)
#df_location_sup['Check'] = df_location_sup['PROVINCIA'].isin(df_location_cleaned['PROVINCIA'])
#df_location_cleaned['Check'] = df_location_cleaned['PROVINCIA'].isin(df_supplenti['PROVINCIA'])



#pd.set_option('display.max_rows', None)
#print(df_location_cleaned[df_location_cleaned['Check']==False].sort_values(by='PROVINCIA'))
#print(df_location_indet[df_location_indet['Check']==False].sort_values(by='PROVINCIA'))
#print(df_location_sup[df_location_sup['Check']==False].sort_values(by='PROVINCIA'))


#Check numero valori distinti
#print(df_location_cleaned['PROVINCIA'].nunique())
#print(df_indeterminati['PROVINCIA'].nunique())
#print(df_supplenti['PROVINCIA'].nunique())


