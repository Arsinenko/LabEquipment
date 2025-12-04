# Проект базы данных для лабораторного оборудования

Этот проект является ответом на задание по производственной практике и демонстрирует два подхода к проектированию схемы базы данных для учета лабораторного оборудования.

## Скрипты

В проекте представлены два SQL-скрипта:

### 1. `one_table.sql`

Этот скрипт создает единую, денормализованную таблицу с именем `Lab_Equipment`.

*   **Подход:** Все атрибуты оборудования собраны в одной таблице.
*   **Преимущества:** Простота запросов, так как не требуется соединять таблицы (JOINs).
*   **Недостатки:** Избыточность данных, возможные аномалии при обновлении, добавлении и удалении данных.

### 2. `normalized.sql`

Этот скрипт создает нормализованную схему базы данных, состоящую из нескольких связанных таблиц.

*   **Подход:** Данные разделены на логические группы и хранятся в отдельных таблицах (`discipline`, `lab_type`, `technical_specs`, `safety_requirements` и т.д.). Основная таблица `lab_equipment` связывает все данные с помощью внешних ключей (FOREIGN KEYs).
*   **Преимущества:** Устранение избыточности данных, обеспечение целостности данных, большая гибкость и масштабируемость.
*   **Недостатки:** Усложнение запросов, так как для получения полной информации требуется соединение нескольких таблиц.

```mermaid
---
config:
  theme: neo-dark
---
classDiagram
  direction BT

  class digital_features {
    varchar(50) usage_type
    varchar(100) digital_interface
    boolean software_required
    varchar(255) software_name
    boolean calibration_required
    integer id
  }

  class discipline {
    varchar(100) name
    integer id
  }

  class lab_type {
    varchar(100) name
    integer id
  }

  class equipment_type {
    varchar(100) name
    integer id
  }

  class infrastructure_requirements {
    boolean needs_220v
    boolean needs_380v
    boolean needs_water
    boolean needs_ventilation
    boolean needs_gas
    boolean needs_drain
    boolean needs_compressed_air
    boolean needs_network
    boolean needs_grounding
    text room_requirements
    integer id
  }

  class lab_equipment {
    varchar(20) npa_position
    varchar(255) name
    integer discipline_id
    integer lab_type_id
    integer equipment_type_id
    integer function_group_id
    integer technical_id
    integer infrastructure_id
    integer safety_id
    integer vendor_info_id
    integer digital_id
    numeric(12,2) price
    varchar(10) currency
    varchar(100) delivery_time
    integer lifecycle_years
    text info_url
    text image_url
    timestamp created_at
    integer id
  }

  class function_group {
    varchar(100) name
    integer id
  }

  class safety_requirements {
    boolean requires_ppd
    varchar(50) hazard_class
    text safety_instructions
    varchar(100) certification
    integer id
  }

  class technical_specs {
    text specs
    varchar(50) power_rating
    varchar(100) dimensions
    varchar(50) weight
    varchar(100) material
    varchar(100) measurement_range
    varchar(100) accuracy
    integer id
  }

  class vendor_info {
    varchar(255) manufacturer
    varchar(100) model
    varchar(100) article_number
    varchar(255) vendor
    boolean maintenance_required
    varchar(50) maintenance_interval
    integer id
  }

  lab_equipment --> digital_features
  lab_equipment --> discipline
  lab_equipment --> lab_type
  lab_equipment --> equipment_type
  lab_equipment --> infrastructure_requirements
  lab_equipment --> function_group
  lab_equipment --> safety_requirements
  lab_equipment --> technical_specs
  lab_equipment --> vendor_info

```