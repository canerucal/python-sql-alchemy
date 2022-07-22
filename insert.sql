--Inserting data to Country table
INSERT INTO Country values 
('Turkey', 82465789),
('USA', 225447864),
('France', 54678214),
('Germany', 40521657),
('England', 22147852),
('China', 1456789201),
('India', 1214587412),
('Spain', 79456123),
('Portugal', 10456128),
('Argentina', 47854126),
('Russia', 120654789);

--Inserting data to DiseaseType table
INSERT INTO DiseaseType values
(1, 'infectious diseases'),
(2, 'Heart problems'),
(3, 'Covid-19'),
(4, 'Bacteria related disease'),
(5, 'Skeleton problem'),
(6, 'Mental illness'),
(7, 'Muscle injury'),
(8, 'Lung problems'),
(9, 'Hormonal disease'),
(10, 'Diabetes'),
(11, 'Lymphatic disease'),
(12, 'Virology');

--Inserting data to Disease table
INSERT INTO Disease values
('1BAC2', 'Bacteria', 'Bacteria related disease' ,4),
('1BAC3', 'Bacteria', 'Bacteria caused hormonal illness', 9),
('1VUR1', 'Virus', 'Virus related temperature increase', 12),
('SARSCOV', 'Virus', 'Virus related illness', 3),
('MUSVIR', 'Virus', 'Virus related problem', 7),
('HORM', 'Bacteria', 'Bacterio hormon', 9),
('HRTATC', 'Bacteria', 'Bacteria related heart attack', 2),
('SKEL', 'Bacteria', 'Bacteria related skeleton problem', 5),
('MENTAL', 'Virus', 'Virus related problem', 6),
('CANCER', 'Autoimmun', 'Autoimmun problem', 8),
('DIA', 'Bacteria', 'Diatebes related with insuline hormone', 10);

--Inserting data to Discover table
INSERT INTO Discover values
('1BAC2', 'Turkey', '1976-02-05'),
('1BAC3', 'USA', '1970-02-05'),
('1VUR1', 'France', '1980-02-01'),
('SARSCOV', 'China', '2019-10-30'),
('MUSVIR', 'China', '1950-01-10'),
('HORM', 'Turkey', '2000-10-10'),
('HRTATC', 'England', '1870-06-05'),
('SKEL', 'Russia', '2010-03-13'),
('MENTAL', 'Germany', '1900-10-10'),
('CANCER', 'Portugal', '1950-02-20'),
('DIA', 'Turkey', '1910-11-11');


--Inserting data to Users table
INSERT INTO Users values
('alper@gmail.com', 'Alper', 'Akman', 15000, '05320001010', 'Turkey'),
('caner@gmail.com', 'Caner', 'Köksal', 17000, '05321201010', 'Germany'),
('alpman@gmail.com', 'Alper', 'Alpman', 18000, '05320001012', 'Turkey'),
('jason@gmail.com', 'Jason', 'Tatum', 14000, '05421234560', 'USA'),
('frank@gmail.com', 'Frank', 'Carlson', 13000, '05345123456', 'France'),
('jo@gmail.com', 'Jo', 'Chi', 8000, '05345412456', 'China'),
('ivan@gmail.com', 'Ivan', 'Gregor', 4300, '05345123412', 'Russia'),
('joao@gmail.com', 'Joao', 'Fonseca', 25000, '05398764512', 'Portugal'),
('jimenez@gmail.com', 'Pablo', 'Jimenez', 41200, '05426547891', 'Argentina'),
('edu@gmail.com', 'Edu', 'Pablo', 50000, '05461246121', 'Spain'),
('ayse@gmail.com', 'Ayşe', 'Çakır', 5000, '05321235121', 'Turkey'),
('osman@gmail.com', 'Osman', 'Kaçan', 10000, '05321271212', 'Turkey'),
('steven@gmail.com', 'Steven', 'Kerr', 13100, '05345123453', 'USA'),
('gary@gmail.com', 'Gary', 'Kouman', 6000, '05345123451', 'Germany'),
('pablinho@gmail.com', 'Pablinho', 'De Souza', 5000, '05345123441', 'Spain'),
('faruk@gmail.com', 'Faruk', 'Rezzak', 15000, '05345123121', 'India'),
('helga@gmail.com', 'Helga', 'Dobra', 20000, '05345122211', 'Germany'),
('hans@gmail.com', 'Hans', 'Obrovski', 12400, '05341251261', 'Russia'),
('ji@gmail.com', 'Ji', 'Chu', 12500, '05345120011', 'China'),
('david@gmail.com', 'David', 'Carlos', 98000, '05345123446', 'Spain');

--Inserting data to Doctor table
INSERT INTO Doctor values
('alper@gmail.com', 'Professor'),
('caner@gmail.com', 'Associate Professor'),
('alpman@gmail.com', 'Professor'),
('gary@gmail.com', 'Professor'),
('pablinho@gmail.com', 'Associate Professor'),
('faruk@gmail.com','Associate Professor'),
('helga@gmail.com','Research Assistant'),
('hans@gmail.com', 'Associate Professor'),
('ji@gmail.com', 'Professor'),
('david@gmail.com', 'Professor');

--Inserting data to Specialize table
INSERT INTO Specialize values
(1, 'alper@gmail.com'),
(2, 'caner@gmail.com'),
(3, 'caner@gmail.com'),
(4, 'caner@gmail.com'),
(12, 'alpman@gmail.com'),
(5, 'faruk@gmail.com'),
(6, 'helga@gmail.com'),
(7, 'helga@gmail.com'),
(8, 'helga@gmail.com'),
(10, 'hans@gmail.com'),
(1, 'gary@gmail.com'),
(12, 'helga@gmail.com'),
(12, 'pablinho@gmail.com'),
(12, 'ji@gmail.com'),
(12, 'david@gmail.com');

--Inserting data to PublicServant table
INSERT INTO PublicServant values
('jason@gmail.com', 'Dept1 3'),
('frank@gmail.com', 'Dept2 5'),
('jo@gmail.com', 'Dept2 5'),
('ivan@gmail.com', 'Dept1 3'),
('joao@gmail.com', 'Dept2 5'),
('jimenez@gmail.com', 'Dept4 8'),
('edu@gmail.com', 'Dept1 3'),
('ayse@gmail.com', 'Dept6 2'),
('osman@gmail.com', 'Dept4 2'),
('steven@gmail.com', 'Dept1 3');

--Inserting data to Record table
INSERT INTO Record values
('jason@gmail.com', 'USA', '1BAC3', 140, 200),
('frank@gmail.com', 'France', '1VUR1', 120, 500),
('jason@gmail.com', 'Turkey', '1BAC2', 123091, 156123),
('frank@gmail.com', 'England', '1BAC2', 134133, 541241),
('jason@gmail.com', 'USA', 'SARSCOV', 432, 43214),
('frank@gmail.com', 'France', 'SARSCOV', 432, 43213),
('jason@gmail.com', 'Turkey', 'SARSCOV', 4313, 43123),
('frank@gmail.com', 'England', 'SARSCOV', 432143, 43123),
('jason@gmail.com', 'USA', 'SARSCOV', 321, 43214),
('frank@gmail.com', 'France', 'SARSCOV', 4322, 432431),
('jason@gmail.com', 'Turkey', 'SARSCOV', 34242, 43214312),
('frank@gmail.com', 'England', 'SARSCOV', 43242, 4324312),
('frank@gmail.com', 'France', 'SARSCOV', 432, 8676867),
('jason@gmail.com', 'Turkey', 'SARSCOV', 7687, 876868),
('frank@gmail.com', 'England', 'SARSCOV', 87876, 8768787),
('jo@gmail.com', 'Turkey', 'SKEL', 4314, 43324),
('jo@gmail.com', 'Germany', '1BAC3', 432, 43224),
('jo@gmail.com', 'Turkey', 'SKEL', 4322, 422),
('jo@gmail.com', 'Turkey', 'MENTAL', 4314, 978),
('jo@gmail.com', 'France', '1BAC2', 612343, 42442),
('jo@gmail.com', 'Spain', 'DIA', 34124, 312),
('jo@gmail.com', 'India', 'DIA', 432342, 32131),
('jo@gmail.com', 'Turkey', 'SARSCOV', 2442, 5435),
('jo@gmail.com', 'Turkey', 'SARSCOV', 12, 54335),
('jo@gmail.com', 'England', 'SARSCOV', 4324, 5356),
('jo@gmail.com', 'Turkey', 'SARSCOV', 2432, 564),
('joao@gmail.com', 'India', '1BAC3', 432432, 432426),
('joao@gmail.com', 'Turkey', 'SARSCOV', 43214, 432432),
('jimenez@gmail.com', 'Spain', 'SARSCOV', 6747, 65464);