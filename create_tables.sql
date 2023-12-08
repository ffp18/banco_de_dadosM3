-- Crie a tabela EmpresaDeEventos
CREATE TABLE IF NOT EXISTS EmpresaDeEventos (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome VARCHAR(50),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    TelefoneFuncionarios VARCHAR(15),
    Website VARCHAR(100),
    HorarioFuncionamento VARCHAR(5),
    Email VARCHAR(100)
);

-- Crie as outras tabelas referenciadas
CREATE TABLE IF NOT EXISTS Cliente (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome VARCHAR(50),
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    CPF VARCHAR(14)
);

CREATE TABLE IF NOT EXISTS Eventos (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome VARCHAR(50),
    Data VARCHAR(8),
    Local VARCHAR(255)
);

-- Em seguida, crie a tabela Pagamentos
CREATE TABLE IF NOT EXISTS Pagamentos (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_CLIENTE INTEGER,
    ID_EVENTO INTEGER,
    MetodoPagamento VARCHAR(100),
    StatusPagamento VARCHAR(100),
    FOREIGN KEY (ID_CLIENTE) REFERENCES Cliente(ID),
    FOREIGN KEY (ID_EVENTO) REFERENCES Eventos(ID)
);

-- Adicione outras tabelas aqui, se necessário

-- Exemplo de outra tabela (Funcionario)
CREATE TABLE IF NOT EXISTS Funcionario (
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome VARCHAR(50),
    Cargo VARCHAR(50),
    Telefone VARCHAR(15),
    Endereco VARCHAR(255),
    Email VARCHAR(100),
    CPF VARCHAR(14),
    Salario FLOAT(10)
);

