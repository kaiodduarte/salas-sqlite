DROP TABLE IF EXISTS professor;
CREATE TABLE professor (
	id INTEGER PRIMARY KEY AUTOINCREMENT, 
	nome VARCHAR(45)
);

DROP TABLE IF EXISTS materia;
CREATE TABLE materia (
	id INTEGER PRIMARY KEY, 
	professor_id INTEGER, 
	nome VARCHAR(45),
	FOREIGN KEY (professor_id) REFERENCES professor (id)
);

DROP TABLE IF EXISTS horario;
CREATE TABLE horario(
	id INTEGER NOT NULL,
	periodo VARCHAR(3) PRIMARY KEY
);

DROP TABLE IF EXISTS sala;
CREATE TABLE sala (
	nome VARCHAR(5) PRIMARY KEY,
	especial BOOLEAN DEFAULT 0
);

DROP TABLE IF EXISTS aula;
CREATE TABLE aula (
	id_materia VARCHAR(45),
	nome_sala VARCHAR(5),
	periodo VARCHAR(3),
	PRIMARY KEY (id_materia, nome_sala, periodo),
	FOREIGN KEY (id_materia) REFERENCES materia (id),
	FOREIGN KEY (nome_sala) REFERENCES sala (nome),
	FOREIGN KEY (periodo) REFERENCES horario (periodo)
);

====================================== INSERTS =================================================
1) Salas

INSERT INTO sala (nome, especial) VALUES ('B001', 1), ('B002', 1), ('B004', 1), 
('B005', 1), ('B006', 1), ('B007', 1), ('B009', 1), ('B101', 0), ('B102', 0),
('B103', 0), ('B104', 1), ('B105', 0), ('B106', 0), ('B107', 0), ('C001', 1), 
('C002', 1), ('C003', 1), ('C004', 1), ('C005', 1), ('C006', 1), ('C101', 1), 
('C102', 1), ('C103', 1), ('C104', 1), ('C105', 1), ('C106', 1), ('D101', 0), 
('D102', 1), ('D103', 1), ('D104', 1), ('D105', 0), ('D106', 0), ('D107', 0), 
('D108', 0), ('E001', 0), ('E003', 1), ('E004', 1), ('E005', 1), ('E007', 1),
('E100', 1), ('E101', 1), ('E102', 1), ('E103', 1), ('E104', 1), ('E105', 1), 
('F001', 0), ('F002', 1), ('F003', 1), ('F004', 1), ('F005', 0), ('F006', 1), 
('F007', 1), ('F008', 1), ('F101', 0), ('F102', 0), ('F105', 0), ('F106', 0), 
('F108', 0), ('F109', 0), ('F110', 0), ('G001', 1), ('G002', 1), ('G003', 1), 
('G004', 1), ('G005', 1), ('G006', 1), ('G007', 1), ('G008', 1), ('G101', 0), 
('G102', 0), ('G103', 0), ('G104', 0), ('H001', 1), ('H002', 1), ('H003', 0), 
('H004', 1), ('H005', 1), ('H101A', 1), ('H104', 0), ('H105', 0);

2) Horários

INSERT INTO horario (periodo, id) VALUES ('2m1', 1), ('2m2', 2), ('2m3', 3),
('2m4', 4), ('2m5', 5), ('2m6', 6), ('2t1', 7), ('2t2', 8), ('2t3', 9), 
('2t4', 10), ('2t5', 11), ('2t6', 12), ('2n1', 13), ('2n2', 14), ('2n3', 15),
('2n4', 16), ('2n5', 17), ('3m1', 18), ('3m2', 19), ('3m3', 20), ('3m4', 21),
('3m5', 22), ('3m6', 23), ('3t1', 24), ('3t2', 25),('3t3', 26),('3t4', 27),
('3t5', 28), ('3t6', 29), ('3n1', 30), ('3n2', 31), ('3n3', 32), ('3n4', 33),
('3n5', 34), ('4m1', 35), ('4m2', 36), ('4m3', 37), ('4m4', 38), ('4m5', 39),
('4m6', 40), ('4t1', 41), ('4t2', 42), ('4t3', 43), ('4t4', 44), ('4t5', 45),
('4t6', 46), ('4n1', 47), ('4n2', 48), ('4n3', 49), ('4n4', 50), ('4n5', 51),
('5m1', 52), ('5m2', 53), ('5m3', 54), ('5m4', 55), ('5m5', 56), ('5m6', 57),
('5t1', 58), ('5t2', 59), ('5t3', 60), ('5t4', 61), ('5t5', 62), ('5t6', 63),
('5n1', 64), ('5n2', 65), ('5n3', 66), ('5n4', 67), ('5n5', 68), ('6m1', 69),
('6m2', 70), ('6m3', 71), ('6m4', 72), ('6m5', 73), ('6m6', 74), ('6t1', 75),
('6t2', 76), ('6t3', 77), ('6t4', 78), ('6t5', 79), ('6t6', 80), ('6n1', 81),
('6n2', 82), ('6n3', 83), ('6n4', 84), ('6n5', 85), ('7m1', 86), ('7m2', 87),
('7m3', 88), ('7m4', 89), ('7m5', 90), ('7m6', 91), ('7t1', 92), ('7t2', 93),
('7t3', 94), ('7t4', 95), ('7t5', 96), ('7t6', 97), ('7n1', 98), ('7n2', 99),
('7n3', 100), ('7n4', 101), ('7n5', 102);

3) Professor

INSERT INTO professor (nome) VALUES()

4) Matérias

INSERT INTO materia (nome, professor_id) VALUES()

5) Aulas

INSERT INTO aula (id_materia, nome_sala, periodo) VALUES()


================================= SELECTs ========================================================

--------------------testes select pra notificar--------------
SELECT H.periodo AS periodo, A.nome_materia, A.nome_sala
FROM horario H 
left outer join aula AS A ON (H.periodo = A.periodo AND A.nome_sala like 'E%')
WHERE id > (SELECT id FROM horario WHERE periodo = '2m1')
  AND H.periodo LIKE '2%';

---------------------select p/ buscar horários---------------
SELECT S.nome AS Sala, M.nome AS Materia, P.nome AS nome
FROM sala S
left outer join aula AS A ON (A.nome_sala = S.nome AND A.periodo = ?)
left outer join materia AS M ON (A.id_materia = M.id)
left outer join professor AS P ON (P.id = M.professor_id)
WHERE S.nome like ?;
