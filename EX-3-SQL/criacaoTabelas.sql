USE agenciabancaria;

CREATE TABLE agencias (
	codigo INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    data_criacao DATETIME,
    CONSTRAINT codigo_pk PRIMARY KEY (codigo)
);

CREATE TABLE clientes (
	cpf VARCHAR(11),
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(200),
    telefone VARCHAR(15),
    data_nascimento DATETIME,
    CONSTRAINT clientes_pk PRIMARY KEY (cpf)
);

CREATE TABLE contas (
	numero INT AUTO_INCREMENT,
    agencia INT,
    saldo DECIMAL(10,2) NOT NULL,
    tipo VARCHAR(45),
    clientes_cpf VARCHAR(11) NOT NULL,
    CONSTRAINT contas_pk PRIMARY KEY (numero),
    CONSTRAINT contas_agencias_fk FOREIGN KEY (agencia)
		REFERENCES agencias(codigo),
	CONSTRAINT contas_clientes_cpf FOREIGN KEY (clientes_cpf)
		REFERENCES clientes(cpf)
);

CREATE TABLE transacoes (
	id INT AUTO_INCREMENT,
    contas_numero_origem INT NOT NULL,
    contas_agencia_origem INT NOT NULL,
    contas_numero_destino INT,
    contas_agencia_destino INT,
    data_transacao DATETIME NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    tipo ENUM('d','s','t') NOT NULL,
    CONSTRAINT transacoes_pk PRIMARY KEY (id),
    CONSTRAINT transacoes_contas_numero_origem_fk FOREIGN KEY (contas_numero_origem)
		REFERENCES contas(numero),
	CONSTRAINT transacoes_contas_agencis_origem_fk FOREIGN KEY (contas_agencia_origem)
		REFERENCES contas(agencia)
);



SELECT * FROM agencias;
DESC agencias;
DESC clientes;
DESC contas;
DESC transacoes;
