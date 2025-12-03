

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
