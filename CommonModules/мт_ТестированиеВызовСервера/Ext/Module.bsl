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

// Устанавливает значение глобального контекста тестирования для последующего обращения к этому значению из методов
// тестирования.
//
// Параметры:
//  Ключ - Строка - ключ (имя) значения.
//  Значение - Произвольный - устанавливаемое значение для указанного ключа.
//
Процедура УстановитьЗначениеКонтекстаТестирования(Ключ, Значение) Экспорт
	
	Если Значение <> Неопределено Тогда
		ХранилищеОбщихНастроек.Сохранить(КлючОбъектаНастроек(), Ключ, Значение);
	Иначе
		ХранилищеОбщихНастроек.Удалить(КлючОбъектаНастроек(), Ключ, Неопределено);
	КонецЕсли; 
	
КонецПроцедуры 

// Возвращает значение глобального контекста тестирования, установленного ранее вызовом метода
// "УстановитьЗначениеКонтекстаТестирования". Если значение отсутствует, то будет возвращен параметр
// ЗначениеПоУмолчанию.
//
// Параметры:
//  Ключ - Строка - ключ (имя) значения
//  ЗначениеПоУмолчанию - Произвольный - если сохранённое значение отсутствует, то будет возращено значение этого
//                                       параметра (по умолчанию Неопределено).
// 
// Возвращаемое значение:
//  Произвольный, Неопределено - значение глобального контекста тестирования. Если значение отсутствует, то будет
//                               возващено Неопределено.
//
Функция ПолучитьЗначениеКонтекстаТестирования(Ключ, ЗначениеПоУмолчанию = Неопределено) Экспорт
	
	Значение = ХранилищеОбщихНастроек.Загрузить(КлючОбъектаНастроек(), Ключ);
	Возврат ?(Значение <> Неопределено, Значение, ЗначениеПоУмолчанию);
	
КонецФункции 

// Возвращает Истина, если запущено тестирование. Используется в подстановках и заглушках с целью определения алгоритма
// для выполнения - вызвать оригинальный метод или использовать подстановку/заглушку.
// 
// Возвращаемое значение:
//  Булево - Истина, если запущено тестирование.
//
Функция ВыполняетсяТестирование() Экспорт
	
	Возврат ПолучитьЗначениеКонтекстаТестирования("ВыполняетсяТестирование", Ложь);
	
КонецФункции 

Процедура ИнициализироватьКонтекстТестирования() Экспорт
	
	ХранилищеОбщихНастроек.Удалить(КлючОбъектаНастроек(), Неопределено, Неопределено);
	УстановитьЗначениеКонтекстаТестирования("ВыполняетсяТестирование", Истина);
	
КонецПроцедуры 

#КонецОбласти 

#Область СлужебныеПроцедурыИФункции

Функция КлючОбъектаНастроек()
	
	Возврат "com.ptolkachev.1cunit_КонтекстТестирования";
	
КонецФункции 

#КонецОбласти 