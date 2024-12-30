# Introduction
This project aims to analyze the Italian education system, focusing on regional disparities across administrative areas and identifying key factors contributing to the improvement or decline of educational standards.

# Data and Tools
The data used for the analysis come from the [Ministry of Education website](https://dati.istruzione.it/opendata/opendata/catalogo/), specifically from the Open Data section. Among the various topics available on the portal, the focus is primarily on the following themes:
- ***School (SCUOLE)***: Anagraphic information.
- ***Students (STUDENTI)***: Age, gender, nationality.
- ***School employees (PERSONALE SCUOLA)***: Fixed-term and permanent staff.
- ***School Budget (BILANCIO INTEGRATO DELLE SCUOLE)***: Balance sheet data.

The portal covers many topics, and I may explore additional themes in future analyses.

***Tools Used:***
- ***Python***: Given the portal’s structure (one dataset per school year), I used Pandas to append datasets with the same format and perform data cleaning.
- ***PostgreSQL***: I created a database, loaded the cleaned CSV files, and executed queries to explore the data.
- ***Tableau Public***: SQL query results were visualized using Tableau to present insights effectively.

# Database Overview
This section provides a brief overview of the database used in the project.

I created the database using PostgreSQL and imported the CSV files processed with Pandas into separate tables. Detailed SQL scripts are available in the GitHub repository under the relevant folder.

# 1 - Fixed Term vs Permanent Contract Teachers
The chart below illustrates the year-over-year increase in fixed-term teachers (latest data: 2022/2023) compared to permanent teachers.

![teachers](assets/1_fixed_vs_permanent.png)

The percentage breakdown is shown in the chart below:

![teachers](assets/1_perc_fixed.png)

These charts highlight a concerning trend: in just seven years, the percentage of fixed-term employees has doubled.

# 2 - WIP
# 3 - WIP

# 4 - School Budget - WIP







