CREATE TABLE Country (
	cname VARCHAR(50) not null PRIMARY KEY,
	population bigint
);

CREATE TABLE Users (
	email VARCHAR(60) not null PRIMARY KEY,
	name VARCHAR(30),
	surname VARCHAR(40),
	salary int,
	phone VARCHAR(20),
	cname VARCHAR(50),
	CONSTRAINT fk_cname3 FOREIGN KEY(cname) REFERENCES Country(cname)
);

CREATE TABLE DiseaseType (
	id integer not null PRIMARY KEY,
	description VARCHAR(140)
);

CREATE TABLE Disease (
	disease_code VARCHAR(50) not null PRIMARY KEY,
	pathogen VARCHAR(20),
	description VARCHAR(140),
	id int,
	CONSTRAINT fk_id FOREIGN KEY(id) REFERENCES DiseaseType(id)
);

CREATE TABLE Discover (
	disease_code VARCHAR(50) not null PRIMARY KEY,
	cname VARCHAR(50),
	first_enc_date date,
	CONSTRAINT fk_disease FOREIGN KEY(disease_code) REFERENCES Disease(disease_code),
	CONSTRAINT fk_cname FOREIGN KEY(cname) REFERENCES Country(cname)
);

CREATE TABLE Doctor (
	email VARCHAR(60) not null PRIMARY KEY,
	degree varchar(20),
	CONSTRAINT fk_email2 FOREIGN KEY(email) REFERENCES Users(email)
);

CREATE TABLE PublicServant (
	email VARCHAR(60) not null PRIMARY KEY,
	department VARCHAR(50),
	CONSTRAINT fk_email FOREIGN KEY(email) REFERENCES Users(email)
);

CREATE TABLE Record (
	email VARCHAR(60),
	cname VARCHAR(50),
	disease_code VARCHAR(50),
	total_deaths int,
	total_patients int,
	CONSTRAINT fk_cname2 FOREIGN KEY(cname) REFERENCES Country(cname),
	CONSTRAINT fk_disease2 FOREIGN KEY(disease_code) REFERENCES Disease(disease_code),
	CONSTRAINT fk_email3 FOREIGN KEY(email) REFERENCES PublicServant(email)
);

CREATE TABLE Specialize (
	id int,
	email VARCHAR(60),
	CONSTRAINT fk_id2 FOREIGN KEY(id) REFERENCES DiseaseType(id),
	CONSTRAINT fk_email4 FOREIGN KEY(email) REFERENCES Doctor(email)
);