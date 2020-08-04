﻿///////////////////////////////////////////////////////////////////////////////////////////////////////
// (с) Tolkachev Pavel, 2020
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

#Область ПроцедурыПроверкиРезультата

// Проверяет условие на Истина. Если результат условия Ложь, то вызывается исключение.
//
// Параметры:
//  Условие - Булево - булево выражение, которое проверяется.
//
Процедура ПроверитьУсловиеВыполнено(Условие) Экспорт
	
	Если Не Условие Тогда
		ВызватьИсключение НСтр("ru='Условие должно быть выполнено'");
	КонецЕсли; 
	
КонецПроцедуры 

// Проверяет условие на Ложь. Если результат условия Истина, то вызывается исключение.
//
// Параметры:
//  Условие - Булево - булево выражение, которое проверяется.
//
Процедура ПроверитьУсловиеНеВыполнено(Условие) Экспорт
	
	Если Условие Тогда
		ВызватьИсключение НСтр("ru='Условие должно быть не выполнено'");
	КонецЕсли; 
	
КонецПроцедуры 

// Проверяет заполненность указанного значения. Если значение не заполнено, то вызывается исключение.
//
// Параметры:
//  Значение - Произвольный - проверяемое значение.
//
Процедура ПроверитьЗначениеЗаполнено(Значение) Экспорт
	
	Если Не ЗначениеЗаполнено(Значение) Тогда
		ВызватьИсключение НСтр("ru='Значение должно быть заполнено'");
	КонецЕсли; 
	
КонецПроцедуры 

// Проверяет заполненность указанного значения. Если значение заполнено, то вызывается исключение.
//
// Параметры:
//  Значение - Произвольный - проверяемое значение.
//
Процедура ПроверитьЗначениеНеЗаполнено(Значение) Экспорт
	
	Если ЗначениеЗаполнено(Значение) Тогда
		ВызватьИсключение НСтр("ru='Значение НЕ должно быть заполнено'");
	КонецЕсли; 
	
КонецПроцедуры 

// Проверяет, что переданное значение равно Неопределено. В противном случае вызывается исключение.
//
// Параметры:
//  Значение - Произвольный - проверяемое значение.
//
Процедура ПроверитьЗначениеНеопределено(Значение) Экспорт
	
	Если Не Значение = Неопределено Тогда
		ВызватьИсключение НСтр("ru='Значение должно быть Неопределено'");
	КонецЕсли; 
	
КонецПроцедуры 

// Проверяет доступность элемента формы. Если элемент формы не доступен, то вызывается исключение.
//
// Параметры:
//  Элемент - ЭлементФормы - проверяемый элемент формы.
//
Процедура ПроверитьЭлементФормыДоступен(Элемент) Экспорт
	
	Если Не Элемент.Доступность Тогда
		ВызватьИсключение СтрШаблон(НСтр("ru='Элемент %1 должен быть доступен'"), Элемент.Имя);
	КонецЕсли; 
	
КонецПроцедуры 

// Проверяет доступность элемента формы. Если элемент формы доступен, то вызывается исключение.
//
// Параметры:
//  Элемент - проверяемый элемент формы.
//
Процедура ПроверитьЭлементФормыНеДоступен(Элемент) Экспорт
	
	Если Элемент.Доступность Тогда
		ВызватьИсключение СтрШаблон(НСтр("ru='Элемент %1 должен быть недоступен'"), Элемент.Имя);
	КонецЕсли; 
	
КонецПроцедуры 

// Проверяет равенство двух значений: ожидаемого и полученного. Если значения различаются, то вызывается исключение.
//
// Параметры:
//  ОжидаемоеЗначение - Произвольный - значение, которое ожидается получить.
//  ПолученноеЗначение - Произвольный - фактически полученное значение.
//
Процедура ПроверитьЗначенияРавны(ОжидаемоеЗначение, ПолученноеЗначение) Экспорт
	
	Если ОжидаемоеЗначение <> ПолученноеЗначение Тогда
		ВызватьИсключение СтрШаблон(НСтр("ru='Значения различаются. Ожидается - %1; получено - %2'"),
							Строка(ОжидаемоеЗначение), Строка(ПолученноеЗначение));
	КонецЕсли;
	
КонецПроцедуры 

// Проверяет равенство двух значений: ожидаемого и полученного. Если значения совпадают, то вызывается исключение.
//
// Параметры:
//  ОжидаемоеЗначение - Произвольный - значение, которое ожидается получить.
//  ПолученноеЗначение - Произвольный - фактически полученное значение.
//
Процедура ПроверитьЗначенияНеРавны(ОжидаемоеЗначение, ПолученноеЗначение) Экспорт
	
	Если ОжидаемоеЗначение = ПолученноеЗначение Тогда
		ВызватьИсключение СтрШаблон(НСтр("ru='Значия должны различаться, но имеют одинаковое значение: %1'"),
							Строка(ОжидаемоеЗначение));
	КонецЕсли;
	
КонецПроцедуры 

// Выполняет проверку на наличие элементов в массиве. Если элементы отсутствуют, то вызывается исключение.
//
// Параметры:
//  Массив - Массив - проверяемый массив.
//
Процедура ПроверитьМассивПустой(Массив) Экспорт
	
	Если Массив.Количество() > 0 Тогда
		ВызватьИсключение НСтр("ru='Массив должен быть пустым'");
	КонецЕсли; 
	
КонецПроцедуры 

// Выполняет проверку на отсутствие элементов в массиве. Если в массиве присутствуют элементы, то вызывается исключение.
//
// Параметры:
//  Массив - Массив - проверяемый массив.
//
Процедура ПроверитьМассивНеПустой(Массив) Экспорт
	
	Если Массив.Количество() = 0 Тогда
		ВызватьИсключение НСтр("ru='Массив НЕ должен быть пустым'");
	КонецЕсли; 
	
КонецПроцедуры 

// Выполняет проверку кода состояния выполнения HTTP метода. Если код входит в интервал 200..399, то вызов считается
// успешным. В противном случае вызывается исключение.
//
// Параметры:
//  HttpОтвет - HTTPОтвет - ответ сервера, код состояния которого необходимо проверить.
//
Процедура ПроверитьВызовHttpМетодаВыполненУспешно(HttpОтвет) Экспорт
	
	Если HttpОтвет.КодСостояния < 200 Или HttpОтвет.КодСостояния >= 400 Тогда
		ТекстСообщения = НСтр("ru='Вызов HTTP метода завершен НЕ успешно. Код ответа:'") +
			" " + HttpОтвет.КодСостояния;
		
		Если ЗначениеЗаполнено(HttpОтвет.Тело) Тогда
			ТекстСообщения = ТекстСообщения + ", " + HttpОтвет.Тело;
		КонецЕсли; 
		
		ВызватьИсключение ТекстСообщения;
	КонецЕсли; 
	
КонецПроцедуры 

// Выполняет проверку кода состояния выполнения HTTP метода. Если код НЕ входит в интервал 200..399, то вызов считается
// НЕуспешным. В случае успешного вызова вызывается исключение.
//
// Параметры:
//  HttpОтвет - HTTPОтвет - ответ сервера, код состояния которого необходимо проверить.
//
Процедура ПроверитьВызовHttpМетодаВыполненНеУспешно(HttpОтвет) Экспорт
	
	Если HttpОтвет.КодСостояния >= 200 И HttpОтвет.КодСостояния < 400 Тогда
		ТекстСообщения = НСтр("ru='Вызов HTTP метода НЕ должен быть завершен успешно. Код ответа:'") +
			" " + HttpОтвет.КодСостояния;
		
		Если ЗначениеЗаполнено(HttpОтвет.Тело) Тогда
			ТекстСообщения = ТекстСообщения + ", " + HttpОтвет.Тело;
		КонецЕсли; 
		
		ВызватьИсключение ТекстСообщения;
	КонецЕсли; 
	
КонецПроцедуры 

#КонецОбласти 

// Выполняет чтение из файла в формате JSON и возвращает прочитанное значение.
//
// Параметры:
//  ИмяФайла - Строка - имя файла, из которого необходимо прочитать данные.
//  СвойстваСоЗначениемДата - Массив, Строка, ФиксированныйМассив - массив, элементы которого содержат имена свойств
//                            JSON, для которых нужно вызывать восстановление даты из строки.
// 
// Возвращаемое значение:
//  Произвольный - прочитанные данные из JSON файла.
//
Функция ПрочитатьДанныеИзФайлаJSON(ИмяФайла, СвойстваСоЗначениемДата = Неопределено) Экспорт
	
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.ОткрытьФайл(ИмяФайла);
	
	Результат = ПрочитатьJSON(ЧтениеJSON, , СвойстваСоЗначениемДата);
	
	ЧтениеJSON.Закрыть();
	
	Возврат Результат;
	
КонецФункции 

// Записывает данные в файл формата JSON.
//
// Параметры:
//  ИмяФайла - Строка - имя файла, в которые необходимо записать данные.
//  Данные - Произвольный - сохраняемые данные.
//
Процедура ЗаписатьДанныеВФайлJSON(ИмяФайла, Данные) Экспорт
	
	ЗаписьJSON = Новый ЗаписьJSON;
	ЗаписьJSON.ОткрытьФайл(ИмяФайла);
	
	НастройкиСериализации = Новый НастройкиСериализацииJSON;
	НастройкиСериализации.ВариантЗаписиДаты = ВариантЗаписиДатыJSON.ЛокальнаяДатаСоСмещением;
	
	ЗаписатьJSON(ЗаписьJSON, Данные, НастройкиСериализации);
	
	ЗаписьJSON.Закрыть();
	
КонецПроцедуры 

// Преобразует значение в строку формта JSON.
//
// Параметры:
//  Значение - Произвольный - объект для преобразования в JSON. Допустимые типы см. в описании функции ЗаписатьJSON
//                            синтаксис-помощника.
// 
// Возвращаемое значение:
//  Строка
//
Функция ЗначениеВСтрокуJson(Значение) Экспорт
	
	ЗаписьJSON = Новый ЗаписьJSON;
	ЗаписьJSON.УстановитьСтроку();
	
	НастройкиСериализации = Новый НастройкиСериализацииJSON;
	НастройкиСериализации.ВариантЗаписиДаты = ВариантЗаписиДатыJSON.ЛокальнаяДатаСоСмещением;
	
	ЗаписатьJSON(ЗаписьJSON, Значение, НастройкиСериализации);
	
	Возврат ЗаписьJSON.Закрыть();
	
КонецФункции 

// Преобразует строку формата JSON в значение.
//
// Параметры:
//  СтрокаJson - Строка - строка в формате JSON, содержащее значение.
//  ПрочитатьВСоответствие - Булево - если установлено Истина, чтение объекта JSON будет выполнено в Соответствие.
//                                    Если установлено Ложь, объекты будут считываться в объект типа Структура. 
// 
// Возвращаемое значение:
//  Произвольный - значение, считанное из строки формата JSON.
//
Функция СтрокаJsonВЗначение(СтрокаJson, ПрочитатьВСоответствие = Истина) Экспорт
	
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.УстановитьСтроку(СтрокаJson);
	
	Результат = ПрочитатьJSON(ЧтениеJSON, ПрочитатьВСоответствие);
	
	ЧтениеJSON.Закрыть();
	
	Возврат Результат
	
КонецФункции 

#КонецОбласти