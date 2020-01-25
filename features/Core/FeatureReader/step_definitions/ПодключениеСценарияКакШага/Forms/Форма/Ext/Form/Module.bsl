﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебная часть
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВызвалОбычныйШагСценария()","ЯВызвалОбычныйШагСценария","Когда я вызвал обычный шаг сценария");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВКонтекстеЕстьЗначение(Парам01)","ВКонтекстеЕстьЗначение","Тогда в Контексте есть значение ""БылВызванСценарийИзСоседнейФичи""");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	//чтобы сценарий падал на этапе разработки
	Ванесса.ПроверитьРавенство(Контекст.Свойство("БылВызванСценарийИзСоседнейФичи"),Истина,"Ожидали, что в Контекст есть свойство БылВызванСценарийИзСоседнейФичи");
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Когда я вызвал обычный шаг сценария
//@ЯВызвалОбычныйШагСценария()
Процедура ЯВызвалОбычныйШагСценария() Экспорт
	//ВызватьИсключение "Не реализовано.";
КонецПроцедуры


&НаКлиенте
//Тогда в Контексте есть значение "БылВызванСценарийИзСоседнейФичи"
//@ВКонтекстеЕстьЗначение(Парам01)
Процедура ВКонтекстеЕстьЗначение(ИмяПараметра) Экспорт
	Ванесса.ПроверитьРавенство(Контекст.Свойство(ИмяПараметра),Истина,"Ожидали, что в Контекст есть свойство " + ИмяПараметра);
КонецПроцедуры

//окончание текста модуля