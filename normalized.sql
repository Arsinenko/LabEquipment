

CREATE TABLE discipline
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE lab_type
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE equipment_type
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE function_group
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);



CREATE TABLE technical_specs
(
    id                SERIAL PRIMARY KEY,
    specs             TEXT,
    power_rating      VARCHAR(50),
    dimensions        VARCHAR(100),
    weight            VARCHAR(50),
    material          VARCHAR(100),
    measurement_range VARCHAR(100),
    accuracy          VARCHAR(100)
);



CREATE TABLE infrastructure_requirements
(
    id                   SERIAL PRIMARY KEY,
    needs_220v           BOOLEAN DEFAULT FALSE,
    needs_380v           BOOLEAN DEFAULT FALSE,
    needs_water          BOOLEAN DEFAULT FALSE,
    needs_ventilation    BOOLEAN DEFAULT FALSE,
    needs_gas            BOOLEAN DEFAULT FALSE,
    needs_drain          BOOLEAN DEFAULT FALSE,
    needs_compressed_air BOOLEAN DEFAULT FALSE,
    needs_network        BOOLEAN DEFAULT FALSE,
    needs_grounding      BOOLEAN DEFAULT FALSE,
    room_requirements    TEXT
);


CREATE TABLE safety_requirements
(
    id                  SERIAL PRIMARY KEY,
    requires_ppd        BOOLEAN DEFAULT FALSE,
    hazard_class        VARCHAR(50),
    safety_instructions TEXT,
    certification       VARCHAR(100)
);



CREATE TABLE vendor_info
(
    id                   SERIAL PRIMARY KEY,
    manufacturer         VARCHAR(255),
    model                VARCHAR(100),
    article_number       VARCHAR(100),
    vendor               VARCHAR(255),
    maintenance_required BOOLEAN DEFAULT FALSE,
    maintenance_interval VARCHAR(50)
);



CREATE TABLE digital_features
(
    id                   SERIAL PRIMARY KEY,
    usage_type           VARCHAR(50),
    digital_interface    VARCHAR(100),
    software_required    BOOLEAN,
    software_name        VARCHAR(255),
    calibration_required BOOLEAN
);



CREATE TABLE lab_equipment
(
    id                SERIAL PRIMARY KEY,
    npa_position      VARCHAR(20),
    name              VARCHAR(255) NOT NULL,

    discipline_id     INT,
    lab_type_id       INT,
    equipment_type_id INT,
    function_group_id INT,

    technical_id      INT,
    infrastructure_id INT,
    safety_id         INT,
    vendor_info_id    INT,
    digital_id        INT,

    price             NUMERIC(12, 2),
    currency          VARCHAR(10),
    delivery_time     VARCHAR(100),
    lifecycle_years   INT,

    info_url          TEXT,
    image_url         TEXT,

    created_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (discipline_id) REFERENCES discipline (id),
    FOREIGN KEY (lab_type_id) REFERENCES lab_type (id),
    FOREIGN KEY (equipment_type_id) REFERENCES equipment_type (id),
    FOREIGN KEY (function_group_id) REFERENCES function_group (id),

    FOREIGN KEY (technical_id) REFERENCES technical_specs (id),
    FOREIGN KEY (infrastructure_id) REFERENCES infrastructure_requirements (id),
    FOREIGN KEY (safety_id) REFERENCES safety_requirements (id),
    FOREIGN KEY (vendor_info_id) REFERENCES vendor_info (id),
    FOREIGN KEY (digital_id) REFERENCES digital_features (id)
);

COMMENT ON TABLE discipline IS 'Справочник дисциплин, к которым относится оборудование';
COMMENT ON COLUMN discipline.id IS 'Уникальный идентификатор дисциплины';
COMMENT ON COLUMN discipline.name IS 'Название дисциплины';

COMMENT ON TABLE lab_type IS 'Справочник типов лабораторий';
COMMENT ON COLUMN lab_type.id IS 'Уникальный идентификатор типа лаборатории';
COMMENT ON COLUMN lab_type.name IS 'Название типа лаборатории';

COMMENT ON TABLE equipment_type IS 'Справочник типов оборудования';
COMMENT ON COLUMN equipment_type.id IS 'Уникальный идентификатор типа оборудования';
COMMENT ON COLUMN equipment_type.name IS 'Название типа оборудования';

COMMENT ON TABLE function_group IS 'Справочник функциональных групп оборудования';
COMMENT ON COLUMN function_group.id IS 'Уникальный идентификатор группы';
COMMENT ON COLUMN function_group.name IS 'Название функциональной группы';


-- Технические характеристики
COMMENT ON TABLE technical_specs IS 'Технические характеристики оборудования';
COMMENT ON COLUMN technical_specs.id IS 'Уникальный идентификатор блока характеристик';
COMMENT ON COLUMN technical_specs.specs IS 'Общее текстовое описание технических характеристик';
COMMENT ON COLUMN technical_specs.power_rating IS 'Потребляемая мощность или класс энергопотребления';
COMMENT ON COLUMN technical_specs.dimensions IS 'Габаритные размеры оборудования';
COMMENT ON COLUMN technical_specs.weight IS 'Вес оборудования';
COMMENT ON COLUMN technical_specs.material IS 'Основной материал изготовления';
COMMENT ON COLUMN technical_specs.measurement_range IS 'Диапазон измерений';
COMMENT ON COLUMN technical_specs.accuracy IS 'Точность измерений';


-- Инфраструктура
COMMENT ON TABLE infrastructure_requirements IS 'Инфраструктурные требования оборудования';
COMMENT ON COLUMN infrastructure_requirements.id IS 'Уникальный идентификатор блока требований';
COMMENT ON COLUMN infrastructure_requirements.needs_220v IS 'Необходимость подключения к сети 220 В';
COMMENT ON COLUMN infrastructure_requirements.needs_380v IS 'Необходимость подключения к сети 380 В';
COMMENT ON COLUMN infrastructure_requirements.needs_water IS 'Требуется подвод воды';
COMMENT ON COLUMN infrastructure_requirements.needs_ventilation IS 'Требуется вентиляция';
COMMENT ON COLUMN infrastructure_requirements.needs_gas IS 'Требуется подвод газа';
COMMENT ON COLUMN infrastructure_requirements.needs_drain IS 'Необходим дренаж';
COMMENT ON COLUMN infrastructure_requirements.needs_compressed_air IS 'Необходим сжатый воздух';
COMMENT ON COLUMN infrastructure_requirements.needs_network IS 'Необходимо сетевое подключение';
COMMENT ON COLUMN infrastructure_requirements.needs_grounding IS 'Требуется заземление';
COMMENT ON COLUMN infrastructure_requirements.room_requirements IS 'Особые требования к помещению';


-- Безопасность
COMMENT ON TABLE safety_requirements IS 'Требования безопасности для оборудования';
COMMENT ON COLUMN safety_requirements.id IS 'Уникальный идентификатор блока требований';
COMMENT ON COLUMN safety_requirements.requires_ppd IS 'Необходимость использования средств индивидуальной защиты';
COMMENT ON COLUMN safety_requirements.hazard_class IS 'Класс опасности оборудования';
COMMENT ON COLUMN safety_requirements.safety_instructions IS 'Инструкция по безопасности';
COMMENT ON COLUMN safety_requirements.certification IS 'Требуемая сертификация';


-- Производитель и модель
COMMENT ON TABLE vendor_info IS 'Информация о производителе, модели и поставщике оборудования';
COMMENT ON COLUMN vendor_info.id IS 'Уникальный идентификатор блока информации';
COMMENT ON COLUMN vendor_info.manufacturer IS 'Название производителя';
COMMENT ON COLUMN vendor_info.model IS 'Модель оборудования';
COMMENT ON COLUMN vendor_info.article_number IS 'Артикул или каталожный номер';
COMMENT ON COLUMN vendor_info.vendor IS 'Поставщик оборудования';
COMMENT ON COLUMN vendor_info.maintenance_required IS 'Требуется ли техническое обслуживание';
COMMENT ON COLUMN vendor_info.maintenance_interval IS 'Периодичность обслуживания';


-- Цифровые особенности
COMMENT ON TABLE digital_features IS 'Цифровые и программные особенности оборудования';
COMMENT ON COLUMN digital_features.id IS 'Уникальный идентификатор блока цифровых особенностей';
COMMENT ON COLUMN digital_features.usage_type IS 'Тип цифрового использования';
COMMENT ON COLUMN digital_features.digital_interface IS 'Тип интерфейса (USB, Ethernet и др.)';
COMMENT ON COLUMN digital_features.software_required IS 'Требуется ли ПО для работы';
COMMENT ON COLUMN digital_features.software_name IS 'Название необходимого ПО';
COMMENT ON COLUMN digital_features.calibration_required IS 'Нужна ли цифровая калибровка';


-- Основная таблица оборудования
COMMENT ON TABLE lab_equipment IS 'Основная таблица, объединяющая все характеристики оборудования';
COMMENT ON COLUMN lab_equipment.id IS 'Уникальный идентификатор оборудования';
COMMENT ON COLUMN lab_equipment.npa_position IS 'Позиция оборудования в НПА/перечне';
COMMENT ON COLUMN lab_equipment.name IS 'Название оборудования';
COMMENT ON COLUMN lab_equipment.discipline_id IS 'Связь с дисциплиной';
COMMENT ON COLUMN lab_equipment.lab_type_id IS 'Связь с типом лаборатории';
COMMENT ON COLUMN lab_equipment.equipment_type_id IS 'Связь с типом оборудования';
COMMENT ON COLUMN lab_equipment.function_group_id IS 'Связь с функциональной группой';
COMMENT ON COLUMN lab_equipment.technical_id IS 'Ссылка на технические характеристики';
COMMENT ON COLUMN lab_equipment.infrastructure_id IS 'Ссылка на инфраструктурные требования';
COMMENT ON COLUMN lab_equipment.safety_id IS 'Ссылка на требования безопасности';
COMMENT ON COLUMN lab_equipment.vendor_info_id IS 'Ссылка на данные производителя';
COMMENT ON COLUMN lab_equipment.digital_id IS 'Ссылка на цифровые особенности';
COMMENT ON COLUMN lab_equipment.price IS 'Цена оборудования';
COMMENT ON COLUMN lab_equipment.currency IS 'Валюта (Вдруг не из России везем)';
COMMENT ON COLUMN lab_equipment.delivery_time IS 'Срок поставки';
COMMENT ON COLUMN lab_equipment.lifecycle_years IS 'Срок службы оборудования';
COMMENT ON COLUMN lab_equipment.info_url IS 'Ссылка на информацию или документацию';
COMMENT ON COLUMN lab_equipment.image_url IS 'Ссылка на изображение оборудования';
COMMENT ON COLUMN lab_equipment.created_at IS 'Дата создания записи';
