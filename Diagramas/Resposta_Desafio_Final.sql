-- DDL
CREATE DATABASE VelozCarDB;
USE VelozCarDB;

-- Criação das tabelas

CREATE TABLE Cliente (
    ID_Cliente INT NOT NULL PRIMARY KEY,
    Nome_Completo VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL UNIQUE,
    CNH VARCHAR(15) NOT NULL UNIQUE,
    Telefone_Contato VARCHAR(15),
    Email_Principal VARCHAR(100),
    Endereco VARCHAR(150),
    Data_Cadastro DATE NOT NULL
);

CREATE TABLE Funcionarios (
    ID_Funcionario INT NOT NULL PRIMARY KEY,
    Nome_Funcionario VARCHAR(100) NOT NULL,
    CPF_Funcionario VARCHAR(14) NOT NULL UNIQUE,
    Cargo_Ocupado VARCHAR(50),
    Data_Admissao DATE,
    Salario DECIMAL(10,2),
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Veiculos (
    ID_Veiculo INT NOT NULL PRIMARY KEY,
    Placa_Veiculo VARCHAR(10) NOT NULL UNIQUE,
    Modelo VARCHAR(50) NOT NULL,
    Marca VARCHAR(30),
    Ano_Fabricacao INT,
    Cor_Predominante VARCHAR(30),
    Diaria DECIMAL(10,2) NOT NULL,
    VStatus VARCHAR(20)
);

CREATE TABLE Contratos (
    ID_Contrato INT NOT NULL PRIMARY KEY,
    Data_Inicio_Locacao DATE NOT NULL,
    Data_Fim_Prevista DATE,
    Valor_Total_Contrato DECIMAL(10,2),
    Status_Contrato VARCHAR(20),
    ID_Cliente INT NOT NULL,
    ID_Funcionario INT NOT NULL,
    CONSTRAINT FK_Cont_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    CONSTRAINT FK_Cont_Func FOREIGN KEY (ID_Funcionario) REFERENCES Funcionarios(ID_Funcionario)
);

CREATE TABLE Itens_Contrato (
    ID_Item_Contrato INT NOT NULL PRIMARY KEY,
    ID_Contrato INT NOT NULL,
    ID_Veiculo INT NOT NULL,
    Valor_Diaria_Aplicado DECIMAL(10,2),
    Km_Saida INT,
    Km_Chegada INT,
    Tanque_Saida VARCHAR(20),
    Status VARCHAR(20),
    CONSTRAINT FK_Item_Contrato FOREIGN KEY (ID_Contrato) REFERENCES Contratos(ID_Contrato),
    CONSTRAINT FK_Item_Veiculo FOREIGN KEY (ID_Veiculo) REFERENCES Veiculos(ID_Veiculo)
);

CREATE TABLE Pagamento (
    ID_Pagamento INT NOT NULL PRIMARY KEY,
    Data_Pagamento DATE,
    Metodo_Pagamento VARCHAR(30),
    Status_Pagamento VARCHAR(20),
    Numero_Transacao_Bancaria VARCHAR(50),
    Valor_Final_Com_Taxas DECIMAL(10,2),
    Observacoes_Gerais TEXT,
    ID_Contrato INT NOT NULL,
    CONSTRAINT FK_Pag_Contrato FOREIGN KEY (ID_Contrato) REFERENCES Contratos(ID_Contrato)
);

CREATE TABLE Manutencao (
    ID_Manutencao INT NOT NULL PRIMARY KEY,
    Descricao TEXT,
    Custo_Total DECIMAL(10,2),
    Data_Entrada DATE,
    Data_Saida DATE,
    Status_Manutencao VARCHAR(20),
    ID_Veiculo INT NOT NULL,
    ID_Funcionario INT NOT NULL,
    CONSTRAINT FK_Manut_Veic FOREIGN KEY (ID_Veiculo) REFERENCES Veiculos(ID_Veiculo),
    CONSTRAINT FK_Manut_Func FOREIGN KEY (ID_Funcionario) REFERENCES Funcionarios(ID_Funcionario)
);


-- DML -- Inserindo os registros nas tabelas

INSERT INTO Cliente (ID_Cliente, Nome_Completo, CPF, CNH, Telefone_Contato, Email_Principal, Endereco, Data_Cadastro)
VALUES ('54489', 'Adolfo Vinícius Brito da Silva', '12456690877', '87465023900987', '83991010461', 'adolfovin@gmail.com', 'Rua do Limoeiro, 123', '2026-03-21');

INSERT INTO Cliente (ID_Cliente, Nome_Completo, CPF, CNH, Telefone_Contato, Email_Principal, Endereco, Data_Cadastro)
VALUES 
(82731, 'Mariana Souza Oliveira', '23566789011', '98765432101', '83988776655', 'mari.souza@hotmail.com', 'Av. Epitácio Pessoa, 450', '2026-01-15'),
(12904, 'Carlos Eduardo Pontes', '34677890122', '87654321092', '83999112233', 'cadu.pontes@gmail.com', 'Rua Manoel Deodato, 12', '2026-01-20'),
(44128, 'Beatriz Cavalcanti Melo', '45788901233', '76543210983', '81987654321', 'bia.melo@yahoo.com.br', 'Rua das Flores, 88', '2026-02-05'),
(90032, 'Ricardo Jorge da Guia', '56899012344', '65432109874', '83981223344', 'rj.guia@outlook.com', 'Rua Bancário Sérgio Guerra, 300', '2026-02-10'),
(33819, 'Fernanda Alencar Lima', '67900123455', '54321098765', '11977665544', 'fer.alencar@gmail.com', 'Alameda das Espatódias, 55', '2026-02-12'),
(61255, 'Tiago Monteiro Santos', '78011234566', '43210987656', '83993445566', 'tiago.mont@uol.com.br', 'Rua Projetada, S/N', '2026-02-28'),
(22987, 'Juliana Paes de Lira', '89122345677', '32109876547', '83987119900', 'ju.paes@gmail.com', 'Av. Gov. Flávio Ribeiro, 1001', '2026-03-01'),
(77401, 'Lucas Viana de Albuquerque', '90233456788', '21098765438', '21990011223', 'viana.lucas@gmail.com', 'Rua das Laranjeiras, 40', '2026-03-05'),
(55612, 'Camila Rocha Farias', '01344567899', '10987654329', '83991228877', 'camila.farias@hotmail.com', 'Rua Industrial Cicero, 200', '2026-03-10'),
(10394, 'Marcos Roberto Silveira', '12455678900', '09876543210', '83986554433', 'marcos.silva@bol.com.br', 'Rua Major Célio, 77', '2026-03-15'),
(48276, 'Patrícia Gomes Duarte', '23566789012', '11223344556', '83991114455', 'paty.gomes@gmail.com', 'Av. Cabo Branco, 1500', '2026-03-18'),
(99103, 'André Felipe de Castro', '34677890123', '22334455667', '83988223311', 'andre.castro@gmail.com', 'Rua José Américo, 50', '2026-03-20');

INSERT INTO Funcionarios(ID_Funcionario, Nome_Funcionario, CPF_Funcionario, Cargo_Ocupado, Data_Admissao, Salario, Telefone, Email)
VALUES (22910, 'Marcos Oliveira Santos', '123.444.555-10', 'Gerente de Unidade', '2024-05-10', 5500.00, '83988770011', 'marcos.gerencia@velozcar.com'),
(45122, 'Ana Paula Cavalcante', '234.555.666-21', 'Atendente Sênior', '2025-01-15', 2800.50, '83999112233', 'ana.paula@velozcar.com'),
(77831, 'Bruno Silva Ferreira', '345.666.777-32', 'Auxiliar de Pátio', '2025-02-01', 1650.00, '83981224455', 'bruno.patio@velozcar.com'),
(10394, 'Carla Mendes Rocha', '456.777.888-43', 'Consultora de Vendas', '2024-11-20', 3200.00, '81987654321', 'carla.vendas@velozcar.com'),
(55601, 'Diego Armando Lima', '567.888.999-54', 'Mecânico Líder', '2024-03-05', 4100.25, '83993335577', 'diego.manutencao@velozcar.com'),
(88219, 'Eliana Gomes Farias', '678.999.000-65', 'Recepcionista', '2025-03-01', 1900.00, '83986442211', 'eliana.recepcao@velozcar.com'),
(33107, 'Fabio Junior Dantas', '789.000.111-76', 'Lavador de Frota', '2025-03-10', 1580.00, '83987110022', 'fabio.lavagem@velozcar.com'),
(99402, 'Giovanna Lira Paiva', '890.111.222-87', 'Analista Financeiro', '2024-08-15', 3800.00, '11977661122', 'giovanna.fin@velozcar.com'),
(12755, 'Henrique Souza Melo', '901.222.333-98', 'Motorista de Translado', '2025-01-10', 2100.00, '83991118899', 'henrique.transporte@velozcar.com'),
(66318, 'Igor Batista Cruz', '012.333.444-09', 'Estagiário Administrativo', '2026-02-01', 1200.00, '83999224466', 'igor.adm@velozcar.com');


INSERT INTO Veiculos (ID_Veiculo, Placa_Veiculo, Modelo, Marca, Ano_Fabricacao, Cor_Predominante, Diaria, VStatus)
VALUES 
(33821, 'BRA2E19', 'Onix 1.0 Turbo', 'Chevrolet', 2024, 'Prata', 120.00, 'Disponível'),
(12944, 'QWQ5F44', 'Corolla XEi', 'Toyota', 2023, 'Branco Perolizado', 250.50, 'Alugado'),
(77102, 'PXP8G22', 'HB20 Vision', 'Hyundai', 2022, 'Preto', 110.00, 'Manutenção'),
(55019, 'KJG1H33', 'Compass Longitude', 'Jeep', 2024, 'Cinza Graphite', 380.00, 'Disponível'),
(99304, 'LOK9I55', 'Mobi Like', 'Fiat', 2021, 'Vermelho', 85.90, 'Disponível'),
(22187, 'MHZ4J66', 'Hilux SRX', 'Toyota', 2024, 'Prata', 550.00, 'Alugado'),
(44612, 'NBT2K77', 'Nivus Highline', 'Volkswagen', 2023, 'Azul Moonstone', 290.00, 'Disponível'),
(66299, 'OTY5L88', 'Kwid Zen', 'Renault', 2022, 'Branco', 79.90, 'Disponível'),
(10388, 'PUC1M99', 'Commander Overland', 'Jeep', 2024, 'Preto', 450.00, 'Manutenção'),
(88521, 'RWS3N11', 'Virtus Comfortline', 'Volkswagen', 2023, 'Cinza', 210.00, 'Disponível'),
(22745, 'VBT8O22', 'Civic Touring', 'Honda', 2024, 'Branco', 420.00, 'Alugado');

INSERT INTO Contratos (ID_Contrato, Data_Inicio_Locacao, Data_Fim_Prevista, Valor_Total_Contrato, Status_Contrato, ID_Cliente, ID_Funcionario)
VALUES 
(40620, '2026-03-21', '2026-03-30', 700.00, 'Ativo', 54489, 77831),
(7002, '2026-03-21', '2026-03-28', 840.00, 'Ativo', 12904, 45122),
(7003, '2026-03-22', '2026-03-25', 1250.00, 'Pendente', 44128, 77831),
(7004, '2026-03-22', '2026-03-30', 2100.00, 'Ativo', 90032, 10394),
(7005, '2026-03-23', '2026-03-24', 150.00, 'Finalizado', 33819, 55601),
(7006, '2026-03-23', '2026-03-26', 600.00, 'Ativo', 61255, 88219),
(7007, '2026-03-24', '2026-03-31', 3500.00, 'Ativo', 22987, 99402),
(7008, '2026-03-24', '2026-03-25', 90.00, 'Cancelado', 77401, 12755),
(7009, '2026-03-25', '2026-04-05', 4500.00, 'Ativo', 55612, 66318),
(7010, '2026-03-25', '2026-03-28', 750.00, 'Pendente', 10394, 22910)						
;

INSERT INTO Itens_Contrato (ID_Item_Contrato, ID_Contrato, ID_Veiculo, Valor_Diaria_Aplicado, Km_Saida, Km_Chegada, Tanque_Saida, Status)
VALUES 
(1, 40620, 33821, 120.00, 15000, 15200, 'Cheio', 'Devolvido'),
(2, 7002, 12944, 250.50, 22000, NULL, 'Cheio', 'Em Aberto'),
(3, 7003, 77102, 110.00, 35000, NULL, 'Meio', 'Em Aberto'),
(4, 7004, 55019, 380.00, 10500, NULL, 'Cheio', 'Em Aberto'),
(5, 7005, 99304, 85.90, 48000, 48150, 'Cheio', 'Devolvido'),
(6, 7006, 22187, 550.00, 42000, NULL, 'Cheio', 'Em Aberto'),
(7, 7007, 44612, 290.00, 18000, NULL, 'Meio', 'Em Aberto'),
(8, 7008, 66299, 79.90, 52000, 52010, 'Cheio', 'Cancelado'),
(9, 7009, 10388, 450.00, 5000, NULL, 'Cheio', 'Em Aberto'),
(10, 7010, 88521, 210.00, 12000, NULL, 'Cheio', 'Em Aberto')
;

INSERT INTO Pagamento (ID_Pagamento, Data_Pagamento, Metodo_Pagamento, Status_Pagamento, Numero_Transacao_Bancaria, Valor_Final_Com_Taxas, Observacoes_Gerais, ID_Contrato)
VALUES 
(901, '2026-03-21', 'Cartão de Crédito', 'Confirmado', 'TRX99221', 480.00, 'Pagamento integral', 40620),
(902, '2026-03-21', 'Pix', 'Pendente', 'PX88112', 1753.50, 'Aguardando compensação', 7002),
(903, '2026-03-22', 'Cartão de Débito', 'Confirmado', 'TRX44556', 1250.00, 'Sem taxas extras', 7003),
(904, '2026-03-22', 'Espécie', 'Confirmado', 'CASH001', 2100.00, 'Pago no balcão', 7004),
(905, '2026-03-23', 'Pix', 'Confirmado', 'PX11223', 150.00, 'Locação curta', 7005),
(906, '2026-03-23', 'Cartão de Crédito', 'Pendente', 'TRX77889', 1650.00, 'Parcelado em 3x', 7006),
(907, '2026-03-24', 'Transferência', 'Confirmado', 'TED55443', 3500.00, 'Cliente corporativo', 7007),
(908, '2026-03-24', 'Cartão de Crédito', 'Estornado', 'TRX11002', 0.00, 'Contrato cancelado', 7008),
(909, '2026-03-25', 'Pix', 'Confirmado', 'PX99001', 4500.00, 'Seguro incluso', 7009),
(910, '2026-03-25', 'Cartão de Débito', 'Pendente', 'TRX33445', 750.00, 'Verificar caução', 7010);

INSERT INTO Manutencao (ID_Manutencao, Descricao, Custo_Total, Data_Entrada, Data_Saida, Status_Manutencao, ID_Veiculo, ID_Funcionario)
VALUES 
(501, 'Troca de óleo e filtros', 350.00, '2026-03-01', '2026-03-01', 'Concluído', 77102, 55601),
(502, 'Revisão de 20.000km', 890.00, '2026-03-05', '2026-03-06', 'Concluído', 33821, 55601),
(503, 'Reparo no ar-condicionado', 450.00, '2026-03-10', NULL, 'Em andamento', 10388, 55601),
(504, 'Alinhamento e balanceamento', 180.00, '2026-03-12', '2026-03-12', 'Concluído', 99304, 77831),
(505, 'Troca de pastilhas de freio', 220.00, '2026-03-15', '2026-03-15', 'Concluído', 88521, 55601),
(506, 'Pintura do para-choque', 1200.00, '2026-03-18', NULL, 'Aguardando peças', 12944, 33107),
(507, 'Higienização interna profunda', 150.00, '2026-03-19', '2026-03-19', 'Concluído', 55019, 33107),
(508, 'Troca de pneus dianteiros', 900.00, '2026-03-20', '2026-03-20', 'Concluído', 22187, 55601),
(509, 'Substituição de lâmpadas farol', 85.00, '2026-03-21', '2026-03-21', 'Concluído', 44612, 77831),
(510, 'Reparo no sistema de injeção', 1500.00, '2026-03-21', NULL, 'Em análise', 22745, 55601);

-- Atualizações usando update

UPDATE Manutencao
SET Status_Manutencao = 'Concluído'
WHERE ID_Manutencao = 503;

UPDATE Veiculos
SET VStatus = 'Disponível'
WHERE ID_Veiculo = 10388;

UPDATE Veiculos 
SET Diaria = Diaria * 1.10
WHERE Marca = 'Jeep';

-- DQL -- Consultas de agregação/agrupamento

-- Tabela de veículos

SELECT COUNT(*)
FROM Veiculos
WHERE VStatus = 'Disponível';

SELECT VStatus, COUNT(*) AS Total_Veiculos
FROM Veiculos
GROUP BY VStatus;

-- Tabela de pagamentos

SELECT Metodo_Pagamento, AVG(Valor_Final_Com_Taxas) AS Media_Pagamento
FROM Pagamento
GROUP BY Metodo_Pagamento;

SELECT Status_Pagamento, SUM(Valor_Final_Com_Taxas) AS Total_Acumulado
FROM Pagamento
GROUP BY Status_Pagamento;

-- Tabela de funcionários

SELECT Cargo_Ocupado, SUM(Salario) AS Custo_Salarial_Total
FROM Funcionarios
GROUP BY Cargo_Ocupado;

SELECT MIN(Salario) AS Menor_Salario, MAX(Salario) AS Maior_Salario
FROM Funcionarios;

-- Tabela de contarto

SELECT Status_Contrato, SUM(Valor_Total_Contrato) AS Receita_Total
FROM Contratos
GROUP BY Status_Contrato;

SELECT ID_Funcionario, COUNT(ID_Contrato) AS Qtd_Contratos_Feitos
FROM Contratos
GROUP BY ID_Funcionario
ORDER BY Qtd_Contratos_Feitos DESC;

-- Tabela de itens de contrato
 
SELECT 
    ID_Contrato, 
    SUM(Valor_Diaria_Aplicado) AS Total_Diarias_Contrato,
    COUNT(ID_Veiculo) AS Qtd_Veiculos_No_Contrato
FROM Itens_Contrato
GROUP BY ID_Contrato;

SELECT 
    ID_Veiculo, 
    ROUND(AVG(Km_Chegada - Km_Saida), 2) AS Media_KM_Rodada,
    MAX(Km_Chegada - Km_Saida) AS Maior_Distancia_Percorrida
FROM Itens_Contrato
WHERE Km_Chegada IS NOT NULL 
GROUP BY ID_Veiculo;

-- Tabela de manutenção

SELECT ID_Funcionario, COUNT(*) AS Total_Servicos_Realizados
FROM Manutencao
GROUP BY ID_Funcionario;

SELECT ID_Veiculo, SUM(Custo_Total) AS Gasto_Acumulado_Oficina
FROM Manutencao
GROUP BY ID_Veiculo;

-- Operações entre tabelas


-- Operação entra a tabela 'Contratos' e 'Clientes'
SELECT 
    C.Nome_Completo AS Cliente, 
    CON.Data_Inicio_Locacao AS Data_Inicio, 
    CON.Valor_Total_Contrato AS Valor
FROM Cliente C
INNER JOIN Contratos CON ON C.ID_Cliente = CON.ID_Cliente
ORDER BY CON.Data_Inicio_Locacao DESC;

-- Operação entre as tambelas 'Veiculos' e 'Manutencao'

SELECT 
    V.Modelo, 
    V.Placa_Veiculo, 
    M.Descricao AS Problema_Relatado, 
    M.Status_Manutencao
FROM Veiculos V
LEFT JOIN Manutencao M ON V.ID_Veiculo = M.ID_Veiculo;

-- Operação entre as tambelas 'Contratos' ,'Cliente', 'Itens_Contrato' e 'Veiculos'

SELECT 
    CON.ID_Contrato,
    CLI.Nome_Completo AS Nome_Cliente,
    V.Modelo AS Carro_Alugado,
    I.Valor_Diaria_Aplicado AS Valor_Cobrado,
    I.Status AS Status_Do_Item
FROM Contratos CON
INNER JOIN Cliente CLI ON CON.ID_Cliente = CLI.ID_Cliente
INNER JOIN Itens_Contrato I ON CON.ID_Contrato = I.ID_Contrato
INNER JOIN Veiculos V ON I.ID_Veiculo = V.ID_Veiculo;