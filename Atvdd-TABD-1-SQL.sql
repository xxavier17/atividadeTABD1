create database EVENTO_Colegio;
use EVENTO_Colegio; 

create table Aluno(
matricula int(4) not null primary key,
nome varchar(50),
serie varchar(2)
);

/*os atributos de horario_inicio e horario_final estão como varchar
por ser só um exercicio de conhecimento, mas sei que tem os tipos expecificos
para captar a hora~e que necessitam de um pouco mais de cuidado para serem efetuados
corretamente*/
create table Palestra(
id_palestra bigint not null AUTO_INCREMENT,
nome_paletra varchar(100),
tipo varchar(30),
data date,
local varchar(40),
horario_inicio varchar(5) ,
horario_final varchar(5),
carga_horaria int(3),
primary key(id_palestra)
);

create table Impressao_certificado(
id_certifiado bigint not null AUTO_INCREMENT,
primary key(id_certifiado)
);

create table Ministrante(
CPF varchar(11) not null primary key,
nome_ministrante varchar(100),
telefone_mins int(11),
titulacoes varchar(200),
UF char(2),
cidade varchar(30),
bairro varchar(20),
rua varchar(20)
);

create table Empresa(
id_empresa bigint not null AUTO_INCREMENT,
nome_empresa varchar(120),
telefone_emp int(11),
CNPJ int(14),
primary key(id_empresa)
);

create table Historico(
id_historico bigint not null AUTO_INCREMENT,
data_encerramento date,
primary key(id_historico)
);

show tables;

alter table Palestra add constraint FK_matricula foreign key(matricula) references Aluno(matricula);
select * from Palestra; 
alter table Palestra add constraint FK_ministrante foreign key(CPF) references Ministrante(CPF);
select * from Palestra;

alter table Historico add constraint FK_empresa foreign key(id_empresa) references Empresa(id_empresa);
select * from Historico;

alter table Ministrante add constraint FK_historico foreign key(id_historico) references Historico(id_historico);
select * from Ministrante;
alter table Ministrante add constraint FK_empresa foreign key(id_empresa) references Empresa(id_empresa);
select * from Ministrante;

alter table Impressao_certificado add constraint FK_aluno foreign key(matricula) references Aluno(matricula);
select * from Impressao_certificado;
alter table Impressao_certificado add constraint FK_palestra foreign key(id_palestra) references Palestra(id_palestra);
select * from Impressao_certificado;
alter table Impressao_certificado add constraint FK_ministrante foreign key(CPF) references Ministrante(CPF);
select * from Impressao_certificado;

insert into Aluno(matricula,nome,serie)values(0001,"Vanubia Santos Lima","3º"),(0002,"Pablo Vinicius dos Santos","3º"),(0003,"Amanda Chaves Nunes","2º"),(0004,"Cida Xavier Nunes Mendes","3º"),(0005,"Leandro Brito Segundo","3º");
select * from Aluno; 

insert into  Empresa(nome_empresa,telefone_emp,CNPJ)values("Devtec",77998540336,544322222227987),("Digital Serv",77998544959,47667890927987);
select * from Empresa ; 


insert into  Historico(data_admissao,data_encerramento,FK_empresa)values("27/03/2005","27/03/2007",1),("01/01/1954","17/06/2000",2),("15/02/2004","27/08/2019",1);
select * from Historico ;

insert into  Ministrante(CPF,nome_ministrante,telefone_mins,titulacoes,UF,cidade,bairro,rua,FK_historico,FK_empresa)values ("085.999.975-43","Fabricio Mendes Souza","77998450335","Empreendedor","BA","Guanambi","Alazão","rua1",2,1),("085.999.975-43","Fabricio Mendes Souza","77998450335","Marketing Digital","BA","Malhada","João Pedro I","rua Roxinol",2,4);
select * from Ministrante;

insert into  Palestra(nome_palestra,tipo,data,local,horario_inicio,horario_final,carga_horaria,FK_matricula, FK_ministrante)
values ("História do empreendedorimo","mesa redonda","2021/09/22","CEPFA","17:00","18:00",10,1,1),("tecnologia-empreendimentos","mini curso","2021/09/23","CEPFA","17:00","18:00",10,1,1),("Instagram-Atividade Pratica","oficina","2021/09/23","CEPFA","19:00","20:00",20,3,1);
select * from Palestra; 

insert into Impressao_certificado(FK_palestra, FK_aluno, FK_ministrante)values(1,1,1),(1,2,3),(2,2,1);
select * from Impressao_certificado ; 

show tables;

show columns from Aluno;
show columns from Empresa;
show columns from Historico;
show columns from Impressao_certificado;
show columns from Ministrante;
show columns from Palestra;

select *from Aluno;
select *from Empresa;
select *from Historico;
select *from Impressao_certificado;
select *from Ministrante;
select *from Palestra;
