﻿@IgnoreOnCIMainBuild


Функционал: ДляПроверкиОстановкиВсехСценариев01

Сценарий: ДляПроверкиОстановкиВсехСценариев01
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Основная" "Справочник3"
	Тогда открылось окно "Справочник3"
	И я нажимаю на кнопку "Создать"
	Тогда открылось окно "Справочник3 (создание)"
	И я нажимаю на кнопку с именем 'ФормаЭмуляцияОкнаПроверкаПравомерности'
	И у элемента с именем 'СделатьМакетНедоступным' я жду значения 'Нет' в течение 2 секунд
	И Пауза 0.1
