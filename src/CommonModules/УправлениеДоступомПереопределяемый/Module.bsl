///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2024, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Область ПрограммныйИнтерфейс

// Заполняет виды доступа, используемые в ограничениях прав доступа.
// Примечание: виды доступа Пользователи и ВнешниеПользователи предопределены,
// но их можно удалить из списка ВидыДоступа, если они не требуются для ограничения прав доступа.
//
// Параметры:
//  ВидыДоступа - ТаблицаЗначений:
//   * Имя                    - Строка - имя, используемое в описании поставляемых
//                                       профилей групп доступа и текстах ОДД.
//   * Представление          - Строка - представляет вид доступа в профилях и группах доступа.
//   * ТипЗначений            - Тип    - тип ссылки значений доступа,
//                                       например Тип("СправочникСсылка.Номенклатура").
//   * ТипГруппЗначений       - Тип    - тип ссылки групп значений доступа,
//                                       например Тип("СправочникСсылка.ГруппыДоступаНоменклатуры").
//   * НесколькоГруппЗначений - Булево - Истина указывает, что для значения доступа (Номенклатуры) можно
//                                       выбрать несколько групп значений (Групп доступа номенклатуры).
//
// Пример:
//  1. Для настройки прав доступа в разрезе организаций:
//  ВидДоступа = ВидыДоступа.Добавить();
//  ВидДоступа.Имя = "Организации";
//  ВидДоступа.Представление = НСтр("ru = 'Организации'");
//  ВидДоступа.ТипЗначений   = Тип("СправочникСсылка.Организации");
//
//  2. Для настройки прав доступа в разрезе групп партнеров:
//  ВидДоступа = ВидыДоступа.Добавить();
//  ВидДоступа.Имя = "ГруппыПартнеров";
//  ВидДоступа.Представление    = НСтр("ru = 'Группы партнеров'");
//  ВидДоступа.ТипЗначений      = Тип("СправочникСсылка.Партнеры");
//  ВидДоступа.ТипГруппЗначений = Тип("СправочникСсылка.ГруппыДоступаПартнеров");
//
Процедура ПриЗаполненииВидовДоступа(ВидыДоступа) Экспорт
	
	
	
КонецПроцедуры

// Позволяет указать объекты метаданных, для которых задана логика ограничения доступа к данным.
// В модулях менеджеров указанных списков размещается процедура обработчика, например:
//
//// Параметры:
////   Ограничение - см. УправлениеДоступомПереопределяемый.ПриЗаполненииОграниченияДоступа.Ограничение.
////
//Процедура ПриЗаполненииОграниченияДоступа(Ограничение) Экспорт
//	
//  Ограничение.Текст =
//  "РазрешитьЧтениеИзменение
//  |ГДЕ
//  |	ЗначениеРазрешено(Организация)
//  |	И ЗначениеРазрешено(Контрагент)";
//	
//КонецПроцедуры
//
// Логика ограничения доступа к данным также может быть переопределена в процедуре
// УправлениеДоступомПереопределяемый.ПриЗаполненииОграниченияДоступа.
//
// Параметры:
//  Списки - Соответствие из КлючИЗначение - списки с ограничением доступа:
//             * Ключ     - ОбъектМетаданных - список с ограничением доступа.
//             * Значение - Булево - Истина - текст ограничения в модуле менеджера,
//                                   Ложь   - текст ограничения в этом переопределяемом
//                          модуле в процедуре ПриЗаполненииОграниченияДоступа.
//
Процедура ПриЗаполненииСписковСОграничениемДоступа(Списки) Экспорт
	
	
	
КонецПроцедуры

// Заполняет описания поставляемых профилей групп доступа и
// переопределяет параметры обновления профилей и групп доступа.
//
// Для автоматической подготовки содержимого процедуры следует воспользоваться инструментами
// разработчика для подсистемы Управление доступом.
//
// Параметры:
//  ОписанияПрофилей - Массив из см. УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа,
//                               см. УправлениеДоступом.НовоеОписаниеПапкиПрофилейГруппДоступа
//  ПараметрыОбновления - Структура:
//   * ОбновлятьИзмененныеПрофили - Булево - начальное значение Истина.
//   * ЗапретитьИзменениеПрофилей - Булево - начальное значение Истина.
//       Если установить Ложь, тогда поставляемые профили можно не только просматривать, но и редактировать.
//   * ОбновлятьГруппыДоступа     - Булево - начальное значение Истина.
//   * ОбновлятьГруппыДоступаСУстаревшимиНастройками - Булево - начальное значение Ложь.
//       Если установить Истина, то настройки значений, выполненные администратором для
//       вида доступа, который был удален из профиля, будут также удалены из групп доступа.
//
// Пример:
//  ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();
//  ОписаниеПрофиля.Имя           = "Менеджер";
//  ОписаниеПрофиля.Идентификатор = "75fa0ecb-98aa-11df-b54f-e0cb4ed5f655";
//  ОписаниеПрофиля.Наименование  = НСтр("ru = 'Менеджер по продажам'", ОбщегоНазначения.КодОсновногоЯзыка());
//  ОписаниеПрофиля.Роли.Добавить("ЗапускВебКлиента");
//  ОписаниеПрофиля.Роли.Добавить("ЗапускТонкогоКлиента");
//  ОписаниеПрофиля.Роли.Добавить("БазовыеПраваБСП");
//  ОписаниеПрофиля.Роли.Добавить("Подсистема_Продажи");
//  ОписаниеПрофиля.Роли.Добавить("ДобавлениеИзменениеДокументовПокупателей");
//  ОписаниеПрофиля.Роли.Добавить("ПросмотрОтчетаКнигаПокупок");
//  ОписанияПрофилей.Добавить(ОписаниеПрофиля);
//
//  ОписаниеПапки = УправлениеДоступом.НовоеОписаниеПапкиПрофилейГруппДоступа();
//  ОписаниеПапки.Имя           = "ДополнительныеПрофили";
//  ОписаниеПапки.Идентификатор = "69a066e7-ce81-11eb-881c-b06ebfbf08c7";
//  ОписаниеПапки.Наименование  = НСтр("ru = 'Дополнительные профили'", ОбщегоНазначения.КодОсновногоЯзыка());
//  ОписанияПрофилей.Добавить(ОписаниеПапки);
//
//  ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();
//  ОписаниеПрофиля.Родитель = "ДополнительныеПрофили";
//  ОписаниеПрофиля.Идентификатор = "70179f20-2315-11e6-9bff-d850e648b60c";
//  ОписаниеПрофиля.Наименование = НСтр("ru = 'Редактирование, отправка по почте, сохранение в файл печатных форм (дополнительно)'",
//  	ОбщегоНазначения.КодОсновногоЯзыка());
//  ОписаниеПрофиля.Описание = НСтр("ru = 'Дополнительно назначается пользователям, которым должна быть доступна возможность редактирования,
//  	|перед печатью, отправка по почте и сохранение в файл сформированных печатных форм.'");
//  ОписаниеПрофиля.Роли.Добавить("РедактированиеПечатныхФорм");
//  ОписанияПрофилей.Добавить(ОписаниеПрофиля);
//
Процедура ПриЗаполненииПоставляемыхПрофилейГруппДоступа(ОписанияПрофилей, ПараметрыОбновления) Экспорт

	ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();
	ОписаниеПрофиля.Имя           = "Кассир";
	ОписаниеПрофиля.Идентификатор = "7c376082-1178-4237-8627-e6be06ab5923";
	ОписаниеПрофиля.Наименование  = НСтр("ru = 'Кассир'", ОбщегоНазначения.КодОсновногоЯзыка());
	ОписаниеПрофиля.Роли.Добавить("ЗапускВебКлиента");
	ОписаниеПрофиля.Роли.Добавить("ЗапускТонкогоКлиента");
	ОписаниеПрофиля.Роли.Добавить("БазовыеПраваБСП");
	ОписаниеПрофиля.Роли.Добавить("Кассир");
	ОписаниеПрофиля.Роли.Добавить("СохранениеДанныхПользователя");
	ОписаниеПрофиля.Роли.Добавить("ВыводНаПринтерФайлБуферОбмена");
	ОписанияПрофилей.Добавить(ОписаниеПрофиля);
	
	ОписаниеПрофиля = УправлениеДоступом.НовоеОписаниеПрофиляГруппДоступа();
	ОписаниеПрофиля.Имя           = "ОператорАттракциона";
	ОписаниеПрофиля.Идентификатор = "806cfcce-d1b5-408b-a2bf-04cef5bdf71a";
	ОписаниеПрофиля.Наименование  = НСтр("ru = 'Оператор аттракциона'", ОбщегоНазначения.КодОсновногоЯзыка());
	ОписаниеПрофиля.Роли.Добавить("ЗапускВебКлиента");
	ОписаниеПрофиля.Роли.Добавить("ЗапускТонкогоКлиента");
	ОписаниеПрофиля.Роли.Добавить("БазовыеПраваБСП");
	ОписаниеПрофиля.Роли.Добавить("ОператорАттракциона");
	ОписаниеПрофиля.Роли.Добавить("СохранениеДанныхПользователя");
	ОписаниеПрофиля.Роли.Добавить("ВыводНаПринтерФайлБуферОбмена");
	ОписанияПрофилей.Добавить(ОписаниеПрофиля);		
		
КонецПроцедуры

// Заполняет зависимости прав доступа "подчиненного" объекта (например, задачи ЗадачаИсполнителя),
// от "ведущего" объекта (например,  бизнес-процесса Задание), которые отличаются от стандартных.
//
// Зависимости прав используются в стандартном шаблоне ограничения доступа для вида доступа "Объект".
// 1. Стандартно при чтении "подчиненного" объекта
//    проверяется наличие права чтения "ведущего" объекта и
//    проверяется отсутствие ограничения чтения "ведущего" объекта.
// 2. Стандартно при добавлении, изменении, удалении "подчиненного" объекта
//    проверяется наличие права изменения "ведущего" объекта и
//    проверяется отсутствие ограничения изменения "ведущего" объекта.
//
// Допускается только одно переназначение по сравнению со стандартным -
// в пункте 2 вместо проверки права изменения "ведущего" объекта установить
// проверку права чтения "ведущего" объекта.
//
// Параметры:
//  ЗависимостиПрав - ТаблицаЗначений:
//   * ВедущаяТаблица     - Строка - например Метаданные.БизнесПроцессы.Задание.ПолноеИмя().
//   * ПодчиненнаяТаблица - Строка - например Метаданные.Задачи.ЗадачаИсполнителя.ПолноеИмя().
//
Процедура ПриЗаполненииЗависимостейПравДоступа(ЗависимостиПрав) Экспорт
	
	
	
КонецПроцедуры

// Заполняет описания возможных прав, назначаемых для объектов указанных типов.
//
// Параметры:
//  ВозможныеПрава - ТаблицаЗначений:
//   * ВладелецПрав - Строка - полное имя таблицы значения доступа.
//
//   * Имя          - Строка - идентификатор права, например ИзменениеПапок. Право с именем УправлениеПравами
//                  должно быть обязательно определено для общей формы настройки прав "Права доступа".
//                  УправлениеПравами - это право на изменение прав по владельцу прав, которое проверяется
//                  при открытии ОбщаяФорма.НастройкиПравОбъектов.
//
//   * Заголовок    - Строка - заголовок права, например в форме НастройкиПравОбъектов:
//                  "Изменение.
//                  |папок".
//
//   * Подсказка    - Строка - подсказка к заголовку права,
//                  например "Добавление, изменение и пометка удаления папок".
//
//   * НачальноеЗначение - Булево - начальное значение флажка права при добавлении новой строки
//                  в форме "Права доступа".
//
//   * ТребуемыеПрава - Массив из Строка - имена прав, требуемых для этого права -
//                  например, право "ДобавлениеФайлов" требует права "ИзменениеФайлов".
//
//   * ЧтениеВТаблицах - Массив из Строка - полные имена таблиц, для которых это право обозначает право Чтение.
//                  Возможно использование символа "*", который обозначает "для всех остальных таблиц",
//                  т.к. право Чтение может зависеть только от права Чтение, то имеет смысл только символ "*"
//                  (требуется для работы шаблонов ограничения доступа).
//
//   * ИзменениеВТаблицах - Массив из Строка - полные имена таблиц, для которых это право обозначает право Изменение.
//                  Возможно использование символа "*", который обозначает "для всех остальных таблиц"
//                  (требуется для работы шаблонов ограничения доступа).
//
Процедура ПриЗаполненииВозможныхПравДляНастройкиПравОбъектов(ВозможныеПрава) Экспорт
	
КонецПроцедуры

// Определяет вид используемого интерфейса пользователя для настройки доступа.
//
// Параметры:
//  УпрощенныйИнтерфейс - Булево - начальное значение Ложь.
//
Процедура ПриОпределенииИнтерфейсаНастройкиДоступа(УпрощенныйИнтерфейс) Экспорт

	УпрощенныйИнтерфейс = Истина;	
	
КонецПроцедуры

// Заполняет использование видов доступа в зависимости от функциональных опций конфигурации,
// например, ИспользоватьГруппыДоступаНоменклатуры.
//
// Параметры:
//  ВидДоступа    - Строка - имя вида доступа, заданное в процедуре ПриЗаполненииВидовДоступа.
//  Использование - Булево - начальное значение Истина.
// 
Процедура ПриЗаполненииИспользованияВидаДоступа(ВидДоступа, Использование) Экспорт
	
	
	
КонецПроцедуры

// Позволяет переопределить ограничение, указанное в модуле менеджера объекта метаданных.
//
// Параметры:
//  Список - ОбъектМетаданных - список, для которого нужно вернуть текст ограничения.
//                              В процедуре ПриЗаполненииСписковСОграничениемДоступа нужно
//                              указать для списка значение Ложь, иначе вызова не будет.
//
//  Ограничение - Структура:
//    * Текст                             - Строка - ограничение доступа для пользователей.
//                                          Если пустая строка, значит, доступ разрешен.
//    * ТекстДляВнешнихПользователей      - Строка - ограничение доступа для внешних пользователей.
//                                          Если пустая строка, значит, доступ запрещен.
//    * ПоВладельцуБезЗаписиКлючейДоступа - Неопределено - определить автоматически.
//                                        - Булево - если Ложь, то всегда записывать ключи доступа,
//                                          если Истина, тогда не записывать ключи доступа,
//                                          а использовать ключи доступа владельца (требуется,
//                                          чтобы ограничение было строго по объекту-владельцу).
//   * ПоВладельцуБезЗаписиКлючейДоступаДляВнешнихПользователей - Неопределено, Булево - также
//                                          как у параметра ПоВладельцуБезЗаписиКлючейДоступа.
//
Процедура ПриЗаполненииОграниченияДоступа(Список, Ограничение) Экспорт
	
	
	
КонецПроцедуры

// Заполняет состав видов доступа, используемых при ограничении прав объектов метаданных.
// Если состав видов доступа не заполнен, отчет "Права доступа" покажет некорректные сведения.
//
// Обязательно требуется заполнить только виды доступа, используемые в шаблонах ограничения доступа
// явно, а виды доступа, используемые в наборах значений доступа, могут быть получены из текущего
// состояния регистра сведений НаборыЗначенийДоступа.
//
//  Для автоматической подготовки содержимого процедуры следует воспользоваться инструментами
// разработчика для подсистемы Управление доступом.
//
// Параметры:
//  Описание     - Строка - многострочная строка формата <Таблица>.<Право>.<ВидДоступа>[.Таблица объекта],
//                 например, "Документ.ПриходнаяНакладная.Чтение.Организации",
//                           "Документ.ПриходнаяНакладная.Чтение.Контрагенты",
//                           "Документ.ПриходнаяНакладная.Изменение.Организации",
//                           "Документ.ПриходнаяНакладная.Изменение.Контрагенты",
//                           "Документ.ЭлектронныеПисьма.Чтение.Объект.Документ.ЭлектронныеПисьма",
//                           "Документ.ЭлектронныеПисьма.Изменение.Объект.Документ.ЭлектронныеПисьма",
//                           "Документ.Файлы.Чтение.Объект.Справочник.ПапкиФайлов",
//                           "Документ.Файлы.Чтение.Объект.Документ.ЭлектронноеПисьмо",
//                           "Документ.Файлы.Изменение.Объект.Справочник.ПапкиФайлов",
//                           "Документ.Файлы.Изменение.Объект.Документ.ЭлектронноеПисьмо".
//                 Вид доступа Объект предопределен как литерал. Этот вид доступа используется в
//                 шаблонах ограничений доступа как "ссылка" на другой объект, по которому
//                 ограничивается текущий объект таблицы.
//                 Когда вид доступа "Объект" задан, также требуется задать типы таблиц,
//                 которые используются для этого вида доступа. Т.е. перечислить типы,
//                 которые соответствуют полю, использованному в шаблоне ограничения доступа
//                 в паре с видом доступа "Объект". При перечислении типов по виду доступа "Объект"
//                 нужно перечислить только те типы поля, которые есть
//                 у поля РегистрыСведений.НаборыЗначенийДоступа.Объект, остальные типы лишние.
// 
Процедура ПриЗаполненииВидовОграниченийПравОбъектовМетаданных(Описание) Экспорт
	
	
	
КонецПроцедуры

// Позволяет реализовать перезапись зависимых наборов значений доступа других объектов.
//
// Вызывается из процедур
//  УправлениеДоступомСлужебный.ЗаписатьНаборыЗначенийДоступа,
//  УправлениеДоступомСлужебный.ЗаписатьЗависимыеНаборыЗначенийДоступа.
//
// Параметры:
//  Ссылка - ЛюбаяСсылка - ссылка на объект, для которого записываются наборы значений доступа.
//
//  СсылкиНаЗависимыеОбъекты - Массив - массив элементов типа СправочникСсылка, ДокументСсылка и т. п.
//                 Содержит ссылки на объекты с зависимыми наборами значений доступа.
//                 Начальное значение - пустой массив.
//
Процедура ПриИзмененииНаборовЗначенийДоступа(Ссылка, СсылкиНаЗависимыеОбъекты) Экспорт
	
	
	
КонецПроцедуры

#КонецОбласти