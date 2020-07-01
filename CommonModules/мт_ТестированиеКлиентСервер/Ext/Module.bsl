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

// Проверяет равенство двух переданных значений. Если ЛевоеЗначение НЕ РАВНО ПравоеЗначение, то вызывается исключение.
//
// Параметры:
//  ЛевоеЗначение - Произвольный - первое сравниваемое значение.
//  ПравоеЗначение - Произвольный - второе сравниваемое значение.
//
Процедура ПроверитьЗначенияРавны(ЛевоеЗначение, ПравоеЗначение) Экспорт
	
	Если ЛевоеЗначение <> ПравоеЗначение Тогда
		ВызватьИсключение СтрШаблон(НСтр("ru='Значения параметров различаются: %1 - %2'"),
							Строка(ЛевоеЗначение), Строка(ПравоеЗначение));
	КонецЕсли;
	
КонецПроцедуры 

// Проверяет равенство двух переданных значений. Если ЛевоеЗначение РАВНО ПравоеЗначение, то вызывается исключение.
//
// Параметры:
//  ЛевоеЗначение - Произвольный - первое сравниваемое значение.
//  ПравоеЗначение - Произвольный - второе сравниваемое значение.
//
Процедура ПроверитьЗначенияНеРавны(ЛевоеЗначение, ПравоеЗначение) Экспорт
	
	Если ЛевоеЗначение = ПравоеЗначение Тогда
		ВызватьИсключение СтрШаблон(НСтр("ru='Параметры имеют одинаковое значение: %1'"),
							Строка(ЛевоеЗначение));
	КонецЕсли;
	
КонецПроцедуры 

#КонецОбласти 

#КонецОбласти