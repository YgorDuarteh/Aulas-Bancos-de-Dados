CREATE DATABASE BDprova2025
on primary
(name = 'BDprova2025', filename = 'D:\MB\BDprova2025.mdf')
log on
(name = 'BDprova2025_log', filename = 'D:\MB\BDprova2025_log.ldf')
go

---------------------------------------------------------------------------

USE BDprova01;

---------------------------------------------------------------------------

CREATE TABLE Marca (
	CodMarca INTEGER PRIMARY KEY,
	NomeMarca VARCHAR(30),
)

---------------------------------------------------------------------------

CREATE TABLE Produto (
    CodProduto INTEGER PRIMARY KEY,
    preco NUMERIC(10,2),
    descricao VARCHAR(70),
    estoque NUMERIC(10,2),
    CodMarca INTEGER,
    FOREIGN KEY (CodMarca) REFERENCES Marca (CodMarca)
);

---------------------------------------------------------------------------

insert into marca(CodMarca,NomeMarca) values(1, 'Nike')
insert into marca(CodMarca,NomeMarca) values(2, 'Puma')
insert into marca(CodMarca,NomeMarca) values(3, 'Adidas')


select * from Marca

---------------------------------------------------------------------------

insert into produto(CodProduto,preco,descricao,estoque,CodMarca)
values (1,250.75,'Tenis da Nike Preto',120,1)
insert into produto(CodProduto,preco,descricao,estoque,CodMarca)
values (2,300.50,'Tenis da Puma Cinza',200,2)
insert into produto(CodProduto,preco,descricao,estoque,CodMarca)
values (3,320.00,'Tenis da Adidas Branco',50,3)

select * from Produto