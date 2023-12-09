insert into universidade(nome_completo, sigla)
values('Universidade Federal do Parana', 'UFPR');

insert into universidade(nome_completo, sigla)
values('Universidade de Sao Paulo', 'USP');

insert into formacao(universidade, funcionario, data_formacao, grau, curso)
values('Universidade Federal do Parana',  '11111111111', TO_DATE ('11/04/1955', 'dd/mm/yyyy'), 'mestrado', 'antropologia');

insert into formacao(universidade, funcionario, data_formacao, grau, curso)
values('Universidade de Sao Paulo', '56982145778', TO_DATE ('25/03/2005', 'dd/mm/yyyy'), 'bacharelado', 'paleontologia');

insert into formacao(universidade, funcionario, data_formacao, grau, curso)
values('Universidade de Sao Paulo', '44444444444', TO_DATE ('20/10/201999', 'dd/mm/yyyy'), 'bacharelado', 'arquitetura e urbanismo');

insert into formacao(universidade, funcionario, data_formacao, grau, curso)
values('Universidade estadual paulista', '44444444444', TO_DATE ('15/06/2015', 'dd/mm/yyyy'), 'mestrado', 'fisica biomolecular');

insert into formacao(universidade, funcionario, data_formacao, grau, curso)
values('Universidade de Sao Paulo', '77777777777', TO_DATE ('16/11/2010', 'dd/mm/yyyy'), 'mestrado', 'zoologia');

insert into formacao(universidade, funcionario, data_formacao, grau, curso)
values('Universidade Federal do Parana', '77777777777', TO_DATE ('23/12/2020', 'dd/mm/yyyy'), 'doutorado', 'quimica');

insert into formacao(universidade, funcionario, data_formacao, grau, curso)
values('Universidade estadual paulista',  '69696969696', TO_DATE ('23/01/1948', 'dd/mm/yyyy'), 'doutorado', 'bioquimico');

insert into formacao(universidade, funcionario, data_formacao, grau, curso)
values('Universidade de Campinas',  '45454545454', TO_DATE ('14/02/2003', 'dd/mm/yyyy'), 'graduacao', 'aeronautica');

insert into formacao(universidade, funcionario, data_formacao, grau, curso)
values('Universidade de Campinas',  '45454545454', TO_DATE ('25/11/2015', 'dd/mm/yyyy'), 'mestrado', 'marmoraria');

insert into formacao(universidade, funcionario, data_formacao, grau, curso)
values('Universidade de Campinas',  '98567412389', TO_DATE ('30/05/2000', 'dd/mm/yyyy'), 'graduacao', 'mecanica hidraulica');


insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('11111111111', 'astronauta', 'Rodrigo', 'Rua Santos, 314', '679912345678', 'AB+');

insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('22222222222', 'coordenador', 'Juliana', 'Rua Silva, 123', null, 'O+');

insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('333333333', 'supervisor', 'Mariana', null, null, null);

insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('44444444444', 'cientista', 'Beatriz', 'Rua Oliveira, 314', null, 'A-');

insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('55555555555', 'coordenador', 'Abel', null, '679911274678', 'AB-');

insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('66666666666', 'astronauta', 'Lucia', 'Rua Lopes, 673', null, null);

insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('77777777777', 'cientista', 'Paulo', 'Av Rodrigues, 314', '1323789523', 'A+');

insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('88888888888', 'supervisor', 'Rosana', 'Rua Tinca, 999', '18998253615', 'AB+');

insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('99999999999', 'astronauta', 'Karina', 'Rua Marechal, 327', '1563712523', 'B-');

insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('56982145778', 'astronauta', 'Vera', 'Rua alameda dos anjos, 666', null, null);

insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('45454545454', 'astronauta', 'Aliel', 'Rua lauro gomes, 458', null, null);

insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('69696969696', 'cientista', 'Ariel', 'Rua Panamera, 333', null, 'B-');

insert into funcionario(cpf, cargo, nome, endereco, telefone, tipo_sanguineo)
values('98567412389', 'astronauta', 'Marcos', 'Rua Alexandre Melo, 189', null, 'B+');

insert into coordenador(cpf)
values('22222222222');

insert into coordenador(cpf)
values('55555555555');

insert into ferramentas(coordenador, ferramenta)
values('22222222222', 'Python');

insert into ferramentas(coordenador, ferramenta)
values('22222222222', 'Excel');

insert into ferramentas(coordenador, ferramenta)
values('22222222222', 'Word');

insert into ferramentas(coordenador, ferramenta)
values('55555555555', 'Java');

insert into NAVE(NUMERO_CHASSI, CAPACIDADE_COMBUSTIVEL)
values('66669999', DEFAULT);

insert into NAVE(NUMERO_CHASSI, CAPACIDADE_COMBUSTIVEL)
values('7894565', '79');

insert into COMPONENTES(NAVE, COMPONENTE)
values('7894565', 'antena');

insert into COMPONENTES(NAVE, COMPONENTE)
values('7894565', 'bateria');

insert into astronauta(cpf, numero_habilitacao, nave)
values('66666666666', '123456789', '66669999');

insert into astronauta(cpf, numero_habilitacao, nave)
values('11111111111', '987654321', '66669999');

insert into astronauta(cpf, numero_habilitacao, nave)
values('99999999999', '781967293', '7894565');

insert into SISTEMA_PLANETARIO(ESTRELA_PRINCIPAL, DISTANCIA)
values('altair', 151155.77);

insert into SISTEMA_PLANETARIO(ESTRELA_PRINCIPAL, DISTANCIA)
values('crux', 222233.444);

insert into PLANETA(COORDENADA, NOME, TIPO, SISTEMA, NUMERO_LUAS)
values('123456789', 'terra', 'MISTO', 'altair', DEFAULT );

insert into PLANETA(COORDENADA, NOME, TIPO, SISTEMA, NUMERO_LUAS)
values('987654321', 'kaart', 'GASOSO', 'crux', 6 );

insert into LUA(COORDENADA, NOME)
values('123456789', 'titan');

insert into LUA(COORDENADA, NOME)
values('987654321', 'arquimedes');

insert into ESTAÇÃO_ESPACIAL(PLANETA, NUMERO, NOME_ESTAÇÃO)
values('123456789', 2222333, 'Skylab');

insert into ESTAÇÃO_ESPACIAL(PLANETA, NUMERO, NOME_ESTAÇÃO)
values('987654321', 6677, 'Mir');

insert into VIAGEM( DATA_PARTIDA,  PLANETA_DESTINO, ESTAÇÃO_VIAGEM, NAVE, COORDENADOR)
values(TO_DATE('11/04/2000', 'dd/mm/yyyy'), '987654321', 6677, '7894565', '22222222222');

insert into VIAGEM( DATA_PARTIDA,  PLANETA_DESTINO, ESTAÇÃO_VIAGEM, NAVE, COORDENADOR)
values(TO_DATE('10/04/2003', 'dd/mm/yyyy'), '123456789', 2222333 , '66669999', '55555555555');

insert into VIAGEM( DATA_PARTIDA,  PLANETA_DESTINO, ESTAÇÃO_VIAGEM, NAVE, COORDENADOR)
values(TO_DATE('25/12/2010', 'dd/mm/yyyy'), '123456789', 2222333, '7894565', '55555555555');

insert into VIAGEM( DATA_PARTIDA,  PLANETA_DESTINO, ESTAÇÃO_VIAGEM, NAVE, COORDENADOR)
values(TO_DATE('25/12/2010', 'dd/mm/yyyy'), '987654321', 6677, '66669999', '55555555555');

insert into engenheiro(num_registro, especializacao)
values('123', 'mecânica');

insert into engenheiro(num_registro, especializacao)
values('999', 'eletrônica');

insert into equipamento_exploracao(num_patrimonio, nome, data_fabricacao, funcao)
values ('111', 'Robo', TO_DATE('19/02/2000', 'dd/mm/yyyy'), 'Rastrear moleculas');

insert into equipamento_exploracao(num_patrimonio, nome, data_fabricacao, funcao)
values ('222', 'Telescópio', TO_DATE('28/02/2000', 'dd/mm/yyyy'), 'Enxergar melhor');

insert into equipamento_exploracao(num_patrimonio, nome, data_fabricacao, funcao)
values ('333', 'Termometro de solo', TO_DATE('05/03/2022', 'dd/mm/yyyy'), 'Medir temperatura do solo');

insert into manutencao_equipamento(engenheiro, equipamento)
values('123', '111');

insert into manutencao_equipamento(engenheiro, equipamento)
values('999', '222');

insert into manutencao_equipamento(engenheiro, equipamento)
values('123', '333');

insert into amostra(num_amostra, planeta, coord_geografica, descricao)
values('888', '123456789', '248;-90;78', 'amostra recolhida no solo');

insert into amostra(num_amostra, planeta,  coord_geografica, descricao)
values('777', '987654321', '33;126;-76', 'amostra recolhida na agua');

insert into amostra(num_amostra, planeta, coord_geografica, descricao)
values('999', '987654321', '12;88;-190', 'amostra encontrada em vestígios de dinossauro');

insert into amostra(num_amostra, planeta, coord_geografica, descricao)
values('898', '123456789', '-122;10;40', 'amostra fluida encontrada em poço de lava');

insert into exploracao_amostra(amostra, planeta, equipamento)
values('888', '123456789', '222');

insert into exploracao_amostra(amostra, planeta, equipamento)
values('777', '987654321', '222');

insert into INSTRUMENTO_PESQUISA(num_patrimonio, finalidade, nome)
values(1, 'amplia a visão de objetos', 'microscopio');

insert into INSTRUMENTO_PESQUISA(num_patrimonio, finalidade, nome)
values(2, 'Ajuda na manipulação de objetos', 'pinça');

insert into CIENTISTA(cpf, atuacao)
values('44444444444', 'Químico');

insert into CIENTISTA(cpf, atuacao)
values('77777777777', 'Físico');

insert into SUPERVISOR(cpf, anos_experiencia)
values('333333333', 15);

insert into SUPERVISOR(cpf, anos_experiencia)
values('88888888888', 20);

insert into ELEMENTO_QUIMICO(num_atomico, estado, radioatividade, nome, classificacao)
values(0, 'solido', '6.000 mSv', 'elementoX', 'metal');

insert into ELEMENTO_QUIMICO(num_atomico, estado, radioatividade, nome, classificacao)
values(1, 'solido', '12.000 mSv', 'elementoY', 'ametal');

insert into PESQUISA(codigo, area, amostra, planeta_amostra, cientista, supervisor)
values('00000000001', 'Química', '777', '987654321', '44444444444','333333333');

insert into PESQUISA(codigo, area, amostra, planeta_amostra, cientista, supervisor)
values('00000000002', 'Física', '888', '123456789', '77777777777', '88888888888');

insert into pesquisa(codigo, area, amostra, planeta_amostra, cientista, supervisor)
values ('00000000003', 'Geologia', '777', '987654321', '77777777777', '88888888888');

insert into pesquisa(codigo, area, amostra, planeta_amostra, cientista, supervisor)
values ('00000000004', 'Geologia', '999', '987654321', '77777777777', '333333333');

insert into pesquisa(codigo, area, amostra, planeta_amostra, cientista, supervisor)
values ('00000000005', 'Química', '898', '123456789', '77777777777', '88888888888');

insert into pesquisa(codigo, area, amostra, planeta_amostra, cientista, supervisor)
values ('00000000006', 'Química', '999', '987654321', '44444444444', '333333333');

insert into UTILIZADOS(instrumento_de_pesquisa, pesquisa)
values(1 ,'00000000001');

insert into UTILIZADOS(instrumento_de_pesquisa, pesquisa)
values(2 ,'00000000002');

insert into DESCOBERTA(elemento_quimico, pesquisa)
values(0, '00000000001');

insert into DESCOBERTA(elemento_quimico, pesquisa)
values(1, '00000000002');