﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ПараметрыПодключения = ygpt_Интеграция.ПрочитатьПараметрыПодключения();

	Если НЕ ПараметрыПодключения = Неопределено Тогда
		ЗаполнитьЗначенияСвойств(ЭтотОбъект, ПараметрыПодключения);
	КонецЕсли;

КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура КомандаОк(Команда)
	
	СохранитьПараметрыПодключения();
	
	Закрыть();
	
КонецПроцедуры

&НаКлиенте
Процедура ПроверитьПодключение(Команда)
	
	ПроверитьПодключениеНаСервере();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ПроверитьПодключениеНаСервере()
	
	ПараметрыПодключения = ПараметрыПодключения();
	
	Результат = ygpt_Интеграция.ПроверитьПодключение(ПараметрыПодключения);
	
	Если Результат Тогда
		ТекстСообщения = НСтр("ru = 'Подключение к сервису выполнено успешно!'");
	Иначе
		ТекстСообщения = НСтр("ru = 'Не удалось подключиться к сервису!'");
	КонецЕсли;
	
	ОбщегоНазначенияКлиентСервер.СообщитьПользователю(ТекстСообщения);
	
КонецПроцедуры

&НаСервере
Процедура СохранитьПараметрыПодключения()

	ПараметрыПодключения = ПараметрыПодключения();

	ygpt_Интеграция.СохранитьПараметрыПодключения(ПараметрыПодключения);

КонецПроцедуры

&НаСервере
Функция ПараметрыПодключения()
	
	ПараметрыПодключения = ygpt_Интеграция.ПараметрыПодключения();
	
	ЗаполнитьЗначенияСвойств(ПараметрыПодключения, ЭтотОбъект);
	
	Возврат ПараметрыПодключения;
	
КонецФункции

#КонецОбласти