﻿
#Область СлужебныйПрограммныйИнтерфейс

// Добавляет (или вычитает) к указанной дате заданное число часов.
//
// Параметры:
//  Дата  - Дата - Исходная дата.
//  Количество  - Число - Количество часов, которое необходимо добавить к исходной дате.
//			Если принимает отрицательное значение, то число вычитается.
//
// Возвращаемое значение:
//   Дата   - Дата, полученная в результате добавления.
//
Функция ДобавитьЧас(Дата, Количество = 1) Экспорт
	
	КоличествоСекундЧасе = КоличествоСекундВЧасе();
	
	Возврат Дата + Количество * КоличествоСекундЧасе;

КонецФункции

// Возвращает количество секунд в одном часе.
//
// Возвращаемое значение:
//   Число   - Количество секунд.
//
Функция КоличествоСекундВЧасе() Экспорт

	Возврат 3600;

КонецФункции

// Возвращает значение свойства структуры.
//
// Параметры:
//   Структура - Структура, ФиксированнаяСтруктура - Объект, из которого необходимо прочитать значение ключа.
//   КлючиСтрокой - Строка - Имена свойств структур через точку.
//   ЗначениеПоУмолчанию - Произвольный - Необязательный. Возвращается когда в структуре нет значения по указанному
//                                        ключу.
//       Для скорости рекомендуется передавать только быстро вычисляемые значения (например примитивные типы),
//       а инициализацию более тяжелых значений выполнять после проверки полученного значения (только если это
//       требуется).
//
// Возвращаемое значение:
//   Произвольный - Значение свойства структуры. ЗначениеПоУмолчанию если в структуре нет указанного свойства.
//
Функция СвойствоСтруктурыРекурсивно(Структура, Знач КлючиСтрокой, ЗначениеПоУмолчанию = Неопределено) Экспорт

	Разделитель = ".";
	
	Ключи = СтрРазделить(КлючиСтрокой, Разделитель);
	
	Если Ключи.Количество() = 0 Тогда
		Возврат ЗначениеПоУмолчанию;
	КонецЕсли; 
	
	Ключ = Ключи[0];
	
	Значение = ОбщегоНазначенияКлиентСервер.СвойствоСтруктуры(Структура, Ключ, ЗначениеПоУмолчанию);
	
	Если Ключи.Количество() > 1 Тогда
		// Последний уровень
		Ключи.Удалить(0);
		КлючиСтрокой = СтрСоединить(Ключи, Разделитель);
		
		Если ТипЗнч(Значение) = Тип("Структура") Тогда
			
			Значение = СвойствоСтруктурыРекурсивно(Значение, КлючиСтрокой, ЗначениеПоУмолчанию);
			
		Иначе	
			
			Значение = ЗначениеПоУмолчанию;
			
		КонецЕсли; 
		
	КонецЕсли; 
	
	Возврат Значение;
	
КонецФункции

#КонецОбласти