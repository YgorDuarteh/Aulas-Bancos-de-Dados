CREATE DATABASE BDEstoque2E
on primary
(name = 'BDEstoque2022', filename = 'D:\BM\BDEstoque2E.mdf')
log on
(name = 'BDEstoque2022_log', filename = 'D:\BM\BDEstoque2E_log.ldf')
go

---------------------------------------------------------------------------

USE BDEstoque2E;

---------------------------------------------------------------------------

CREATE TABLE Marca (
NomeMarca VARCHAR(25),
CodMarca INTEGER PRIMARY KEY
)
---------------------------------------------------------------------------

CREATE TABLE Cliente (
CodCliente INTEGER PRIMARY KEY,
CPF_CNPJ VARCHAR(14),
endereco VARCHAR(45),
email VARCHAR(245),
Nome VARCHAR(100),
)

---------------------------------------------------------------------------

CREATE TABLE Pedido (
total DECIMAL(10,2),
Data DATE,
codpedido INTEGER PRIMARY KEY,
CodCliente INTEGER,
FOREIGN KEY(CodCliente) REFERENCES Cliente (CodCliente)
)

---------------------------------------------------------------------------

CREATE TABLE Produto (
estoque DECIMAL(10,2),
descricao VARCHAR(100),
preco DECIMAL(10,2),
Codproduto INTEGER PRIMARY KEY,
codmarca INTEGER,
FOREIGN KEY(codmarca) REFERENCES Marca (codmarca)
)

---------------------------------------------------------------------------

CREATE TABLE ItemPedido (
Coditem INTEGER PRIMARY KEY,
quantidade DECIMAL(10,2),
subtotal DECIMAL(10,2),
codpedido INTEGER,
Codproduto INTEGER,
FOREIGN KEY(codpedido) REFERENCES Pedido (codpedido),
FOREIGN KEY(Codproduto) REFERENCES Produto (Codproduto)
)

---------------------------------------------------------------------------

-- DML (Linguagem de Manpulação de Dados) --
-- É um conjunto de instruções usada nas consultas e modificações dos dados armazenados nas tabelas do banco de dados --

Insert into marca(codmarca,NomeMarca) values(1, 'Coca-Cola')
Insert into marca(codmarca,NomeMarca) values(2, 'Poty')
Insert into marca(codmarca,NomeMarca) values(3, 'Cotuba')
Insert into marca(codmarca,NomeMarca) values(4, 'Pepsi')

Select * From marca

Insert into Cliente(CodCliente, Nome, CPF_CNPJ, endereco, email)
values(1, 'Alessandro Sandrini', '123456', 'rua xxxx', 'alessandro@terra.com.br')

Insert into Cliente(CodCliente, Nome, CPF_CNPJ, endereco, email)
values(2, 'José da silva', '1234565', 'rua eeee', 'jose@terra.com.br')

Insert into Cliente(CodCliente, Nome, CPF_CNPJ, endereco, email)
values(3, 'Ana Maria', '123456678', 'rua 22222', 'ana@terra.com.br')

Select * From Cliente

Insert into Produto(Codproduto, descricao, preco, estoque, codmarca)
values(1, 'Refrigerante de Cola',10.25,100,1);

Insert into Produto(Codproduto, descricao, preco, estoque, codmarca)
values(2, 'Refrigerante',10.25,120,2);

Insert into Produto(Codproduto, descricao, preco, estoque, codmarca)
values(3, 'Refrigerante de Guarana',9.25,150,2);

Insert into Produto(Codproduto, descricao, preco, estoque, codmarca)
values(4, 'Refrigerante de Limão',8.25,99,4);

select * from Produto

---------------------------------------------------------------------------

insert into Pedido(codpedido, CodCliente,Data ,total)
values(1,2, '17/03/2022',1000) 

insert into Pedido(codpedido, CodCliente,Data ,total)
values(2,3, GETDATE(),2000) 

insert into Pedido(codpedido, CodCliente,Data ,total)
values(3,1, '03/01/2022',11000)  

select * from Pedido

---------------------------------------------------------------------------

insert ItemPedido (Coditem, codpedido, Codproduto, quantidade, subtotal)
values(1,2,1,10,100)
insert ItemPedido (Coditem, codpedido, Codproduto, quantidade, subtotal)
values(2,2,2,10,150)
insert ItemPedido (Coditem, codpedido, Codproduto, quantidade, subtotal)
values(3,2,3,20,200)
insert ItemPedido (Coditem, codpedido, Codproduto, quantidade, subtotal)
values(4,1,1,20,1000)
insert ItemPedido (Coditem, codpedido, Codproduto, quantidade, subtotal)
values(5,2,2,30,1502)
insert ItemPedido (Coditem, codpedido, Codproduto, quantidade, subtotal)
values(6,1,3,40,2001)

select * from ItemPedido

delete from ItemPedido

--Deleta um item especifico--
delete from ItemPedido where Coditem = 6;

---------------------------------------------------------------------------

select * from ItemPedido;

delete from ItemPedido where Coditem = 3;

insert into Marca(CodMarca, NomeMarca) values(3, 'cotuba');

insert into Marca(CodMarca, NomeMarca) values(5, 'Arco Iris');