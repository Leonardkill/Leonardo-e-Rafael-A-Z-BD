 drop database pedido_compra
 
 create database pedido_compra;
go 
 


 use pedido_compra;
 go

 create table cliente  
	(id_clie integer not null primary Key, 
	nm_clie   varchar (60) not null,
	doc_clie  varchar   (15) not null,
	dtnas_clie date not null);
 go 

	 create table pagamento 
		(id_pgto	integer  not null primary Key,
		desc_pgto	varchar(30) 		not null);
	  go

 create table pedido 
		( id_ped  integer not null primary key, 
		id_pgto	int	not null,
		id_clie	int not null, 
		dt_ped	date not null,
		tot_ped numeric (10,2),
 constraint pedido_pagamento_fk foreign key (id_pgto) references pagamento, 
 constraint pedido_cliente_fk foreign key (id_clie) references cliente); 
 
 go


  create table produto
	(id_prod  integer not null primary key,
	 dsc_prod	varchar  (40)   not null,
	vl_prod numeric (9,2) );
go

create table item_pedido
	(id_ped  integer not null,
	id_prod integer  not null,
	qtd_item_ped numeric (7) not null, 
	vl_item_ped  numeric (9,2) not null, 
	constraint item_pedido_pedido_fk foreign key (id_ped) references pagamento,
	constraint item_pedido_produto_fk foreign key (id_prod) references produto);
	go


/* EXERCICIO B */
	insert into cliente (  nm_clie)
				values 	('Leonardo' ),
						('Thalita'),
						('Rafael'),
						('Giovane' ),
						( 'Marisol' );
		go 


	/*EXERCICIO B.b */
	insert into pagamento (desc_pgto)
		values 	('Cartão de credito'),
				('Boleto'),
				('Dinheiro');
	go
	
  /*EXERCICIO B.c */
	insert into produto (dsc_prod,vl_prod)
	values ('PC', 1000 ),
		   ('Tablet', 200),
		   ('Celular',1500 ),
		   ('Mouse', 100 ),
		   ('Teclado' , 400),
		   ('Monitor', 700),
		   ('Pen Drive', 50),
		   ('Carregador', 90),
		   ('Fones', 120),
		   ('Cabos', 15);
		   
		go 	
	
	/*EXERCICIO B.d*/ 
	insert into pedido (id_ped, id_pgto,id_clie, dt_ped, tot_ped)
			values 		( 2,3,1,'2017-08-05',5),  
						( 4,6,4,'2016-04-15',1),
						(6,9,5,'2018-05-20',3),
						(8,12,3,'2015-12-07',1),
						(10,15,5,'2016-05-08',6),
						(12,18,4,'2014-12-09',2),
						(14,21,3,'2013-12-10',8),
						(16,24,2,'2012-01-11',2);

go

select * from pedido
						
insert into item_pedido  (id_ped, id_prod, qtd_item_ped, vl_item_ped)
		values			 ( 5,2,3, 50), 
						 ( 10,4,2, 100), 
						( 15,6,1, 150);
go 

		   select * from cliente;
		   select * from pedido;
		   select * from pagamento;
		   select * from produto; 
		   select * from item_pedido;
	/*  EXERCICIO C */
	
	
	Select * from cliente
	order by nm_clie asc

	
	/* EXERCICIO D */
		
		Select * from pagamento 
		order by id_pgto desc
		
		
		
	/* EXERCICIO E */
	
		SELECT id_pgto,desc_pgto
		FROM pagamento 
		WHERE id_pgto = 2;
	
	
	
	
	
	/* EXERCICIO F  */
	
		SELECT nm_clie 
		FROM cliente 
		WHERE nm_clie LIKE 'M%';
	
	
	/* EXERCICIO G */
			
			
			SELECT desc_pgto
			FROM pagamento
			WHERE desc_pgto LIKE '%e%';
	
	
	
	/* EXERCICIO H */
	
		SELECT dsc_prod ,
			vl_prod [Valor Produto]
		FROM  produto
		WHERE vl_prod > 10.00;
	
	

	
	/* EXERCICIO I */

		SELECT * FROM pedido
		WHERE dt_ped BETWEEN '10-02-2019' AND '2019-05-10';
		
		select *from pedido 


	/*EXERCICIO J. */
	
		SELECT nm_clie,id_ped
		FROM cliente , pedido
		WHERE nm_clie = 'Mariana' OR id_ped = '2'
		ORDER BY nm_clie;
		
		
		Select * from cliente 
 
	/* EXERCICIO K */
	
		select id_clie , nm_clie , dt_ped
		from cliente , pedido
		where id_clie = 2

		/*EXERCICIO L */


			
	
	/* M Selecione o pedido com menor valor. */
		
		select max (tot_ped) from pedido
