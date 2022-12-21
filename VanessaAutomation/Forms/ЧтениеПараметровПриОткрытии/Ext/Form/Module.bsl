﻿&НаКлиенте
Перем Ванесса;

&НаКлиенте
Перем ЭтоLinux;

#Область ОбработкаСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	МетаданныеПолноеИмя = ОбъектСервер.Метаданные().ПолноеИмя();
	Заголовок = ОбъектСервер.ПолучитьВерсиюОбработки(Ложь);
	ИспользуемоеИмяФайла = ОбъектСервер.ИспользуемоеИмяФайла;
	ВерсияРедактора = ОбъектСервер.ВерсияРедактора();
	Если Параметры.Свойство("РежимСамотестирования") Тогда
		РежимСамотестирования = Параметры.РежимСамотестирования;
	КонецЕсли;	
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ВыполнитьПриСозданииНаСервере", Ложь);
	ИмяФормыОбщегоНазначенияVA = ИмяФормыОбщегоНазначенияVA();
	ОбщегоНазначенияVA = ПолучитьФорму(ИмяФормыОбщегоНазначенияVA, ПараметрыФормы);
	
	ShowMainForm = ОбщегоНазначенияVA.ЗначениеПараметраЗапуска("ShowMainForm");
	Если ShowMainForm = Неопределено Тогда
		ShowMainForm = Ложь;
	КонецЕсли;	 
	
	SPPR = ОбщегоНазначенияVA.ЗначениеПараметраЗапуска("SPPR");
	Если SPPR = Неопределено Тогда
		SPPR = Ложь;
	КонецЕсли;	 
	
	StartFeaturePlayer = ОбщегоНазначенияVA.ЗначениеПараметраЗапуска("StartFeaturePlayer");
	Если StartFeaturePlayer = Неопределено Тогда
		StartFeaturePlayer = Ложь;
	КонецЕсли;	
	
	UseEditor = ОбщегоНазначенияVA.ЗначениеПараметраЗапуска("UseEditor", Истина);
	Если UseEditor = Неопределено Тогда
		UseEditor = Ложь;
	КонецЕсли;	       
	
	КешПараметровЗапуска = ОбщегоНазначенияVA.КешПараметровЗапуска();
	
	Если UseEditor Тогда
		ФайлVA = Новый Файл(ИспользуемоеИмяФайла);
		VanessaEditorКаталог = ДополнитьСлешВПуть(ДополнитьСлешВПуть(ФайлVA.Путь) + "VAEditorCacheFiles") + ВерсияРедактора;
		ФайлVanessaEditorКаталог = Новый Файл(VanessaEditorКаталог);
		Попытка
			СуществуетКешРедактора = ФайлVanessaEditorКаталог.Существует();
		Исключение
			СуществуетКешРедактора = Ложь;
		КонецПопытки;
	Иначе	
		СуществуетКешРедактора = Ложь;
	КонецЕсли;	
	
	ПоказатьОсновнуюФорму = Ложь;
	Если НЕ StartFeaturePlayer Тогда
		ПоказатьОсновнуюФорму = Истина;
	ИначеЕсли StartFeaturePlayer И (SPPR ИЛИ ShowMainForm) Тогда
		ПоказатьОсновнуюФорму = Истина;
	ИначеЕсли StartFeaturePlayer Тогда
		ПоказатьОсновнуюФорму = Ложь;
	КонецЕсли;
	
	Если НЕ ПоказатьОсновнуюФорму Тогда
		UseEditor = Ложь;
	КонецЕсли;	
	
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("ИнициализироватьVanessaEditor", UseEditor);
	ПараметрыФормы.Вставить("СуществуетКешРедактора", СуществуетКешРедактора);
	ПараметрыФормы.Вставить("РежимСамотестирования", РежимСамотестирования);
	ПараметрыФормы.Вставить("ЭтоLinuxКлиент", ЭтоLinux());
	ПараметрыФормы.Вставить("КешПараметровЗапуска", КешПараметровЗапуска);
	
	ОбщегоНазначенияVA = Неопределено;
	ИмяФормыVA = ИмяФормыVA();
	Если ПоказатьОсновнуюФорму Тогда
		//Просто открываем основную форму.
		Отказ = Истина;
		ОткрытьФорму(ИмяФормыVA, ПараметрыФормы);
	Иначе
		//Оставляем служебную форму открытой и запускаем сценарии в основной форме.
		Ванесса = ПолучитьФорму(ИмяФормыVA, ПараметрыФормы);
		Ванесса.ВыполнитьСценарииСЧтениемПараметровИзКоманднойСтроки();
	КонецЕсли;	 
	
КонецПроцедуры

&НаКлиенте
Процедура ПриЗакрытии(ЗавершениеРаботы)
	Ванесса = Неопределено;
КонецПроцедуры

#КонецОбласти

#Область КомандыФормы

&НаКлиенте
Процедура ОткрытьОсновнуюФорму(Команда)
	Ванесса.Открыть();
	Закрыть();
	Ванесса = Неопределено;
КонецПроцедуры

&НаКлиенте
Процедура ОстановитьВыполнениеСценариев(Команда)
	Ванесса.КомандаОстановитьСценарии();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Функция ИмяФормыVA()
	
	Если Лев(МетаданныеПолноеИмя, 9) = "Обработка" ИЛИ Лев(МетаданныеПолноеИмя, 13) = "DataProcessor" Тогда
		ПерваяЧасть = "Обработка";
	Иначе	
		ПерваяЧасть = "ВнешняяОбработка";
	КонецЕсли;	 
	
	МассивСтрок = РазложитьСтрокуВМассивПодстрок(МетаданныеПолноеИмя, ".");
	ВтораяЧасть = МассивСтрок[1];
	
	Возврат ПерваяЧасть + "." + ВтораяЧасть + ".Форма.УправляемаяФорма"; 
	
КонецФункции	 

&НаКлиенте
Функция ИмяФормыОбщегоНазначенияVA()
	
	Если Лев(МетаданныеПолноеИмя, 9) = "Обработка" ИЛИ Лев(МетаданныеПолноеИмя, 13) = "DataProcessor" Тогда
		ПерваяЧасть = "Обработка";
	Иначе	
		ПерваяЧасть = "ВнешняяОбработка";
	КонецЕсли;	 
	
	МассивСтрок = РазложитьСтрокуВМассивПодстрок(МетаданныеПолноеИмя, ".");
	ВтораяЧасть = МассивСтрок[1];
	
	Возврат ПерваяЧасть + "." + ВтораяЧасть + ".Форма.ОбщегоНазначенияVA"; 
	
КонецФункции	 

// Обертка для функции РазложитьСтрокуВМассивПодстрок()
// Нужна, т.к. не работает вызов Ванесса.РазложитьСтрокуВМассивПодстрок() из других обработок.
&НаКлиенте
Функция РазложитьСтрокуВМассивПодстрок(Знач Строка, Знач Разделитель = ",", Знач ПропускатьПустыеСтроки = Неопределено, 
		ЕстьПоддержкаФункцияРазложитьСтрокуВМассивПодстрок = Ложь)
	
	Результат = Новый Массив;
	
	// для обеспечения обратной совместимости
	Если ПропускатьПустыеСтроки = Неопределено Тогда
		ПропускатьПустыеСтроки = ?(Разделитель = " ", Истина, Ложь);
		Если ПустаяСтрока(Строка) Тогда 
			Если Разделитель = " " Тогда
				Результат.Добавить("");
			КонецЕсли;
			Возврат Результат;
		КонецЕсли;
	КонецЕсли;

	Если ЕстьПоддержкаФункцияРазложитьСтрокуВМассивПодстрок И СтрДлина(Разделитель) = 1 Тогда
		Если ПропускатьПустыеСтроки = Истина Тогда
			Возврат Вычислить("СтрРазделить(Строка,Разделитель,Ложь)");
		Иначе
			Возврат Вычислить("СтрРазделить(Строка,Разделитель,Истина)");
		КонецЕсли;	 
	КонецЕсли;	 
	
	Позиция = Найти(Строка, Разделитель);
	Пока Позиция > 0 Цикл
		Подстрока = Лев(Строка, Позиция - 1);
		Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Подстрока) Тогда
			Результат.Добавить(Подстрока);
		КонецЕсли;
		Строка = Сред(Строка, Позиция + СтрДлина(Разделитель));
		Позиция = Найти(Строка, Разделитель);
	КонецЦикла;
	
	Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Строка) Тогда
		Результат.Добавить(Строка);
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции 

&НаКлиенте
Функция ДополнитьСлешВПуть(Знач Каталог)
	разделитель = "\";
	
	Если ПустаяСтрока(Каталог) Тогда
		Возврат Каталог;
	КонецЕсли;
	Если ЭтоLinux() Тогда
		разделитель = "/";
		Каталог = СтрЗаменить(Каталог, "\", "/");
	КонецЕсли;
		
	Если Прав(Каталог, 1) <> разделитель Тогда
		Каталог = Каталог + разделитель;
	КонецЕсли;
	Возврат Каталог;
КонецФункции

&НаКлиенте
Функция ЭтоLinux() 
	
	Если ЭтоLinux <> Неопределено Тогда
		Возврат ЭтоLinux;
	КонецЕсли;	
	
	Значение = Ложь;
	СисИнфо = Новый СистемнаяИнформация;
	Если СисИнфо.ТипПлатформы = ТипПлатформы.Linux_x86 
		ИЛИ СисИнфо.ТипПлатформы = ТипПлатформы.Linux_x86_64
		ИЛИ СисИнфо.ТипПлатформы = ТипПлатформы.MacOS_x86
		ИЛИ СисИнфо.ТипПлатформы = ТипПлатформы.MacOS_x86_64 Тогда 
		Значение = Истина;
	КонецЕсли;
	
	ЭтоLinux = Значение;
	
	Возврат ЭтоLinux;
	
КонецФункции

#КонецОбласти