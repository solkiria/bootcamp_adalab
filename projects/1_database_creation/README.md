# Database creation Project
## Introduction
This folder has all the files used to create a database for an inmaginary client that is doing a digital transformation of its data. This client needs to agregate several files into one database that holds all tha information from different tables.
This client gives 3 files:
- XML file (data_xml.xml)
- txt file (data_txt.txt)
- sql file (data_sql.sql)

As an additional task, the obtained tables should be partially processed. Moreover, the data processing system must be automatized, in order to be able to receive future data periodically.

## Solution
The code created to solve my client's problem is organised as follows:
- __sql_code.sql__ : sql file created to create the database in sql, manage the sql file given by my client and clean some of the data in thi table. It has an introduction and explanation of the sql part.
- __txt_code3.ipynb__ : jupyter file with the code used to manage the txt file. It has an introduction and explanation of the txt part.
- __DEF_limpieza_xml.ipynb__ : jupyter file with the code used to manage the XML file. It has an introduction and explanation of the XML part.
- __productowner_code.ipynb__ : jupyter file with the code used by the product owner after executing 'sql_code.sql' to clean and add the txt and XML files to the database. My client would have just to execute the jupyter file form the beggining and the magic would happen.

This was my very first project. It is improvable, but it was a good beggining.