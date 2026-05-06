-- =============================================================================
-- Barometre - Script de création de la base de données MySQL
-- Généré depuis le dictionnaire de données Barometre_Data_Dictionary.md
-- =============================================================================

SET FOREIGN_KEY_CHECKS = 0;

-- -----------------------------------------------------------------------------
-- Suppression des tables (ordre inverse des dépendances)
-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS `regional_distribution`;
DROP TABLE IF EXISTS `regional_prices_stat`;
DROP TABLE IF EXISTS `regional_result`;
DROP TABLE IF EXISTS `global_data_distribution`;
DROP TABLE IF EXISTS `global_dryers_prices_stat`;
DROP TABLE IF EXISTS `global_washers_prices_stat`;
DROP TABLE IF EXISTS `analysis_run_has_laundromat`;
DROP TABLE IF EXISTS `analysis_run`;
DROP TABLE IF EXISTS `laundromat_has_machine`;
DROP TABLE IF EXISTS `machine`;
DROP TABLE IF EXISTS `laundromat`;
DROP TABLE IF EXISTS `department`;
DROP TABLE IF EXISTS `region`;
DROP TABLE IF EXISTS `machine_fleet_age`;
DROP TABLE IF EXISTS `zone_type`;
DROP TABLE IF EXISTS `dispenser`;
DROP TABLE IF EXISTS `activity_distribution`;
DROP TABLE IF EXISTS `remote_management_system`;
DROP TABLE IF EXISTS `machine_unavailability_rate`;
DROP TABLE IF EXISTS `dryer_revenue_ratio`;
DROP TABLE IF EXISTS `supervision_type`;
DROP TABLE IF EXISTS `operating_hours`;
DROP TABLE IF EXISTS `machine_occupancy_rate`;
DROP TABLE IF EXISTS `payment_option`;
DROP TABLE IF EXISTS `hot_water_supply_method`;
DROP TABLE IF EXISTS `detergent`;
DROP TABLE IF EXISTS `useful_topic`;
DROP TABLE IF EXISTS `laundry_business_experience`;

SET FOREIGN_KEY_CHECKS = 1;

-- =============================================================================
-- TABLES DE RÉFÉRENCE (sans dépendances)
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Table : machine_fleet_age
-- -----------------------------------------------------------------------------
CREATE TABLE `machine_fleet_age` (
    `id`         INT           NOT NULL AUTO_INCREMENT,
    `age_range`  VARCHAR(255)  NOT NULL UNIQUE,
    `created_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : zone_type
-- -----------------------------------------------------------------------------
CREATE TABLE `zone_type` (
    `id`         INT           NOT NULL AUTO_INCREMENT,
    `name`       VARCHAR(255)  NOT NULL UNIQUE,
    `created_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : region
-- -----------------------------------------------------------------------------
CREATE TABLE `region` (
    `id`         INT           NOT NULL AUTO_INCREMENT,
    `name`       VARCHAR(255)  NOT NULL UNIQUE,
    `created_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : dispenser
-- -----------------------------------------------------------------------------
CREATE TABLE `dispenser` (
    `id`                INT           NOT NULL AUTO_INCREMENT,
    `product_available` VARCHAR(255)  NOT NULL UNIQUE,
    `created_at`        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`        TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : activity_distribution
-- -----------------------------------------------------------------------------
CREATE TABLE `activity_distribution` (
    `id`                 INT           NOT NULL AUTO_INCREMENT,
    `distribution_range` VARCHAR(255)  NOT NULL UNIQUE,
    `created_at`         TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`         TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : remote_management_system
-- -----------------------------------------------------------------------------
CREATE TABLE `remote_management_system` (
    `id`         INT           NOT NULL AUTO_INCREMENT,
    `is_remoted` VARCHAR(255)  NOT NULL UNIQUE,
    `created_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : machine_unavailability_rate
-- -----------------------------------------------------------------------------
CREATE TABLE `machine_unavailability_rate` (
    `id`          INT           NOT NULL AUTO_INCREMENT,
    `rate_option` VARCHAR(255)  NOT NULL UNIQUE,
    `created_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : dryer_revenue_ratio
-- -----------------------------------------------------------------------------
CREATE TABLE `dryer_revenue_ratio` (
    `id`           INT           NOT NULL AUTO_INCREMENT,
    `ratio_option` VARCHAR(255)  NOT NULL UNIQUE,
    `created_at`   TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`   TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : supervision_type
-- -----------------------------------------------------------------------------
CREATE TABLE `supervision_type` (
    `id`         INT           NOT NULL AUTO_INCREMENT,
    `type`       VARCHAR(255)  NOT NULL UNIQUE,
    `created_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : operating_hours
-- -----------------------------------------------------------------------------
CREATE TABLE `operating_hours` (
    `id`              INT           NOT NULL AUTO_INCREMENT,
    `operating_range` VARCHAR(255)  NOT NULL UNIQUE,
    `created_at`      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : machine_occupancy_rate
-- -----------------------------------------------------------------------------
CREATE TABLE `machine_occupancy_rate` (
    `id`          INT           NOT NULL AUTO_INCREMENT,
    `rate_option` VARCHAR(255)  NOT NULL UNIQUE,
    `created_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : payment_option
-- -----------------------------------------------------------------------------
CREATE TABLE `payment_option` (
    `id`         INT           NOT NULL AUTO_INCREMENT,
    `option`     VARCHAR(255)  NOT NULL UNIQUE,
    `created_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : hot_water_supply_method
-- -----------------------------------------------------------------------------
CREATE TABLE `hot_water_supply_method` (
    `id`         INT           NOT NULL AUTO_INCREMENT,
    `method`     VARCHAR(255)  NOT NULL UNIQUE,
    `created_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : detergent
-- -----------------------------------------------------------------------------
CREATE TABLE `detergent` (
    `id`         INT           NOT NULL AUTO_INCREMENT,
    `option`     VARCHAR(255)  NOT NULL UNIQUE,
    `created_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : useful_topic
-- -----------------------------------------------------------------------------
CREATE TABLE `useful_topic` (
    `id`         INT           NOT NULL AUTO_INCREMENT,
    `topic`      VARCHAR(255)  NOT NULL UNIQUE,
    `created_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : laundry_business_experience
-- -----------------------------------------------------------------------------
CREATE TABLE `laundry_business_experience` (
    `id`               INT           NOT NULL AUTO_INCREMENT,
    `experience_range` VARCHAR(255)  NOT NULL UNIQUE,
    `created_at`       TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`       TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================================================
-- TABLES GÉOGRAPHIQUES
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Table : department
-- Dépend de : region
-- -----------------------------------------------------------------------------
CREATE TABLE `department` (
    `id`              INT           NOT NULL AUTO_INCREMENT,
    `department_code` VARCHAR(10)   NOT NULL UNIQUE,
    `name`            VARCHAR(255)  NOT NULL UNIQUE,
    `region_id`       INT           NOT NULL,
    `created_at`      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`      TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_department_region`
        FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================================================
-- TABLE PRINCIPALE : laundromat
-- Dépend de : toutes les tables de référence + department
-- =============================================================================

CREATE TABLE `laundromat` (
    `id`                          INT            NOT NULL AUTO_INCREMENT,
    `area`                        DECIMAL(10, 2) NULL     DEFAULT NULL,
    `machine_utilization_average` DECIMAL(10, 2) NULL     DEFAULT NULL,
    -- Clés étrangères vers les tables de référence
    `remote_id`                   INT            NULL     DEFAULT NULL,
    `fleet_id`                    INT            NULL     DEFAULT NULL,
    `payment_id`                  INT            NULL     DEFAULT NULL,
    `unavailability_id`           INT            NULL     DEFAULT NULL,
    `supervision_id`              INT            NULL     DEFAULT NULL,
    `department_id`               INT            NULL     DEFAULT NULL,
    `zone_id`                     INT            NULL     DEFAULT NULL,
    `distribution_id`             INT            NULL     DEFAULT NULL,
    `supply_id`                   INT            NULL     DEFAULT NULL,
    `revenue_id`                  INT            NULL     DEFAULT NULL,
    `occupancy_id`                INT            NULL     DEFAULT NULL,
    `operating_id`                INT            NULL     DEFAULT NULL,
    `dispenser_id`                INT            NULL     DEFAULT NULL,
    `created_at`                  TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                  TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_laundromat_remote`
        FOREIGN KEY (`remote_id`) REFERENCES `remote_management_system` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_laundromat_fleet`
        FOREIGN KEY (`fleet_id`) REFERENCES `machine_fleet_age` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_laundromat_payment`
        FOREIGN KEY (`payment_id`) REFERENCES `payment_option` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_laundromat_unavailability`
        FOREIGN KEY (`unavailability_id`) REFERENCES `machine_unavailability_rate` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_laundromat_supervision`
        FOREIGN KEY (`supervision_id`) REFERENCES `supervision_type` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_laundromat_department`
        FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_laundromat_zone`
        FOREIGN KEY (`zone_id`) REFERENCES `zone_type` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_laundromat_distribution`
        FOREIGN KEY (`distribution_id`) REFERENCES `activity_distribution` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_laundromat_supply`
        FOREIGN KEY (`supply_id`) REFERENCES `hot_water_supply_method` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_laundromat_revenue`
        FOREIGN KEY (`revenue_id`) REFERENCES `dryer_revenue_ratio` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_laundromat_occupancy`
        FOREIGN KEY (`occupancy_id`) REFERENCES `machine_occupancy_rate` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_laundromat_operating`
        FOREIGN KEY (`operating_id`) REFERENCES `operating_hours` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT `fk_laundromat_dispenser`
        FOREIGN KEY (`dispenser_id`) REFERENCES `dispenser` (`id`)
        ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================================================
-- TABLE : machine
-- =============================================================================

CREATE TABLE `machine` (
    `id`             INT            NOT NULL AUTO_INCREMENT,
    `type`           VARCHAR(255)   NOT NULL,
    `load_capacity`  DECIMAL(10, 2) NULL     DEFAULT NULL,
    `price`          DECIMAL(10, 2) NULL     DEFAULT NULL,
    `quantity`       INT            NULL     DEFAULT NULL,
    `cycle_duration` INT            NULL     DEFAULT NULL,
    `created_at`     TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`     TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================================================
-- TABLE DE JONCTION : laundromat_has_machine
-- Dépend de : laundromat, machine
-- =============================================================================

CREATE TABLE `laundromat_has_machine` (
    `laundromat_id` INT       NOT NULL,
    `machine_id`    INT       NOT NULL,
    `created_at`    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`laundromat_id`, `machine_id`),
    CONSTRAINT `fk_laundromat_has_machine_laundromat`
        FOREIGN KEY (`laundromat_id`) REFERENCES `laundromat` (`id`)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `fk_laundromat_has_machine_machine`
        FOREIGN KEY (`machine_id`) REFERENCES `machine` (`id`)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================================================
-- TABLE CENTRALE : analysis_run
-- Dépend de : laundromat
-- =============================================================================

CREATE TABLE `analysis_run` (
    `id`                                INT            NOT NULL AUTO_INCREMENT,
    `triggered_by_laundromat_id`        INT            NOT NULL,
    `total_laundromats`                 INT            NOT NULL,
    `total_washers`                     INT            NOT NULL,
    `total_dryers`                      INT            NOT NULL,
    `total_regions`                     INT            NOT NULL,
    `median_machines_per_laundromat`    DECIMAL(10, 2) NULL     DEFAULT NULL,
    `median_cycles_per_machine_per_day` DECIMAL(10, 2) NULL     DEFAULT NULL,
    `avg_price_per_cycle`               DECIMAL(10, 2) NULL     DEFAULT NULL,
    `median_area`                       DECIMAL(10, 2) NULL     DEFAULT NULL,
    `washer_dryer_ratio`                DECIMAL(10, 2) NULL     DEFAULT NULL,
    `remote_connected_count`            INT            NULL     DEFAULT NULL,
    `created_at`                        TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`                        TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_analysis_run_laundromat`
        FOREIGN KEY (`triggered_by_laundromat_id`) REFERENCES `laundromat` (`id`)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================================================
-- TABLE DE JONCTION : analysis_run_has_laundromat
-- Dépend de : analysis_run, laundromat
-- =============================================================================

CREATE TABLE `analysis_run_has_laundromat` (
    `laundromat_id` INT       NOT NULL,
    `analysis_id`   INT       NOT NULL,
    `created_at`    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`laundromat_id`, `analysis_id`),
    CONSTRAINT `fk_arhl_laundromat`
        FOREIGN KEY (`laundromat_id`) REFERENCES `laundromat` (`id`)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `fk_arhl_analysis_run`
        FOREIGN KEY (`analysis_id`) REFERENCES `analysis_run` (`id`)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================================================
-- TABLES DE RÉSULTATS GLOBAUX
-- Dépendent de : analysis_run
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Table : global_washers_prices_stat
-- -----------------------------------------------------------------------------
CREATE TABLE `global_washers_prices_stat` (
    `id`              INT            NOT NULL AUTO_INCREMENT,
    `analysis_run_id` INT            NOT NULL,
    `load_capacity`   VARCHAR(255)   NOT NULL,
    `median_price`    DECIMAL(10, 2) NULL     DEFAULT NULL,
    `min_price`       DECIMAL(10, 2) NULL     DEFAULT NULL,
    `max_price`       DECIMAL(10, 2) NULL     DEFAULT NULL,
    `observations_nb` INT            NOT NULL DEFAULT 0,
    `created_at`      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_global_washers_analysis_run`
        FOREIGN KEY (`analysis_run_id`) REFERENCES `analysis_run` (`id`)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : global_dryers_prices_stat
-- -----------------------------------------------------------------------------
CREATE TABLE `global_dryers_prices_stat` (
    `id`                       INT            NOT NULL AUTO_INCREMENT,
    `analysis_run_id`          INT            NOT NULL,
    `load_capacity`            VARCHAR(255)   NOT NULL,
    `median_price_per_cycle`   DECIMAL(10, 2) NULL     DEFAULT NULL,
    `median_price_per_minute`  DECIMAL(10, 4) NULL     DEFAULT NULL,
    `min_price`                DECIMAL(10, 2) NULL     DEFAULT NULL,
    `max_price`                DECIMAL(10, 2) NULL     DEFAULT NULL,
    `median_cycle_duration`    INT            NULL     DEFAULT NULL,
    `observations_nb`          INT            NOT NULL DEFAULT 0,
    `created_at`               TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`               TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_global_dryers_analysis_run`
        FOREIGN KEY (`analysis_run_id`) REFERENCES `analysis_run` (`id`)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : global_data_distribution
-- -----------------------------------------------------------------------------
CREATE TABLE `global_data_distribution` (
    `id`                      INT            NOT NULL AUTO_INCREMENT,
    `analysis_run_id`         INT            NOT NULL,
    `distribution_type`       VARCHAR(255)   NOT NULL,
    `label`                   VARCHAR(255)   NOT NULL,
    `count`                   INT            NOT NULL DEFAULT 0,
    `total_distribution_type` INT            NOT NULL DEFAULT 0,
    `percentage`              DECIMAL(6, 2)  NOT NULL DEFAULT 0,
    `created_at`              TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`              TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_global_data_dist_analysis_run`
        FOREIGN KEY (`analysis_run_id`) REFERENCES `analysis_run` (`id`)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================================================
-- TABLES DE RÉSULTATS RÉGIONAUX
-- Dépendent de : analysis_run
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Table : regional_result
-- -----------------------------------------------------------------------------
CREATE TABLE `regional_result` (
    `id`              INT            NOT NULL AUTO_INCREMENT,
    `analysis_run_id` INT            NOT NULL,
    `region_name`     VARCHAR(255)   NOT NULL,
    `laundromats_nb`  INT            NOT NULL DEFAULT 0,
    `median_cycles`   DECIMAL(10, 2) NULL     DEFAULT NULL,
    `created_at`      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`      TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_regional_result_analysis_run`
        FOREIGN KEY (`analysis_run_id`) REFERENCES `analysis_run` (`id`)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : regional_prices_stat
-- Dépend de : regional_result
-- -----------------------------------------------------------------------------
CREATE TABLE `regional_prices_stat` (
    `id`                   INT            NOT NULL AUTO_INCREMENT,
    `regional_result_id`   INT            NOT NULL,
    `washer_load_capacity` VARCHAR(255)   NOT NULL,
    `median_price`         DECIMAL(10, 2) NULL     DEFAULT NULL,
    `observations_nb`      INT            NOT NULL DEFAULT 0,
    `created_at`           TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`           TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_regional_prices_stat_regional_result`
        FOREIGN KEY (`regional_result_id`) REFERENCES `regional_result` (`id`)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------------------------------
-- Table : regional_distribution
-- Dépend de : regional_result
-- -----------------------------------------------------------------------------
CREATE TABLE `regional_distribution` (
    `id`                      INT            NOT NULL AUTO_INCREMENT,
    `regional_result_id`      INT            NOT NULL,
    `distribution_type`       VARCHAR(255)   NOT NULL,
    `label`                   VARCHAR(255)   NOT NULL,
    `count`                   INT            NOT NULL DEFAULT 0,
    `total_distribution_type` INT            NOT NULL DEFAULT 0,
    `percentage`              DECIMAL(6, 2)  NOT NULL DEFAULT 0,
    `created_at`              TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`              TIMESTAMP      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_regional_dist_regional_result`
        FOREIGN KEY (`regional_result_id`) REFERENCES `regional_result` (`id`)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================================================
-- Fin du script
-- =============================================================================
