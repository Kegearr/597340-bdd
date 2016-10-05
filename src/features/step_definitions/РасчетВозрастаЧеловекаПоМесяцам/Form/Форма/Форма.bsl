﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
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
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВозрастЧеловекаЛет(Парам01)","ВозрастЧеловекаЛет","Допустим возраст человека 35 лет");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВозврастВМесяцаБудетРавенМесяцев(Парам01)","ВозврастВМесяцаБудетРавенМесяцев","Тогда возвраст в месяца будет равен 420 месяцев");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВозрастЧеловекаРовноЛетИМесяца(Парам01,Парам02)","ВозрастЧеловекаРовноЛетИМесяца","Допустим возраст человека ровно 35 лет и 4 месяца");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВозрастЧеловекаПолныхЛетИМесяца(Парам01,Парам02)","ВозрастЧеловекаПолныхЛетИМесяца","Допустим возраст человека полных 35 лет и 4 месяца");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВозрастВМесяцахБудетРавенМесяца(Парам01)","ВозрастВМесяцахБудетРавенМесяца","Тогда возраст в месяцах будет равен 424 месяца");

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
	
КонецПроцедуры



&НаКлиенте
//Допустим возраст человека полных 35 лет и 4 месяца
//@ВозрастЧеловекаПолныхЛетИМесяца(Парам01,Парам02)
Процедура ВозрастЧеловекаПолныхЛетИМесяца(ПолныхЛет,КоличествоМесяцев) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	//ВызватьИсключение "Не реализовано.";
	Контекст.Вставить("ПолныхЛет", ПолныхЛет);
	Контекст.Вставить("КоличествоМесяцев", КоличествоМесяцев);
КонецПроцедуры

&НаКлиенте
//Тогда возраст в месяцах будет равен 424 месяца
//@ВозрастВМесяцахБудетРавенМесяца(Парам01)
Процедура ВозрастВМесяцахБудетРавенМесяца(Парам01) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	//ВызватьИсключение "Не реализовано.";
	
	Если НЕ Парам01 = 
			ОбщийМодуль1.ПолучитьКоличествоМесяцев(Контекст.ПолныхЛет, Контекст.КоличествоМесяцев) тогда 
		ВызватьИсключение "Расчёт полных месяцев не верен!";
	КонецЕсли;
		
КонецПроцедуры
