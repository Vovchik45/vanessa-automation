﻿# language: ru

@lessons

Функционал: Интерактивная справка. Контекстное меню редактора. Получить макет по таблице Gherkin.

Сценарий: Контекстное меню редактора. Получить макет по таблице Gherkin.

	* Привет! В этом уроке я расскажу тебе про контекстное меню редактора и как получить макет по таблице Gherkin. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения

	* Загр^узим тестовый пример.
		И я устанавливаю опцию VA в режиме обучения "ПроверкаСинтаксисаВРедакторе" "Истина"
		И я загружаю фичи в VA в режиме обучения "$КаталогИнструментов$\training\features\Примеры\ПримерКонтекстноеМенюРедактораТаблицыGherkin.feature"

	* Данный пункт меню позволяет по таблице Gherkin получить табличный документ.
		И я делаю клик по элементу формы 'ЭтотСеанс' '' 'Document' правой кнопкой UI Automation
		И Пауза 1
		И Я делаю подсветку элемента VA "VanessaEditorКонтекстноеМенюПолучитьМакетПоТаблице" "Получить макет по таблице" и перемещаю курсор

	* При выполнении команды будет открыто окно макета.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'VanessaEditorКонтекстноеМенюПолучитьМакетПоТаблице' UI Automation	
		И Пауза 1

	* Данная опция может быть полезна когда, например, клиент тестирования не позволяет штатно вывести таблицу в табличный документ.
	* Тогда сначала можно получить по этой таблице клиента тестирования таблицу Gherkin, а её уже преобразовать в макет.	

	* На этом всё, переходи к следующему уроку интерактивной справки.



