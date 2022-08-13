﻿# language: ru

@lessons

Функционал: Интерактивная справка. Отчет в формате Allure. Приложения к отчету.

Сценарий: Отчет в формате Allure. Приложения к отчету.

	* Привет! В этом уроке я расскажу тебе про настройки прикрепления к отчету Allure дополнительной информации. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения
		
	* Эти настройки находятся тут.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаНастройки' UI Automation
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'СтраницаОтчетыОЗапуске' UI Automation
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаAllure' UI Automation
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаПриложенияКОтчетуAllure' UI Automation
		И Пауза 1
		И я делаю подсветку нескольких элементов VA с их заголовком "Приложения к отчету" UI Automation
			| 'Имя'                                                                 |
			| 'ПрикладыватьКОтчетуAllureЖурналРегистрацииВыполненияСценария'        |
			| 'ПрикладыватьКОтчетуAllureДанныеОСостоянииАктивнойФормы'              |
			| 'ПрикладыватьКОтчетуAllureДанныеОСостоянииВсехФорм'                   |
			| 'ПрикладыватьКОтчетуAllureДанныеОСетевыхСоединениях'                  |
			| 'ПрикладыватьКОтчетуAllureДанныеОПроцессахОС'                         |
			| 'ПрикладыватьКОтчетуAllureДанныеОЗначенияхПеременных'                 |
			| 'ПрикладыватьФайлыMxlКОтчетуAllure'                                   |
			| 'ПрикладыватьФайлыMxlСохраненныеВФорматеHTMLКОтчетуAllure'            |
			| 'ПрикладыватьДополнительныеДанныеПриСравненииЗначенияСЭталономAllure' |
			| 'ПрикладыватьФайлыXlsКОтчетуAllure'                                   |

	* Этот флаг определяет будет ли к отчету приложен файл с данными журнала регистрации.
		И я делаю подсветку нескольких элементов VA с их заголовком "Данные журнала регистрации" UI Automation
			| 'Имя'                                                          |
			| 'ПрикладыватьКОтчетуAllureЖурналРегистрацииВыполненияСценария' |
	
	* Важный момент. Данные журнала регистрации снимаются на стороне менеджера тестирования.

	* Продолжим. Данный флаг определяет будет ли к отчету приложена информация о сетевых соединениях процессов, запущенных на ПК.
		И я делаю подсветку нескольких элементов VA с их заголовком "Данные о сетевых соединениях" UI Automation
			| 'Имя'                                                |
			| 'ПрикладыватьКОтчетуAllureДанныеОСетевыхСоединениях' |

	* Этот флаг определяет будет ли к отчету приложена информация о состоянии активной формы клиента тестирования на момент падения сценария.
		И я делаю подсветку нескольких элементов VA с их заголовком "Состояние активной формы" UI Automation
			| 'Имя'                                                    |
			| 'ПрикладыватьКОтчетуAllureДанныеОСостоянииАктивнойФормы' |

	* Данный флаг определяет будет ли к отчету приложена информация о состоянии всех форм клиента тестирования на момент падения сценария.
		И я делаю подсветку нескольких элементов VA с их заголовком "Состояние всех форм" UI Automation
			| 'Имя'                                               |
			| 'ПрикладыватьКОтчетуAllureДанныеОСостоянииВсехФорм' |

	* Этот флаг определяет будет ли к отчету приложена информация о запущенных процессах на момент падения сценария.
		И я делаю подсветку нескольких элементов VA с их заголовком "Данные о процессах" UI Automation
			| 'Имя'                                         |
			| 'ПрикладыватьКОтчетуAllureДанныеОПроцессахОС' |

	* Данный флаг определяет будет ли к отчету приложена информация о значениях переменных сценариев на момент возникновения ошибки.
		И я делаю подсветку нескольких элементов VA с их заголовком "Значения переменных" UI Automation
			| 'Имя'                                                 |
			| 'ПрикладыватьКОтчетуAllureДанныеОЗначенияхПеременных' |

	* Этот флаг определяет будут ли к отчету прикладываться файлы в формате mxl.
		И я делаю подсветку нескольких элементов VA с их заголовком "Файлы в формате mxl" UI Automation
			| 'Имя'                               |
			| 'ПрикладыватьФайлыMxlКОтчетуAllure' |

	* Данный флаг определяет будут ли к отчету прикладываться файлы в формате html.
		И я делаю подсветку нескольких элементов VA с их заголовком "Файлы в формате HTML" UI Automation
			| 'Имя'                                                      |
			| 'ПрикладыватьФайлыMxlСохраненныеВФорматеHTMLКОтчетуAllure' |

	* Этот флаг определяет будут ли к отчету прикладываться файлы в формате эксель.
		И я делаю подсветку нескольких элементов VA с их заголовком "Файлы в формате xlsx" UI Automation
			| 'Имя'                                                                 |
			| 'ПрикладыватьФайлыXlsКОтчетуAllure' |

	* Данный флаг определяет будут ли к отчету приложены дополнительные файлы, которые помогают найти отличия эталона макета и реального значения макета.
		И я делаю подсветку нескольких элементов VA с их заголовком "Дополнительная информация о сравнении макетов" UI Automation
			| 'Имя'                                                                 |
			| 'ПрикладыватьДополнительныеДанныеПриСравненииЗначенияСЭталономAllure' |

	* На этом всё, переходи к следующему уроку интерактивной справки.
