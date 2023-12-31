SET client_encoding TO 'utf8'

DROP TABLE IF EXISTS advices;
DROP TABLE IF EXISTS diseases_symptoms;
DROP TABLE IF EXISTS symptoms;
DROP TABLE IF EXISTS diseases;
DROP TABLE IF EXISTS disease_types;

CREATE TABLE IF NOT EXISTS disease_types (
  id  serial   NOT NULL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS diseases (
  id      serial      NOT NULL PRIMARY KEY,
  name    TEXT NOT NULL,
  type_id int      NOT NULL,
  FOREIGN KEY (type_id) REFERENCES disease_types (id)
);

CREATE TABLE IF NOT EXISTS symptoms (
  id          serial NOT NULL PRIMARY KEY,
  description TEXT    NOT NULL
);

CREATE TABLE IF NOT EXISTS diseases_symptoms (
  id         serial NOT NULL PRIMARY KEY,
  disease_id INT NOT NULL,
  symptom_id INT NOT NULL,
  FOREIGN KEY (disease_id) REFERENCES diseases (id),
  FOREIGN KEY (symptom_id) REFERENCES symptoms (id)
);

CREATE TABLE IF NOT EXISTS advices (
  id         serial NOT NULL PRIMARY KEY,
  disease_id INT NOT NULL UNIQUE,
  text       TEXT,
  FOREIGN KEY (disease_id) REFERENCES diseases (id)
);

DELETE FROM advices;
DELETE FROM diseases_symptoms;
DELETE FROM symptoms;
DELETE FROM diseases;
DELETE FROM disease_types;

INSERT INTO disease_types (id, name) VALUES
  (1, '������'),
  (2, '���'),
  (3, '����'),
  (4, '����'),
  (5, '��������');

INSERT INTO diseases (id, name, type_id) VALUES
  (1, '�������������', 1),
  (2, '�����', 1),
  (3, '����', 2),
  (4, '����������', 3),
  (5, '������', 3),
  (6, '����������', 5),
  (7, '������������ �������', 5),
  (8, '������� ��������', 5),
  (9, '������', 4),
  (10, '������', 4),
  (11, '�������', 4);

INSERT INTO symptoms (id, description) VALUES
  (1, '�������� ����'),
  (2, '��������'),
  (3, '���������� �����������'),
  (4, '�������'),
  (5, '��������������'),
  (6, '���� � �����'),
  (7, '������'),
  (8, '���� ��� ��������'),
  (9, '�������� � ��������'),
  (10, '���������� ���� �� ����� ������� ���'),
  (11, '���� � ���� ��� ���, ������������� ��� �������� �����'),
  (12, '������ ����, ����������� � ��������� �����'),
  (13, '������ ����, ������� ���������� � ������� ��� � ������� �� �������� ������� ���'),
  (14, '���� � ������'),
  (15, '�����'),
  (16, '�������'),
  (17, '���� � ��������'),
  (18, '����������� ��� ������'),
  (19, '���������� ���'),
  (20, '���� � ������� ����� ����'),
  (21, '����������� � ������� ����� ����'),
  (22, '��������� ����������� ���� ��� ���������� �������� ����'),
  (23, '���� � ���������������� �������� ������� ������� ���'),
  (24, '������� ����� - ������� ����� ����'),
  (25, '���� � ����� ����������� �����');

INSERT INTO diseases_symptoms (disease_id, symptom_id) VALUES
  (1, 1),
  (1, 2),
  (1, 5),
  (2, 1),
  (2, 2),
  (2, 3),
  (2, 4),
  (2, 5),
  (3, 2),
  (3, 4),
  (3, 6),
  (3, 7),
  (3, 8),
  (3, 9),
  (4, 10),
  (4, 11),
  (5, 12),
  (5, 13),
  (6, 3),
  (6, 14),
  (6, 15),
  (6, 16),
  (7, 14),
  (7, 16),
  (8, 14),
  (8, 15),
  (8, 16),
  (9, 17),
  (9, 18),
  (9, 19),
  (10, 20),
  (10, 21),
  (10, 22),
  (11, 3),
  (11, 20),
  (11, 21),
  (11, 22),
  (11, 23),
  (11, 24),
  (11, 25);

INSERT INTO advices (disease_id, text) VALUES
  (1, '��� �� �������, �� ����� ����������� ������ ������ � �������������� �������� � ����� ������� � ��� ���������� �������� �� �������. ������� �� ������ ������ ����-�� ���� � ������, ��� ���� 500 ������ � ������������� �� �������. ������ ����� ��������� � ���������.\n��-������, �� ����� ������ ����� ���������������� �� ������� �����. ��� ����� �������� ����� ����� ���� ��� ��������� �����. �����, ����� ��� ���� ������������ ������ �����, ����� �������� ��������� ������ �������� � �������� �� ���������, ������������� ��� � ����������.\n��-������, ����� ������ ��� ��� ��������, ��������� � ������������ �����, � �� ��� ������� ������ ������ ������ � ���-�� ������� � ��������. ����� �������, �� ������ ������� ��� ���� ���-�� �����, ���������� � �����, ���-�� ��������� ��� ���� ��� � ���-�� �������� ���������. �������� ��� ��������, �� ���������, ��� �������� ������� � ����� ����� ����� ����������� �������� ���� ���������.\n����� ��� ������ � �������������� ����� ��������� ���������� ������ �������, ���������� �� ����-����, ������� �������� �������. ��� �� ������, ��� ������ ���� ������ � �������� ������ ����������� ��� �� ������ �������� ���������� �� ���������. ����� ������ ������ � �������, ��������� ��� �������, � ��� ��������� ��� ���� � ������� ����.\n�������� ���� ���������, ����� �������� �����������, ������� ��� �� �������� ������������� � ��������. ���������� ����� ����� � �����. ���������� ������ ���������� ���. �������� � ������������ � ������������ �����. �������, ��� 8 ����� ��� ��� ������ ������ ��� ������ ���������. ����� ��� �������� �� ����� �������� ����. ���������� �������� ���� ��� ����������� ������, ������������ � ������� � ��������, ��������� ���� �� ���� ���� ������ ����. � ��������� ������������� �� �� ������� ������ ��������� ������� ����, ������� ������� ������������� ���� ���� � ��������� ���������� ���� �����������.\n����� ������� ������ � ����, ��������� ���-�� ��������. ���� �� ����� � ���� ��� � �����, ��� �� ������ ��������. ����� �������� ������ ����������� ��������� � ����� ������� � �������� ���������� �����������, � ����� ������ ����.'),
  (2, '������� ������� ������ ��������� ���������� ����� � ������� ������� �������. ���������� ������������ ��������, ��������������� � �������� ��������. ������������ �������������� �������� ���� � ������� � ���������������� ������ ������, � ����� ��� ������������� ����������, ���������� ����� �������.\n� ��������� ����������� ������ ���� �� ���� 20�� � �� 1-2� ���� �� ����� ��� �������. ���������� ������ �������������. ������� �� ������ ���������� �� ��������, ��� ������ �� ��� ������� ������ �������� �� �������, ����� ���������� ��� ������� �����. ������� ���� ������� ����� � �����, ����, ������� ��� � ������.\n� ��������� ����� ���������� ������������� ����������������� ��������, ������������� ���������� ������� ��������� ����. ��� ������� ������� ������� ����� ������������ ���������� � ���������, ��� �������� ��������� ����������� ������ ������ �. ������ ��� ��������� �������������� �������� �������, ���� ���� �������� ������������ � ��� ������. ���������������� ��� ������� ������������ ���������� ������������� ������� ������ � � �, ����������� ����������� ������� ��������� � �������� ������. � ����� ����������� ��������� (Glaxo) � ������������ (�������) (LaRoche).\n� ��������� ���� ������� ���������� ������� ����������� � �� ���������: ������������ ������������� ����������, ����������, �������, ��������, ����������, �������, �������� � ������.\n ����������������� ��������� ������������� �������� � ���� ������� ��� ������� ��������� �������������� ����������. ���������������� ���������� ������������ �� ����������, �.�. ��� �� ������������� ��������� �����������, � ������ ������������ ��� ��-�� ���������� ���������� ����� ����������� �����.\n������� ������ ����������������, �.�. ���������� ���������� ��������� ���������� �������, ������� ������� � �������� �������. �� ���������� ���� ��������� ��������������, ������������, ��������������������� ��������� � ��.'),
  (3, '������ ������������� �������� �������� (����) � ��� �������� �����������, ���������� ��������� �������� ������� ����������� �����. � ������ �� �������� ����������.\n������� ��������\n����� ��������������� ���������� (���� �������� �������� ������ ��������).\n\n���������������� ������� � �������������� � �������������� ���������, ���������������� ����� � �����, ����������� �������, �������� � ������ �� �����. ������� �����:\n����� �����. ��������� �����, ���� �� ������� �����, ��������� ����� � ���� ���� �� ����� ������� ��������� � ������������ ��������.\n���������� ��� ���� � ����� � ���������� � �������� ������, �������, ���������, ������� ��������� � ����������� ����.\n��������� ��� �����. ����� ���������� � ������� ���������. ����� ����������� � ������� �������� ��������. ����� ������� �������, ����, ��������� � ������ �������� ����. ����������� ���� ��� �������� ��������, ���������� ������� ������, ��������� � �������� �����.\n���������� ���� ��� �������� ������ ������� ���������.\n\n�������� �����. ����� ������ ������, ������� ������� �������� ����������� ����. ��������� �� ����� � ����: ����������, ����������, ������������ � ��� �������� � ������� ���������� ������� �, ������� ��������� ���������. ��������� ��������� ������ ��� � �������, � ����� � �������. � ������ ����������� ����� �������� 3�4 � �������� � ����.\n\n�������� �����. � ������ ���� ����������� ���� ����� ���������� ���� � ��� �� �������� ���������� � �� �������� ������.'),
  (4, '��������������� ���������� (����������)\n��������� ����������� ����������� ���� ������ ��������� ����� � ���������� ��������� ������� �������� �� �������: ������ ��������� �������, ���������� ��������, ������� �������������� �����. ������, �� �� ��� ��� ���������������� �������� - ��������������� ����������. �������� �� ��, ��� ����������� ��� ����������� ����������, ��� �������, ��������� ��� ���-�� ����� � ����� �� ������ ������ ���� � ��������.\n�������\n� ������ ������� �����������, ��� �������, ������������ ��������� (����������� �������� � ����������, ���������, ������� � ����������������� ��� ������ ���������� � �����. ������ ����������� ������������ ����� � ��������������� �����������, ���������������� �������, ����������� ����������, � ����� ������������ ��������������������� ���� � �����. ���� �� ������ ������� ������� � ����� ��� ������� � ����. ������ ��� �� ������, ��� �� ������� ������ ����������� ���������. ������ ������������� ��������� ������� ����� ����� �������� ��� ���������������. ���� �� ����������� �� ��������� ������ � ��������� �� �������� � ������ ��������.\n������, ������� ���������������� ����������� � ���� ������ � ��������� ����������� ����������� �� �������������� ����� � ������� ��������� ������� �� ���������� ���������� �������. �����, ��� �������, ����������� �������, ������� � ������� � � �������� ��������, ���������� �� ������� � � ������������������ ���������. ���������, ����������, �������������, �������������� ������ �������� � �������� ������� � ������ ������ �������, ���� ������� ����� �����������: ��������������� � ��������������������. �������������������� (���������) �������, �������� �������� ��� ������� ������-������������� ��������, � ��� ����� ��������, ��� �������� �����, ���������� ��� ��������� ����. ����� ������� �������� ����������� � �������������� ������ ������� � ����������, ����������, ���������� �������, �������, �������������.'),
  (5, '������ � ��� �������������� ����������� �������� � ����� ���������. ������� �������� ���� � ��������, ������� ����������� �����. ������ ����������� � ������� �������� � �� 30 ��� � ������. �� ������� ���� �������� �������, �� ����������� ��������� �����������.\n��� ������ ������� ��\n��� ��������� �������� � ��������� �� ��������� ����� ������������ ��������� ��������������: ����, �����, �������, ��������� ��� ����� ���� � ������������ ����� ��������� �������� �� ������� � ��������� ����.\n���������� �������. ���������� �������� (���������, �������) ��������� ����, ������ ������� ����� ������� � �������� ����� ��������� ���������. ���������� � ��� �������� ������� �� ����, ����� ������� ���������, � �� ������� �����������. ������� �������������������� � ������ ������������ ���������� � ���� ����������.\n������������ ��������� ���������� �������� ��������������, �������� ������. ���������� �������� ����� ���� �� ������� ������ �� ��������. ���� �� ��������� �� ��������� ����, ���������� ��������. �������� ��� ����� �������� ���� � ������� � �������� ����. ��������� ����������� �������� � ���������, ������� ��������� ������ � �������.\n��� ����� ������� ��� ����\n���� ������ ��������� ������ ������� ��� ��������� ��� � ����������� ��� ����� ������� ������������ � ������� �������, �� ����� ����� �������� ������������� ��������� �� �������. �������������� ��������� ��� ������ ������� ��������, ����������� �� ������������� ����. � �������� ������������ ��� ���� ����������: ��������, ��������� ����, � ������������ ��������������������� ���������. ��� ��������� ��������� ���������� � ��������� �������� � ��������� ����. ����������� �������� ������ ����� ��� ���� �������������� ����������, ������� �� ����������.'),
  (6, '��� 1. ���������� �������\n��� ��������� ������ ��������� ����� ������� �� ��������� ������� ��������� ����. ��� ����� ��������� �������. �������� �������� ��� ��, ��� ��� �������� ������ ������.\n����������� ������ ������� ������������ ����� (�����������) ��� ������� ���� (�� 1,5�2 ����� ���� ��������� ����������� 1 �������� ����� ����).\n������� ������� ��������.\n�������� ����� (����� �������� �������� �� ������ �����).\n��������� ��������� ��������� ���, ���� ������� ����� �� ������ �������.\n��� 2. ���� ���������\n�������� � ��� ���������, ���������� �������� ������� �� ���������. ����� ��������� �� ��� �������� �������������� �����.\n�������������� ����� ��������� ���������� � ���������-�������� ����� ��������, ����� ������ ��������, ���������� � ������ ������� �������, � ����� ������������ �� ��������� �� ���������.\n��������� ��� ����������: ���� �������� �� ������ 10 �� ����� ����.\n����� �������, ���� �� ������ 70 ��, �� ��� ����������� ������� ���� ��������. � ������ ������� ��������� ������� ���������.\n��� ���������� ����� ����� ��������� � ���� ������ ������. ��� ����� ���������� �������� � �������� �� 100 �� ��������� ���� ��������� �����������. �� ���� ��� ����� �������� ���������, ���� ���������� ������� � �����������.\n����� ������ �������� ����� ������������ ����� �����. ���������, ��� ��� �������������, ����������������� �������. �� �� ������ ������� �������, �� � ��������� ����������� ��������. ��� ���� ��������� ����������� �����: ��� ��������� 2�4 ��������, � ����������� �� ������� ����������.\n������ ���� ����� ��������� ������ �������� (�� ����������). ��������, �������, ��������������, ������������� � ������.\n��� 3. �������� �����\n����� � ������ ������ ������������ �������� � ����� ���������� ������ �������� � ������������ ������ ������.\n����� �� ����� 2�3 ������ ��������� ���� � �����.\n���� ������������� �����������: �� ���� ���� 1 ������ ����� ���������� ����. ������� ������� ����� ���������� �� ������� ��������� ����.\n����� ����� ��������� ����������� ���������������� ��������: ����������, ������� � ������. ��� ������� � ��������, ���������� ����������� ���� � ������� � ��������������� �������������.\n������ ���������\n��� �������� ����� ������ ���������� ��� ����������������, ���� ��������� ����� ������:\n����� ����������� �������� �����, ����� ��������� ���������, ����������������� ���������� ��������� (������ �����, �������, ������ � ������).\n���� ��������� ����������� ���� 37,5 ��������, � ���������� ����� ��������������� (�����������, ��������� � ������).\n�� ������������� ���� ��������������: ��� ����� ��������� ����������� � ������ ����������.\n���������������� ��������� (� �������� ��� �����������) ����������� � ������ ������� ��������������� � ����������� ������������� ������.\n��� 4. ����� � �����\n��� ������� �������� ������� ������� ������� ��������. ������� �������������� ����������� ������ � ������ ����� ������������ �� ��� (���� ������� ������� � �������� ��������� ����).\n�� ������ ��� ������ ���� ����� ��������� ���� ������, ������ (��� ����, �����, ������ � �����-���� ������ �������), � ����� ������ ������������ ���� ��� ������������ ����, �������������� �� ����.\n�� ���� ��������� ������� �������� ��������� � ��������� ������ ��������� ��� ����� ��������� �����. ������������ �������� �������� � �����, ��� �������, � ������� ��� �����. �� ��� ��������� ���� ����� ����������� ���� � ������, ��������, ���������.\n���� �������� �������� (������, �����, �����������) �� ����������� � �� �������� ����� ����� ����� � ������� ������ �������, ���������� � �����.'),
  (7, '��� ��������� ��������?\n�������� �� ��, ��� ����� ��������, ��� ����� ��������� ���� 4-6 ��� � �����, ������ �� ��� ��� ������ ���� ���������� ���� ���������. �� � ���� ������ �� ������������� ���� � ������� ������ ����! ��� �������� - �����, �� �� ����� ������ ������, ���� �� ������ ����� ������, ����� �������, ���������� ���������, � ������ � ���� ���������.\n�������� ��������.\n������ ������� � ��������� ����� ���������, ��� ��� ������������� �������� ����� ������������ ������ �� ��������. ���������� ����������� ������ ���� ���� ���-�� �� ������������� ��������� - ������, �������, ������, ������. ������, ������, ������������ ����� � �� ����� ������ ���� ��� ��������. ���������� ����.\n������������ ����� ��������.\n��� ��������, � ���� ������� ������ ������ �� ������ 2 ������ ����. ������ �����, ���������� �� ������� �� ��� �������� ������ ����, ��� ������� ����� �������. ������������ ���� � ��� �������� ������, ������� ����. ������������ ��������� �� ������ ������� ���������, ������������� ����, ���� ��� �������� ���������.\n������� � ������������� � �������������� ����.\n�����, �� ����� ���������, ��� ��� ����� ������. ���� �� ������ ������ ���������� �� ���� ����������, �� ���� �� ������������ ����� ��������� ��.\n����������� ������� ���������������.\n'),
  (8, '������� �������� � ��� ����� ������������� ������� �� ���������� ���������� ���� ��� ������� �����������.\n� ������� ������� �������� ��������� ����������� ������, �������� ��� �� �����. ������� ���������� �� ���������� ���������, � ������������ ���������� �����������. ����� �� �������� ������� � ���������� ����������� ����������������� �������.\n��� ������ ����� ����������� ����������� ���������, ���������� ����������� �������� � ��������� ��� �������.\n��� ������� � ������ �������, �������� ����������� ��������������� ��������� � �������, ���������, ������, ���������.\n����� ��������� �� ����� ���������� ������ � ���� �������� ��������, ������� ��������� � ����������� ���� ����� ��������� �����. ���� ��������� �������� �������, ������ ��� ����������� ��������������. � �������, ������ �����, ���������� �� �������������� ����������� ��������� ����������.\n������ �����, ����� ���� ���������� �� ���������, ���������� ���� ������ �� ������� ������������� ������.\n��������������������� ������������� � ���� �� ����������� ������� �������. �������� ��� �� �����������. ���������� ���� � ��� ������, ����� �������� �������� ���������, � ��������� ��� �� ������� ����������. ����������� � �����, ������� ��������� �� ������� �������������, �� ����� ������������� ������� �� ������.\n��� ����� ������� ������� ������� �������� ��������� � ����� ����������. �����������, �������, ����� ���� ����������, �� �������� �� ���������.'),
  (9, '������ � ��� ��������� �������������-�������������� ������� � ���������� ���������� ����� � ���������� � ���� ������� ������ (��������). ���� � ����������� ����������� ��������, ��������� �� ���������� ��������� ����������� ������� �������� (��� ����� ����).\n������� ����������� ���������� �������� � ���������� �������, ����� ��� ��������. ���, ���� � ������� ������ ������ ��� � ���������� ��� �������, ���� ������� � ���������� ���������� �� ����� � ����� �������� �� ����������� �������������� ������ ��� ����� ������������, ������. ������, ����� ������ ��������� �������� ��� �� �������������� ������������. ����������� ����� ����������, ���������� �������������� � �������� ��������, � ����� ����������������� � ���������� �������� ����������� (����������������).\n��� ������� ����� ������� ������� �������� ������������, ������ � ���������� ������� � ��� ��� ���� ������������ �������� ���������� (����������� �����������) � ��������� (���������� ��������� ����). ������ ���� ������� ����� ������, � ������ �������������� ������� �� � ����� �������� �������� �� ��������� � ������� ������ ��������, ������ ������������ ��������� ������������ �� �������������.'),
  (10, '������ - ��� �������������� ����������� ��������. ��� ������� ������� ���������� ���� ��� �������� ���������, ��������� � �����������, � ����� ��� ������, ���� ��������� ������� ���. ������ ����, ����������� ��� ������� ��������, �������� ��������, ����������� ��������� ��������� ����������� ��� ����� ���������.\n������ �����, � ������ ������� ���������� ���������� ����� ������� ����������. ��� ������������ ��������� ������� �������� �������� ������� ��������� ���������� ����� � �� ��������� ���������� ������. ��� ������������ �������� �� ������������ ����������� ����������� �����������, ������������ ��������������������� �������� � �������. ������ �������� �������� �������� ��������������� � ��������� ������� � ��� ������ ������� ���������� � �������� �������� ������������ ����������.\n������������ ������� ����� ����������, ������������� �� ������������ �������� �������, � ����� ������ (�� ���� ����, ����, ���������, ����������).\n��� ����������� �������� � ������� �������� ��������� �������� ���, ������������ �� ����������� �������� � ��������� ��������� � �������������� �������� ����������. ������� ������, ����������, ���������� �������, �������� ��������� � ���������-��������� �������.'),
  (11, '���������, ��� ������� ���������� ��������� ����� ������� ������� � ��������� ��������. �������� ���������� ���������������� �����.\n������� �������� ��������, ��� �������� �������� ����������� �������� ���� ����� ����� � ��������� ��������� ���������, ������ ��� ������� ��������� �� ����� ����������� ��������, � ���������, ����������. ������ ������������ ������� ������� ��������� ����� ������� ��� ��������, ������ ����������� �������� � �������� � �������������� �� ������� ����������.\n�������� ������� ������� ������� � �������������� ������� ������� ������� � ���������. ��� ���������������� ������� ������� ���������� � �����-�����������. ��� ����������� ����� ���������� �� ���������� ������ ������� ������� � �� � ��������� ��������� �� ���������. ������ ����������������� ���������� ����� ��������� ����� ���������, ������� ��� ��������� ������������� ������������ �� �������� ���������� ���� ��������.\n���� ����� ����� ��������� �� 1-2 ������ ������������ ��������������������� ��������, ����� ��� ��������, ����������, ��������, �����������, ���������. ��� �������� �������� ������������ ������� ������� � ��������� ����� ���� �������� �����������, �������� �������, ����������, �������������, �������. ��� ����������� ������ ��������� ������� ����� ����������� ��������� ��������.');