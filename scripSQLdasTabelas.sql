-- Tabela Lote (corrigida)
CREATE TABLE Lote (
    id_lote CHAR(4) PRIMARY KEY,  -- Declaração única da PK
    data_producao DATE NOT NULL,
    qtd_produzida_lote SMALLINT NOT NULL
    -- Removida constraint PK redundante
);

-- Tabela Bateria (corrigida)
CREATE TABLE Bateria (
    id_bateria CHAR(4) PRIMARY KEY,  -- Declaração única da PK
    capacidade_armaz FLOAT NOT NULL,
    tensao_nominal FLOAT NOT NULL,
    tipo_bateria VARCHAR(50) NOT NULL,
    id_lote_Lote CHAR(4) NOT NULL,
    CONSTRAINT lote_fk FOREIGN KEY (id_lote_Lote) 
        REFERENCES Lote(id_lote)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
    -- Removida constraint PK redundante
);

-- Tabela Lote_NN (corrigida)
CREATE TABLE Lote_NN (
    id_lote CHAR(4) PRIMARY KEY,  -- Declaração única da PK
    data_producao DATE NOT NULL,
    qtd_produzida_lote SMALLINT NOT NULL
    -- Removida constraint PK redundante
);

-- Tabela Bateria_NN (corrigida)
CREATE TABLE Bateria_NN (
    id_bateria CHAR(4) PRIMARY KEY,  -- Declaração única da PK
    capacidade_armaz FLOAT NOT NULL,
    tensao_nominal FLOAT NOT NULL,
    tipo_bateria VARCHAR(50) NOT NULL
    -- Removida constraint PK redundante
);

-- Tabela Teste_Baterias (corrigida)
CREATE TABLE Teste_Baterias (
    teste_temp BOOLEAN NOT NULL,
    id_bateria_Bateria_NN CHAR(4) NOT NULL,
    teste_ciclo BOOLEAN NOT NULL,
    teste_desc BOOLEAN NOT NULL,
    aprovado BOOLEAN NOT NULL,
    id_lote_Lote_NN CHAR(4) NOT NULL,
    PRIMARY KEY (id_bateria_Bateria_NN, id_lote_Lote_NN),  -- PK composta
    CONSTRAINT Bateria_NN_fk FOREIGN KEY (id_bateria_Bateria_NN) 
        REFERENCES Bateria_NN(id_bateria)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT Lote_NN_fk FOREIGN KEY (id_lote_Lote_NN) 
        REFERENCES Lote_NN(id_lote)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Comentários para documentação
COMMENT ON TABLE Lote IS 'Armazena informações sobre lotes de produção';
COMMENT ON TABLE Bateria IS 'Contém dados técnicos das baterias produzidas';
COMMENT ON TABLE Teste_Baterias IS 'Registra resultados dos testes de qualidade';
COMMENT ON COLUMN Teste_Baterias.aprovado IS 'Indica se a bateria passou em todos os testes';