CREATE TABLE Lab_Equipment
(
    id                   SERIAL PRIMARY KEY,

    npa_position         VARCHAR(20),
    name                 VARCHAR(255) NOT NULL,
    discipline           VARCHAR(100),
    lab_type             VARCHAR(100),
    equipment_type       VARCHAR(100),
    function_group       VARCHAR(100),

    specs                TEXT,
    power_rating         VARCHAR(50),
    dimensions           VARCHAR(100),
    weight               VARCHAR(50),
    material             VARCHAR(100),
    measurement_range    VARCHAR(100),
    accuracy             VARCHAR(100),

    needs_220v           BOOLEAN   DEFAULT FALSE,
    needs_380v           BOOLEAN   DEFAULT FALSE,
    needs_water          BOOLEAN   DEFAULT FALSE,
    needs_ventilation    BOOLEAN   DEFAULT FALSE,
    needs_gas            BOOLEAN   DEFAULT FALSE,
    needs_drain          BOOLEAN   DEFAULT FALSE,
    needs_compressed_air BOOLEAN   DEFAULT FALSE,
    needs_network        BOOLEAN   DEFAULT FALSE,
    needs_grounding      BOOLEAN   DEFAULT FALSE,
    room_requirements    TEXT,

    requires_ppd         BOOLEAN   DEFAULT FALSE,
    hazard_class         VARCHAR(50),
    safety_instructions  TEXT,
    certification        VARCHAR(100),

    manufacturer         VARCHAR(255),
    model                VARCHAR(100),
    article_number       VARCHAR(100),
    vendor               VARCHAR(255),

    price                NUMERIC(12, 2),
    currency             VARCHAR(10),
    delivery_time        VARCHAR(100),
    lifecycle_years      INT,
    maintenance_required BOOLEAN   DEFAULT FALSE,
    maintenance_interval VARCHAR(50),

    usage_type           VARCHAR(50),
    digital_interface    VARCHAR(100),
    software_required    BOOLEAN,
    software_name        VARCHAR(255),
    calibration_required BOOLEAN,

    info_url             TEXT,
    image_url            TEXT,

    created_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at           TIMESTAMP
);
