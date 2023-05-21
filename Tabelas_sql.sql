Create table Aeroporto 
(ID_Aeroporto INT PRIMARY KEY,
Sigla_Aeroporto Varchar(3),
Aeroporto varchar(100),
Cidade Varchar (20),
Estado varchar (20),
Enplanements INT,
HubTypes VARCHAR(3))


Create TABLE Rota 
(ID_Rota INT PRIMARY KEY,
ID_Origem INT References Aeroporto (ID_Aeroporto),
ID_Destino INT REFERENCES Aeroporto (ID_Aeroporto))

Create table Airline
(ID_Airline int primary key,
Sigla_Airline varchar(3),
Airline varchar(20),
AirlineType varchar(50))


Create Table ModeloAviao
(ID_Modelo int primary key,
Modelo varchar(50),
Ano INT)

Create Table Aviao
(ID_TailNumber int primary key,
TailNumber varchar(6),
ID_Airline int,
ID_Modelo int,
Constraint FK_ID_modelo FOREIGN KEY (ID_Modelo) References ModeloAviao(ID_Modelo))

Create table DateTable
(ID_Date int primary key,
CalendarDate Date constraint UQ_DateTable_CalendarDate unique,
Year int,
Quarter int,
Month int,
Week int,
Day int)

Create Table TimeTable 
(ID_Time int primary key,
Time_value time,
horas int,
Minutos int)

Create Table flight
(ID_TailNumber int references aviao(ID_TailNumber),
ID_TimeArr int references TimeTable(ID_Time),
ID_TimeDep int references TimeTable(ID_Time),
ID_DateArr int references datetable(ID_Date),
ID_DateDep INT REFERENCES DateTable(ID_Date),
ID_Rota int references rota (ID_Rota),
ID_Airline int references Airline(ID_Airline),
Cancelado varchar(3),
CodigoCancelamento varchar(1),
Desviado varchar(3),
CRSElapsedTime int,
ActualElapsedTime int,
AirTime int,
Distance INT,
DistanceGroup int,
CRSDepTime int,
DepDelay int,
DepDelayminutes int,
DepDelay15 int,
TaxiOut int,
TaxiIn int,
CRSArrTime int,
ArrDelay int,
ArrDelayMinutes int,
ArrDel15 int,
ArrivalDelayGroups int,
DepartureFDelayGroups int,
CarrierDelay int,
WeatherDelay int,
NASDelay int,
SecurityDelay int,
LateAircraftDelay int)

Create table Hub_Bridge
(ID_Aeroporto int references Aeroporto(ID_Aeroporto),
ID_Airline int references Airline (ID_Airline))
