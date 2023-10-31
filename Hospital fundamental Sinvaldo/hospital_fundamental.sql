CREATE DATABASE IF NOT EXISTS `hospital_fundamental`;

USE `hospital_fundamental`;

CREATE TABLE IF NOT EXISTS `paciente` (
  `id_paciente` int PRIMARY KEY AUTO_INCREMENT,
  `nome_completo` varchar(255),
  `data_nascimento` date,
  `endereco_fk` int,
  `telefone` varchar(255),
  `email` varchar(255),
  `rg` varchar(255),
  `cpf` varchar(255),
  `convenio_fk` int
);

CREATE TABLE IF NOT EXISTS `convenio` (
  `id_convenio` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `cnpj` varchar(255),
  `tempo_carencia` varchar(255)
);

CREATE TABLE IF NOT EXISTS `medico` (
  `id_medico` int PRIMARY KEY AUTO_INCREMENT,
  `nome_completo` varchar(255),
  `endereco_fk` int,
  `telefone` varchar(255),
  `cpf` varchar(255),
  `rg` varchar(255),
  `cargo_fk` int,
  `especialidade_fk` int
);

CREATE TABLE IF NOT EXISTS `cargo` (
  `id_cargo` int PRIMARY KEY AUTO_INCREMENT,
  `nome_cargo` varchar(255)
);

CREATE TABLE IF NOT EXISTS `especialidade` (
  `id_especialidade` int PRIMARY KEY AUTO_INCREMENT,
  `nome_especialidade` varchar(255)
);

CREATE TABLE IF NOT EXISTS `consulta` (
  `id_consulta` int PRIMARY KEY AUTO_INCREMENT,
  `data` date,
  `hora` time,
  `medico_fk` int,
  `paciente_fk` int,
  `valor_consulta` int,
  `convenio_fk` int,
  `especialidade` int,
  `receita_fk` int
);

CREATE TABLE IF NOT EXISTS `receita` (
  `id_receita` int PRIMARY KEY AUTO_INCREMENT,
  `paciente_fk` int,
  `medico_fk` int,
  `medicamentos` varchar(255),
  `quantidade` varchar(255),
  `instrucoes` varchar(255)
);

CREATE TABLE IF NOT EXISTS `endereco` (
  `id_endereco` int PRIMARY KEY AUTO_INCREMENT,
  `rua` varchar(255),
  `numero` varchar(255),
  `cep` varchar(255)
);

CREATE TABLE IF NOT EXISTS `enfermeiro` (
  `id_enfermeiro` int PRIMARY KEY AUTO_INCREMENT,
  `nome_completo` varchar(255),
  `cpf` varchar(255),
  `cre` varchar(255)
);

CREATE TABLE IF NOT EXISTS `internacao` (
  `id_internacao` int PRIMARY KEY AUTO_INCREMENT,
  `quarto_fk` int,
  `paciente_fk` int,
  `medico_fk` int,
  `enfermeiro_fk` int,
  `enfermeiro_auxiliar_fk` int,
  `data_entrada` date,
  `data_prev_saida` date,
  `data_alta` date,
  `procedimento` varchar(255)
);

CREATE TABLE IF NOT EXISTS `quarto` (
  `id_quarto` int PRIMARY KEY AUTO_INCREMENT,
  `numero` int,
  `tipo_fk` int
);

CREATE TABLE IF NOT EXISTS `tipo_quarto` (
  `id_tipo` int PRIMARY KEY AUTO_INCREMENT,
  `descricao` varchar(255),
  `valor_diaria` int
);

ALTER TABLE `paciente` ADD FOREIGN KEY (`endereco_fk`) REFERENCES `endereco` (`id_endereco`);

ALTER TABLE `paciente` ADD FOREIGN KEY (`convenio_fk`) REFERENCES `convenio` (`id_convenio`);

ALTER TABLE `medico` ADD FOREIGN KEY (`endereco_fk`) REFERENCES `endereco` (`id_endereco`);

ALTER TABLE `medico` ADD FOREIGN KEY (`cargo_fk`) REFERENCES `cargo` (`id_cargo`);

ALTER TABLE `medico` ADD FOREIGN KEY (`especialidade_fk`) REFERENCES `especialidade` (`id_especialidade`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`medico_fk`) REFERENCES `medico` (`id_medico`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`convenio_fk`) REFERENCES `convenio` (`id_convenio`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`paciente_fk`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `consulta` ADD FOREIGN KEY (`receita_fk`) REFERENCES `receita` (`id_receita`);

ALTER TABLE `receita` ADD FOREIGN KEY (`paciente_fk`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `receita` ADD FOREIGN KEY (`medico_fk`) REFERENCES `medico` (`id_medico`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`quarto_fk`) REFERENCES `quarto` (`id_quarto`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`paciente_fk`) REFERENCES `paciente` (`id_paciente`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`medico_fk`) REFERENCES `medico` (`id_medico`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`enfermeiro_fk`) REFERENCES `enfermeiro` (`id_enfermeiro`);

ALTER TABLE `internacao` ADD FOREIGN KEY (`enfermeiro_auxiliar_fk`) REFERENCES `enfermeiro` (`id_enfermeiro`);

ALTER TABLE `quarto` ADD FOREIGN KEY (`tipo_fk`) REFERENCES `tipo_quarto` (`id_tipo`);

-- PARTE 3
-- adicionando especialidades
INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Pediatria');

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Clínica Geral');

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Gastroenterologia');

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Dermatologia');

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Cardiologista');

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Radiologista');

INSERT INTO especialidade (id_especialidade, nome_especialidade) 
VALUES (null, 'Geriatria');


-- adicionando cargos
INSERT INTO cargo(id_cargo, nome_cargo) 
VALUES (null, 'Generalista');

INSERT INTO cargo(id_cargo, nome_cargo) 
VALUES (null, 'Especialista');

INSERT INTO cargo(id_cargo, nome_cargo) 
VALUES (null, 'Residente');

-- adicionando tipo de quarto
insert into tipo_quarto(id_tipo,descricao,valor_diaria) values (null, 'Quarto duplo', 2000.00);
insert into tipo_quarto(id_tipo,descricao,valor_diaria) values (null, 'Apartamento', 3500.00);
insert into tipo_quarto(id_tipo,descricao,valor_diaria) values (null, 'Enfermaria', 1000.00);

-- adicionando quartos
insert into quarto(id_quarto, numero, tipo_fk) values (null, 90, 1);
insert into quarto(id_quarto, numero, tipo_fk) values (null, 130, 1);
insert into quarto(id_quarto, numero, tipo_fk) values (null, 180, 1);
insert into quarto(id_quarto, numero, tipo_fk) values (null, 200, 2);
insert into quarto(id_quarto, numero, tipo_fk) values (null, 201, 2);
insert into quarto(id_quarto, numero, tipo_fk) values (null, 202, 2);
insert into quarto(id_quarto, numero, tipo_fk) values (null, 300, 3);

-- adicionando enfermeiros
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Paula Sousa', '74851458', '415119');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Maniel Oliveira', '58745717', '358109');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Carlos Palmares', '79654145', '012558');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Beatriz de Castro', '45879547', '963214');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Fernando Rodrigues', '12589612', '654169');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'João Eduardo de Sousa', '26122596', '896655');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Bruna Almeida', '12065873', '784456');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Diego Silva', '2143364', '245587');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Renato Antônio', '74194587', '426478');
insert into enfermeiro(id_enfermeiro, nome_completo, cpf, cre) values(null, 'Marcelado dos Santos', '48752514', '358369');

-- adicionando convenio
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) 
values (null, 'Vida Blue', '23.400.768/0001-43', '24 horas');
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) 
values (null, 'Luz Verde', '23.938.748/0001-43', '24 horas');
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) 
values (null, 'Em mil', '23.400.308/0001-43', ' 360 dias (12 meses)');
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) 
values (null, 'Grand saúde', '23.400.768/3941-43', '180 dias (6 meses)');

-- adicionando 10 medicos e enderecos
INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida Paulista', '2255', '09954-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Carlos Silva', 1, '(11)99338-9999', '337.568.888-00', '30.123.432-3', 2, 1);

INSERT INTo endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida Romulo Neto', '5980', '29327-050');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Rosangela Santos Silva', 2, '(11)97322-7899', '782.915.435-41', '85.478.445-7', 2, 1);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Pedro Paulo Farias', '85', '215832-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Marcelo Ferreira', 3, '(11)93325-7884', '445.455.125-85', '50.745.478-5', 1, 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Maria Eduarda', '37', '03156-070');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Airton Meger', 4, '(11)91285-7484', '542.454.784-85', '54.045.578-5', 2, 3);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida Camila Guto', '263', '09032-070');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Marcelo Donald', 5, '(11)94515-2154', '582.455.455-85', '54.855.233-5', 2, 4);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, "Rua Gusttavo Faria", '125', '0561-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Vinicius Bezerra', 6, '(11)95321-7455', '432.455.455-85', '54.751.855-5', 2, 5);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida Petronio Portali', '730', '03815-050');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Daniel Lima', 7, '(11)999865-7455', '844.432.965-85', '54.664.855-5', 2, 6);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Guardiola Andrade', '1212', '03668-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Manuela Oliveira', 8, '(11)95833-7405', '566.159.321-85', '54.732.633-5', 2, 7);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida Armando Peixoto', '254', '03280-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, 'Camilla Odete', 9, '(11)95385-7455', '845.815.733-85', '54.4.230-5', 3, 1);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua dos Poloneses', '235', '02123-090');
INSERT INTO medico(id_medico, nome_completo, endereco_fk, telefone, cpf, rg, cargo_fk, especialidade_fk ) 
VALUES (null, ' Miguel loretto', 10, '(11)95827-71255', '811.562.405-85', '54.460.855-5', 3, 5);

-- adicionando 15 pacientes
INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Renato Ventura', '26', '80218-480');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Ricardo Morais Silveira', '2001-02-19', 11,'rica.mora@gmail.com', '(11)93627-5585', '245.502.633-25', '38.874.245-5', null);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Danilo Ferreira', '312', '64985-750');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, ' Tatiane Pinheiro', '25-02-10', 12,'Tatiane.Pinheiro@gmail.com', '(11)95648-7233', '082.120.165-22', '41.003.784-8', 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Chico Anysio', '515', '82450-340');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Pedro Paulo', '1961-07-25', 13,'pedro-paulo73@gmail.com', '(11)98236-4517', '740.321.730-75', '41.288.654-6', 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida Eliseu de Almeida', '548', '54632-282');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, ' Janaina Gonçalves', '1962-05-22', 14,'janaina_gonçalves@gmail.com', '(11)99564-6644', '603.415.641-23', '14.069.305-0', 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Guilhermina Fonseca', '301', '29325-368');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Manuela Palini Fernandes', '1991-11-01', 15,'manu_palini_fernandes@gmail.com', '(12)99589-8229', '967.723.698-01', '10.574.972-3', 4);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Gabriela Mendonça', '24 A', '79623-231');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Caique Pereira Silva', '1962-01-19', 16,'caique.pereira@gmail.com', '(11)99452-2364', '003.050.774-76', '26.030.016-7', 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Borboleta Raidiante', '18', '59367-030');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Fátima Luana', '1995-07-13', 17,'fatima.luana@gmail.com', '(11)95478-1321', '236.039.566-55', '10.406.200-3', null);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Comodoro', '82', '77365-016');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Joana Matarazzo', '1965-22-10', 18, 'joana_matarazzo@gmail.com', '(11)99989-2025', '265.260.450-63', '12.427.162-4', 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Jorge Luis', '250', '61566-340');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Alberto Roberto', '2005-14-10', 18,'alberto.roberto@gmail.com', '(11)98332-5745', '752.420.455-58', '28.346.181-3', null);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida Jó Soares', '1031', '73266-336');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Mônica Souza', '1995-04-20', 19,'monica.souza@gmail.com', '(11)98365-3922', '471.927.460-57', '46.654.077-0', 3);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Felipe Neto Silva', '99', '51020-328');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Rafael de Souza Silva', '1982-11-01', 20,'rafael-souza50@gmail.com', '(11)99635-2801', '032.861.925-95', '43.642.624-8', 3);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Janice Silva Nunes', '361', '29557-605');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Amanda Magalhães Rocha', '1958-11-23', 21,'amanda_maga@gmail.com', '(11)98894-3590', '623.210.480-90', '43.455.524-9', 4);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Avenida Francisco Morato', '148', '77932-424');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Jéssica Carvalho', '1978-04-17',20,'jessica.carvalho@gmail.com', '(11)92245-1538', '689.499.526-60', '36.654.716-5', 2);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Roberto Gomes', '1815', '82007-832');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Jordana Almeida', '2001-12-19', 11,'jorda@gmail.com', '(11)98533-3892', '245.320.393-25', '38.283.217-5', 3);

INSERT INTO endereco(id_endereco, rua, numero, cep) 
VALUES (null, 'Rua Coimbra Neto', '223', '32429-680');
INSERT INTO paciente(id_paciente, nome_completo, data_nascimento, endereco_fk, email, telefone, cpf, rg, convenio_fk ) 
VALUES (null, 'Luccas Quirino ', '2001-09-12', 11,'lucas.quirino@gmail.com', '(11)92702-1585', '245.505.673-25', '28
.571.245-5', 2);

-- adicionando 20 consultas e receitas

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 4,8, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '15/03/2015', '13:30:00', 8, 4, 180.00, 2, 7, 1);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 4,8, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 24 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '26/04/2015', '8:45:00', 8, 4, 300.00, 1, 7, 2);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 1,8, "Dipirona", "1 comprimida","1 comprimido a cada dois dias no periodo de uma semana");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '07/05/2015', '9:00:00', 8, 1, 190.00, null, 1, 3);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 3,6, "Romaselina", "10g", "Cobrir as feridas com a pomada Rosamelina uma vez ao dia");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '08/06/2016', '17:40:00', 6, 3, 250.00, 2, 4, 4);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 4,6, "Poliramos", "1 comprimido", "Tomar um comprimido a cada doze horas no periodo de um dia");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '22/07/2016', '10:00:00', 6, 4, 190.00, 2, 5, 5);

INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '08//08/2016', '15:00:00', 7, 5, 250.00, 4, 6, null);

INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '07/01/2017', '8:00:00', 6, 7, 250.00, null, 6, null);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 9,2, "Dipirona", "1 comprimida","1 comprimido a cada dois dias no periodo de uma semana");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '13/02/2017', '14:00:00', 2, 9, 150.00, null, 1, 6);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 2,8, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '22/03/2017', '16:00:00', 8, 2, 250.00, 1, 7, 7);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 5,4, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '05/06/2018', '9:00:00', 4, 5, 100.00, 3, 3, 8);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 11,7, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '20/08/2018', '12:00:00', 7, 11, 100.00, 3, 6, 9);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 11,7, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '17/09/2018', '13:30:00', 7, 11, 100.00, 3, 6, 10);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 12,8, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '22/10/2018', '17:30:00', 8, 12, 100.00, 2, 7, 11);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 14,3, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '05/02/2019', '11:00:00', 3, 14, 100.00, 3, 2, 12);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 15,3, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '08/03/2019', '8:30:00', 3, 15, 100.00, 2, 2, 13);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 9,2, "Dipirona", "1 comprimida","1 comprimido a cada dois dias no periodo de uma semana");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '15/05/2019', '9:30:00', 2, 9, 150.00, null, 1, 14);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 2,8, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '04/06/2019', '16:30:00', 8, 2, 100.00, 1, 7, 15);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 5,4, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '08/01/2020', '8:00:00', 4, 5, 100.00, 3, 3, 16);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 11,7, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '19/02/2021', '11:00:00', 7, 11, 100.00, 3, 6, 17);

INSERT INTO receita(id_receita, paciente_fk, medico_fk, medicamentos, quantidade, instrucoes)
VALUES (null, 11,7, "Amoxilina", "100g", "Tomar 10 gramas de Amoxilina a cada 12 horas");
INSERT INTO consulta(id_consulta, data, hora, medico_fk, paciente_fk, valor_consulta, convenio_fk, especialidade, receita_fk)
VALUES(null, '25/03/2022', '11:00:00', 7, 11, 100.00, 3, 6, 18);

-- adicionando internações
INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 1, 12, 6, 1, 2, '01/01/2016', '21/02/206', '19/02/2016', "Trocar as bombas de redenção de liquido");

INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 1, 11, 6, 1, 2, '15/02/2016', '18/02/2016', '20/02/2016', "Trocar as bombas de redenção de liquido");

INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 2, 1, 1, 3, 4, '03/03/2016', '10/03/20', '15/03/2016', "Injetar soro a cada oito horas");

INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 3, 12, 6, 5, 6, '01/01/2017', '05/01-2017', '03/01/10', "Trocar as bombas de redenção de liquido");

INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 6, 8, 3, 7, 8, '07/03/2017', '17/03/2017', '20/03-2017', "Trocar as bombas de redenção de liquido");

INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 6, 8, 3, 9, 2, '25-07-2019', '15-08-2019', '13/08/2019', "Paciente em observação");

INSERT INTO internacao(id_internacao, quarto_fk, paciente_fk, medico_fk, enfermeiro_fk, enfermeiro_auxiliar_fk, data_entrada, data_prev_saida, data_alta, procedimento)
VALUES(null, 7, 10, 10, 10, 5, '20/09/2021', '11/10/2021', '14/10/2021', "Dar os comprimidos indicados e observar as reações do paciente");

-- parte 4
-- adicionar coluna em_atividade
ALTER TABLE medico ADD em_atividade varchar(255);

-- alterar a tabela medico
update medico set em_atividade = case id_medico
when 1 then 'Ativo'
when 2 then 'Ativo'
when 3 then 'Inativo'
when 4 then 'Ativo'
when 5 then 'Ativo'
when 6 then 'Ativo'
when 7 then 'Inativo'
when 8 then 'Ativo'
when 9 then 'Ativo'
when 10 then 'Ativo'
end
where id_medico in (1,2,3,4,5,6,7,8,9,10)

-- PARTE 5
-- Todos os dados e o valor médio das consultas do ano de 2021 e das que foram feitas sob convênio.
select * from consulta having year(data) = '2021';

-- Todos os dados das internações que tiveram data de alta maior que a data prevista para a alta.
select * from internacao where data_alta > data_prev_saida;

-- Receituário completo da primeira consulta registrada com receituário associado.
select receita.medicamentos, receita.quantidade, receita.instrucoes, paciente.nome_completo as paciente_nome, medico.nome_completo as medico_paciente  from receita inner join paciente on receita.paciente_fk=paciente.id_paciente inner join medico on receita.medico_fk=medico.id_medico order by receita.id_receita limit 1;

-- Todos os dados da consulta de maior valor e também da de menor valor (ambas as consultas não foram realizadas sob convênio).
select *, Max(valor_consulta), Min(valor_consulta) from consulta group by convenio_fk is null;

-- Todos os dados das internações em seus respectivos quartos, calculando o total da internação a partir do valor de diária do quarto e o número de dias entre a entrada e a alta.
 select internacao.id_internacao, quarto.id_quarto, datediff(data_alta, data_entrada) AS dias_em_uso, tipo_quarto.valor_diaria, datediff(data_alta, data_entrada) * tipo_quarto.valor_diaria valor_total from internacao inner join quarto on internacao.quarto_fk = quarto.id_quarto inner join tipo_quarto on quarto.tipo_fk = tipo_quarto.id_tipo group by id_internacao;
 
 -- Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.
 Select internacao.data_entrada, internacao.procedimento, quarto.numero from internacao inner join quarto on quarto.id_quarto = internacao.quarto_fk where quarto.tipo_fk = 2;
 
 -- Nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não seja “pediatria”, ordenando por data de realização da consulta.
  select paciente.nome_completo, consulta.data, especialidade.nome_especialidade from consulta inner join paciente on paciente.id_paciente = consulta.paciente_fk inner join especialidade on especialidade.id_especialidade = consulta.especialidade where consulta.especialidade <> 1 and YEAR(consulta.data) - YEAR(paciente.data_nascimento) < 19 and YEAR(consulta.data) - YEAR(paciente.data_nascimento) > 0 order by consulta.data;
  
  -- Nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.
  select paciente.nome_completo, medico.nome_completo, internacao.data_entrada, internacao.procedimento, quarto.tipo_fk from internacao inner join medico on medico.id_medico = internacao.medico_fk inner join paciente on paciente.id_paciente = internacao.paciente_fk inner join quarto on quarto.id_quarto = internacao.quarto_fk where quarto.tipo_fk = 3 and medico.especialidade_fk = 3;
  
-- Os nomes dos médicos e a quantidade de consultas que cada um realizou.
SELECT medico.nome_completo, COUNT(consulta.medico_fk) AS 'Quantidade de consultas' 
FROM medico
INNER JOIN consulta 
ON medico.id_medico = consulta.medico_fk
GROUP BY consulta.medico_fk;

-- Todos os médicos que tenham "Miguel" no nome.
select * from medico where nome_completo like "%Miguel%";  

-- Os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.
SELECT enfermeiro.nome_completo, enfermeiro.cre, COUNT(internacao.enfermeiro_fk) AS Participacao 
FROM enfermeiro 
INNER JOIN internacao 
ON enfermeiro.id_enfermeiro = internacao.enfermeiro_fk 
GROUP BY enfermeiro.id_enfermeiro 
HAVING Participacao > 1; 
  
