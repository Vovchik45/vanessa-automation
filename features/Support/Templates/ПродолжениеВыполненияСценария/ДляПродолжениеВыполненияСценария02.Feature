﻿@IgnoreOnCIMainBuild


Функционал: ДляПроверкиОстановкиВсехСценариев02

Сценарий: ДляПроверкиОстановкиВсехСценариев02
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Основная" "Справочник3"
	Тогда открылось окно "Справочник3"
	И я нажимаю на кнопку "Создать"
	Тогда открылось окно "Справочник3 (создание)"
	И я нажимаю на кнопку с именем 'ФормаЭмуляцияОкнаПроверкаПравомерности'
	И я устанавливаю флаг с именем 'СделатьМакетНедоступным'
	И Пауза 0.1
