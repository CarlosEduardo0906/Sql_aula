create database Restaurante
use Restaurante

create table cliente (Cd_Cliente INTEGER IDENTITY(1000,1) PRIMARY KEY,
					Nm_Cliente  VARCHAR(50) NOT NULL );

create table pedido (Nr_Pedido INTEGER IDENTITY PRIMARY KEY,
					 Dt_Pedido DATE NOT NULL, 
					 Cd_Cliente INTEGER NOT NULL references cliente(Cd_Cliente));

create table produto (Cd_Produto INTEGER IDENTITY PRIMARY KEY,
					  Ds_Produto VARCHAR (50) NOT NULL,
					  Preco Decimal(5,2) NOT NULL)

create table pedidoProduto (Nr_Pedido INTEGER NOT NULL references pedido(Nr_Pedido),
                            Cd_Produto INTEGER NOT NULL references produto(Cd_Produto),
							Quantidade INTEGER NOT NULL,
							Preco DECIMAL(5,2)
							PRIMARY KEY (Nr_Pedido, Cd_Produto))

INSERT INTO cliente (Nm_Cliente)
VALUES ('PEDRO'), ('CARLOS'), ('MARIA');

INSERT INTO pedido (Dt_Pedido, Cd_Cliente)
VALUES 
('02/11/2010',1001),
('05/11/2010',1001),
('07/11/2010',1001),
('08/11/2010',1002);

INSERT INTO produto(Ds_Produto, Preco)
VALUES 
('MOUSE', 180 ),
('TECLADO',120 ),
('MONITOR', 550 );

INSERT INTO pedidoproduto(Nr_Pedido, Cd_Produto, Quantidade, Preco)
VALUES 
(1, 1, 10, 150),
(1, 2, 15, 120),
(1, 3, 20, 530),
(2, 1, 5, 140),
(2, 2, 8, 130),
(3, 1, 3, 150),
(3, 2, 7, 130),
(3, 3, 11, 570),
(4, 1, 13, 145),
(4, 2, 17, 135);

SELECT cliente.Cd_Cliente,
	   cliente.Nm_Cliente,
	   pedido.Nr_Pedido,
	   pedido.Dt_Pedido
FROM
	   cliente, pedido
WHERE
	   cliente.Cd_Cliente=pedido.Cd_Cliente

------------------Versão INNER JOIN

SELECT cliente.Cd_Cliente,
	   cliente.Nm_Cliente,
	   pedido.Nr_Pedido,
	   pedido.Dt_Pedido
FROM   cliente

	   INNER JOIN pedido
	  
ON
	   cliente.Cd_Cliente=pedido.Cd_Cliente

------------------EXERCICIO UTILIZANDO PRODUTO CARTESIANO

SELECT pedido.Nr_Pedido,
	   pedido.Dt_Pedido,
	   cliente.Nm_Cliente,
	   pedidoProduto.Cd_Produto,
	   pedidoProduto.Quantidade,
	   pedidoProduto.Preco
FROM pedido, cliente, pedidoProduto

WHERE cliente.Cd_Cliente=pedido.Cd_Cliente AND pedido.Nr_Pedido=pedidoProduto.Nr_Pedido

------------------EXERCICIO UTILIZANDO INNER JOIN

SELECT pedido.Nr_Pedido,
	   pedido.Dt_Pedido,
	   cliente.Nm_Cliente,
	   pedidoProduto.Cd_Produto,
	   pedidoProduto.Quantidade,
	   pedidoProduto.Preco
FROM pedido 
JOIN cliente ON pedido.Cd_Cliente=cliente.Cd_Cliente

JOIN pedidoProduto ON pedido.Nr_Pedido=pedidoProduto.Nr_Pedido

select * from cliente 
select * from pedido
select * from produto 
select * from pedidoProduto
