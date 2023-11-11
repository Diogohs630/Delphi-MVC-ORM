CREATE TABLE Pessoa(
	id INT PRIMARY KEY IDENTITY(1, 1),
	nome VARCHAR(60),
	dataNascReg DATE
);

CREATE TABLE Cliente(
	id INT PRIMARY KEY IDENTITY(1, 1),
	id_pessoa INT NOT NULL,
	tipo VARCHAR(60),
	CpfCnpj VARCHAR(60),
	email VARCHAR(100),
	telefone VARCHAR(100),
	foto VARBINARY(MAX),

	CONSTRAINT Cliente_FK FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id)
);

CREATE TABLE Endereco(
	id INT PRIMARY KEY IDENTITY(1, 1),
	id_pessoa INT NOT NULL,
	logradouro VARCHAR(60),
	numero INT,
	complemento VARCHAR(60),
	cidade VARCHAR(60),
	bairro VARCHAR(60),
	estado VARCHAR(2),
	tipo VARCHAR(60),

	CONSTRAINT Endereco_FK FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id)
);


CREATE TABLE Produto(
	id INT PRIMARY KEY IDENTITY(1, 1),
	descricao VARCHAR(255),
	precovenda DECIMAL(17, 2),
	foto VARBINARY(MAX)
);

CREATE TABLE Pedido(
	id INT PRIMARY KEY IDENTITY(1, 1),
	id_cliente INT NOT NULL,
	dataemissao DATE DEFAULT GETDATE(),
	valortotal DECIMAL(17, 2),

	CONSTRAINT Pedido_FK FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE PedidoItens(
	id INT PRIMARY KEY IDENTITY(1, 1),
	id_pedido INT NOT NULL,
	id_produto INT NOT NULL,
	quantidade INT,
	valorunitario DECIMAL(17, 2),
	valortotal DECIMAL(17, 2),

	CONSTRAINT PedidoItem_FK FOREIGN KEY (id_pedido) REFERENCES Pedido(id),
	CONSTRAINT PedidoItem_FK1 FOREIGN KEY (id_produto) REFERENCES Produto(id)
);
