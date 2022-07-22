# -*- coding: utf-8 -*-

#302 Project - Zeynep Aydıner

#importing libraries
from sqlalchemy import text
import sqlalchemy as db
import pandas as pd

print("Please use PostgreSQL for this project, otherwise it won't work.")
db_username = input('\nPlease input your database username: ')
db_password = input('\nPlease input your database password: ')
db_host = input('\nPlease input your host name: ')

# database connection with sqlalchemy create_engine function
engine = db.create_engine('postgresql://{}:{}@localhost/{}'.format(db_username,db_password, db_host))

#1.	List the disease code and the description of diseases that are caused by “bacteria” (pathogen) and were discovered before 1990.
print('Question-1\n')
sql = '''
    SELECT a.disease_code, a.description
    FROM disease AS a
    INNER JOIN discover AS b
    ON a.disease_code = b.disease_code
    WHERE a.pathogen = 'Bacteria' AND b.first_enc_date < '1990-01-01'
'''
with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))
    
df = pd.DataFrame(query.fetchall())
print(df)

#2.	List the name, surname and degree of doctors who are not specialized in “infectious diseases”.
print('\n***************\n')
print('Question-2\n')
sql = '''
    SELECT DISTINCT a.name, a.surname, b.degree
    FROM users AS a
    INNER JOIN doctor AS b ON a.email = b.email
    INNER JOIN specialize AS c ON c.email = b.email
    INNER JOIN diseasetype AS d ON d.id = c.id
    WHERE d.description NOT LIKE 'infectious diseases';
'''

with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))        
    
df = pd.DataFrame(query.fetchall())
print(df)

#3.	List the name, surname and degree of doctors who are specialized in more than 2 disease types.
print('\n***************\n')
print('Question-3\n')
sql = '''
    SELECT DISTINCT a.name, a.surname, b.degree, COUNT(d.id)
    FROM users a, doctor b, specialize c, diseasetype d
    WHERE a.email = b.email AND c.email = b.email AND c.id = d.id
    GROUP BY (a.name, a.surname, b.degree)
    HAVING COUNT(d.id)>2;
'''

with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))        
    
df = pd.DataFrame(query.fetchall())
print(df)

#4.	For each country list the cname and average salary of doctors who are specialized in “virology”.
print('\n***************\n')
print('Question-4\n')
sql = '''
    SELECT a.cname, AVG(salary) AS average_salary
    FROM country as a
    INNER JOIN users AS b ON a.cname = b.cname
    INNER JOIN doctor AS c ON c.email = b.email
    INNER JOIN specialize AS d ON d.email = c.email
    INNER JOIN diseasetype AS e ON e.id = d.id
    WHERE e.description like 'Virology'
    GROUP BY(a.cname)
    ORDER BY average_salary DESC
'''

with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))        
    
df = pd.DataFrame(query.fetchall())
print(df)

#5.	List the departments of public servants who report “covid-19” cases in more than one country 
#and the number of such public servants who work in these departments. (i.e “Dept1 3” means that in 
#the “Dept1” department there are 3 such employees
print('\n***************\n')
print('Question-5\n')
sql = '''
    SELECT a.department, RIGHT(a.department, 1) AS number_of_servant
    FROM publicservant AS a, record AS b, disease AS c, diseasetype AS d, users AS e
    WHERE a.email = e.email AND a.email = b.email AND c.id = d.id AND e.cname = b.cname
    GROUP BY(a.department)
    HAVING COUNT(b.cname)>1
    ORDER BY number_of_servant desc;
'''

with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))        
    
df = pd.DataFrame(query.fetchall())
print(df)

#6.	Double the salary of public servants who have recorded covid-19 patients more than 3 times.
print('\n***************\n')
print('Question-6\n')
sql = '''
    SELECT a.name, a.salary * 2
    FROM users AS a, record AS b, publicservant AS c
    WHERE a.email = b.email AND a.email = c.email
    AND b.disease_code = 'SARSCOV'
    GROUP BY(a.name, a.salary)
    HAVING COUNT(b.disease_code)>3
'''

with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))        
    
df = pd.DataFrame(query.fetchall())
print(df)

#7.	Delete the users whose surname contain the substring “alp” (e.g. Alp, Alper, Alperen, Eralp)
print('\n***************\n')
print('Question-7\n')
#full list without deletion
sql = '''
    SELECT * FROM Users
'''
with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))
    
df = pd.DataFrame(query.fetchall())
print('\nfull list\n')
print(df)


#delete operation of substring "alp"
sql = '''
    ALTER TABLE users DISABLE TRIGGER ALL;
    ALTER TABLE doctor DISABLE TRIGGER ALL;
    DELETE FROM users where surname ilike '%alp%';
    ALTER TABLE users ENABLE TRIGGER ALL;
    ALTER TABLE doctor ENABLE TRIGGER ALL;
'''
with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))        


#listing after delete operation
sql = '''
    SELECT * FROM Users
'''
with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))
    
df = pd.DataFrame(query.fetchall())
print('\nafter deleting operation\n')
print(df)

#8.	Create an index namely “idx pathogen” on the “pathogen” field.
print('\n***************\n')
print('Question-8\n')
sql = '''
    CREATE INDEX idx_pathogen
    ON Disease(pathogen); 
'''

with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))

#9.	List the email, name, and department of public servants who have created records 
#where the number of patients is between 100000 and 999999
print('\n***************\n')
print('Question-9\n')
sql = '''
    SELECT DISTINCT a.email, a.name, b.department, sum(c.total_patients) AS total_patients
    FROM users AS a
    INNER JOIN publicservant AS b on a.email = b.email
    INNER JOIN record AS c on b.email = c.email
    WHERE c.total_patients between 100000 AND 999999
    GROUP BY (a.email, b.department)
    ORDER BY total_patients desc
'''

with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))        
    
df = pd.DataFrame(query.fetchall())
print(df)

#10. List the top 5 counties with the highest number of total patients recorded.
print('\n***************\n')
print('Question-10\n')
sql = '''
    SELECT cname, SUM(total_patients) AS total_patients
    FROM record
    GROUP BY cname
    ORDER BY total_patients desc
    FETCH FIRST 5 ROWS ONLY;
'''

with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))        
    
df = pd.DataFrame(query.fetchall())
print(df)

#11. Group the diseases by disease type and the total number of patients treated.
print('\n***************\n')
print('Question-11\n')
sql = '''
    SELECT a.description, SUM(c.total_patients) AS total_patients
    FROM diseasetype AS a, disease AS b, record AS c
    WHERE a.id = b.id and b.disease_code = c.disease_code
    GROUP BY a.description
    ORDER BY total_patients DESC
'''

with engine.connect().execution_options(autocommit=True) as conn:
    query = conn.execute(text(sql))        
    
df = pd.DataFrame(query.fetchall())
print(df)
