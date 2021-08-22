CREATE TABLE `USER`
(
    id             VARCHAR(36)  NOT NULL,
    firstname      VARCHAR(32)  NOT NULL,
    lastname       VARCHAR(32)  NOT NULL,
    birthdate      DATE         NOT NULL,
    email          VARCHAR(255) NOT NULL,
    password       VARCHAR(255) NOT NULL,
    phone          VARCHAR(10)  NULL,
    roles          VARCHAR(32)  NOT NULL,
    created_at     DATETIME     NOT NULL,
    updated_at     DATETIME     NULL,
    deleted_at     DATETIME     NULL,
    deleted_by_id  VARCHAR(36)  NULL,
    deleted_for    VARCHAR(255) NULL,
    PRIMARY KEY (id)
);

CREATE TABLE `WORKER`
(
    user_id VARCHAR(36) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE `CUSTOMER`
(
    user_id        VARCHAR(36)  NOT NULL,
    email_verified BOOLEAN      NULL,
    company_name   VARCHAR(128) NULL,
    company_siret  VARCHAR(14)  NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE `ADDRESS`
(
    id            VARCHAR(36)  NOT NULL,
    label         VARCHAR(32)  NOT NULL,
    firstname     VARCHAR(32)  NOT NULL,
    lastname      VARCHAR(32)  NOT NULL,
    country_id    VARCHAR(2)   NOT NULL,
    city          VARCHAR(64)  NOT NULL,
    postal_code   VARCHAR(16)  NOT NULL,
    street        VARCHAR(255) NOT NULL,
    street_number INT(5)       NOT NULL,
    tips          VARCHAR(255) NULL,
    created_at    DATETIME     NOT NULL,
    created_by_id VARCHAR(36)  NOT NULL,
    updated_at    DATETIME     NULL,
    deleted_at    DATETIME     NULL,
    PRIMARY KEY (id)
);

CREATE TABLE `COUNTRY`
(
    id    VARCHAR(2)  NOT NULL,
    label VARCHAR(32) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE `PURCHASE`
(
    id          VARCHAR(36) NOT NULL,
    customer_id VARCHAR(36) NOT NULL,
    status_id   INT(1)      NOT NULL,
    address_id  VARCHAR(36) NOT NULL,
    created_at  DATETIME    NOT NULL,
    canceled_at DATETIME    NULL,
    PRIMARY KEY (id)
);

CREATE TABLE `PURCHASE_STATUS`
(
	id    INT(1)      NOT NULL,
	label VARCHAR(16) NOT NULL,
	color VARCHAR(6)  NOT NULL,
	icon  VARCHAR(32) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE `PURCHASE_PRODUCT`
(
	purchase_id   VARCHAR(36) NOT NULL,
	product_id VARCHAR(36) NOT NULL,
	quantity   INT(3)      NOT NULL,
    PRIMARY KEY (purchase_id, product_id)
);

CREATE TABLE `PRODUCT`
(
    id            VARCHAR(36)  NOT NULL,
    label         VARCHAR(128) NOT NULL,
    description   TEXT         NOT NULL,
    price         FLOAT        NOT NULL,
    stock         INT(4)       NOT NULL,
    created_at    DATETIME     NOT NULL,
    created_by_id VARCHAR(36)  NOT NULL,
    updated_at    DATETIME     NULL,
    updated_by_id VARCHAR(36)  NULL,
    deleted_at    DATETIME     NULL,
    deleted_by_id VARCHAR(36)  NULL,
    PRIMARY KEY (id)
);

CREATE TABLE `PRODUCT_CATEGORY`
(
	product_id  VARCHAR(36) NOT NULL,
	category_id VARCHAR(36) NOT NULL,
    PRIMARY KEY (product_id, category_id)
);

CREATE TABLE `CATEGORY`
(
	id          VARCHAR(36) NOT NULL,
	label       VARCHAR(64) NOT NULL,
	description TEXT        NOT NULL,
	icon        VARCHAR(32) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE `PRODUCT_PICTURE`
(
	product_id  VARCHAR(36) NOT NULL,
	picture_id  VARCHAR(36) NOT NULL,
	position    INT(2)      NOT NULL,
    PRIMARY KEY (product_id, picture_id)
);

CREATE TABLE `PICTURE`
(
	id        VARCHAR(36) NOT NULL,
	extension VARCHAR(8)  NOT NULL,
	size      INT         NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE `SERVICE_PICTURE`
(
	service_id VARCHAR(36) NOT NULL,
	picture_id VARCHAR(36) NOT NULL,
	position   INT(2)      NOT NULL,
    PRIMARY KEY (service_id, picture_id)
);

CREATE TABLE `SERVICE`
(
    id            VARCHAR(36)  NOT NULL,
    label         VARCHAR(128) NOT NULL,
    description   TEXT         NOT NULL,
    created_at    DATETIME     NOT NULL,
    created_by_id VARCHAR(36)  NOT NULL,
    updated_at    DATETIME     NULL,
    updated_by_id VARCHAR(36)  NULL,
    deleted_at    DATETIME     NULL,
    deleted_by_id VARCHAR(36)  NULL,
    PRIMARY KEY (id)
);

CREATE TABLE `REQUEST`
(
	id          VARCHAR(36) NOT NULL,
	service_id  VARCHAR(36) NOT NULL,
	customer_id VARCHAR(36) NOT NULL,
	status_id   INT(1)      NOT NULL,
	message     TEXT        NOT NULL,
	created_at  DATETIME    NOT NULL,
	canceled_at DATETIME    NULL,
    PRIMARY KEY (id)
);

CREATE TABLE `REQUEST_STATUS`
(
	id    INT(1)      NOT NULL,
	label VARCHAR(16) NOT NULL,
	color VARCHAR(6)  NOT NULL,
	icon  VARCHAR(32) NOT NULL,
    PRIMARY KEY (id)
);


INSERT INTO `USER` (`id`, `firstname`, `lastname`, `birthdate`, `email`, `password`, `phone`, `roles`, `created_at`, `updated_at`, `deleted_at`, `deleted_by_id`, `deleted_for`) VALUES
('dba28fa8-6d58-4f5a-b158-eeadddbb1ea4', 'Eco-Service', 'Superadmin', '2021-02-01', 'so_baron@hotmail.com', '$argon2id$v=19$m=65536,t=4,p=1$9IkKF7/4aqZdiqN36K935Q$i7GY4BVMFgTqUPLouxo7ojOZiQvYA9QQRlQb1dILGgE', '0626073302', '[\"ROLE_SUPERADMIN\"]', '2021-02-01 20:22:37', NULL, NULL, NULL, NULL);

INSERT INTO `WORKER` (`user_id`) VALUES
('dba28fa8-6d58-4f5a-b158-eeadddbb1ea4');

INSERT INTO `REQUEST_STATUS` (`id`, `label`, `color`, `icon`) VALUES
(1, 'Non traité', 'red', 'far fa-envelope'),
(2, 'Traité', 'green', 'far fa-envelope-open');

INSERT INTO `PURCHASE_STATUS` (`id`, `label`, `color`, `icon`) VALUES
(1, 'Payé', 'green', 'fas fa-money-check-alt'),
(2, 'Expédié', 'orange', 'fas fa-truck');

ALTER TABLE `USER`
ADD FOREIGN KEY (deleted_by_id) REFERENCES `WORKER`(user_id);

ALTER TABLE `WORKER`
ADD FOREIGN KEY (user_id) REFERENCES `USER`(id);

ALTER TABLE `CUSTOMER`
ADD FOREIGN KEY (user_id) REFERENCES `USER`(id);

ALTER TABLE `ADDRESS`
ADD FOREIGN KEY (country_id)    REFERENCES `COUNTRY`(id),
ADD FOREIGN KEY (created_by_id) REFERENCES `CUSTOMER`(user_id);

ALTER TABLE `PURCHASE`
ADD FOREIGN KEY (customer_id) REFERENCES `CUSTOMER`(user_id),
ADD FOREIGN KEY (status_id)   REFERENCES `PURCHASE_STATUS`(id),
ADD FOREIGN KEY (address_id)  REFERENCES `ADDRESS`(id);

ALTER TABLE `PURCHASE_PRODUCT`
ADD FOREIGN KEY (purchase_id)   REFERENCES `PURCHASE`(id),
ADD FOREIGN KEY (product_id) REFERENCES `PRODUCT`(id);

ALTER TABLE `PRODUCT`
ADD FOREIGN KEY (created_by_id) REFERENCES `WORKER`(user_id),
ADD FOREIGN KEY (updated_by_id) REFERENCES `WORKER`(user_id),
ADD FOREIGN KEY (deleted_by_id) REFERENCES `WORKER`(user_id);

ALTER TABLE `PRODUCT_CATEGORY`
ADD FOREIGN KEY (product_id)  REFERENCES `PRODUCT`(id),
ADD FOREIGN KEY (category_id) REFERENCES `CATEGORY`(id);

ALTER TABLE `PRODUCT_PICTURE`
ADD FOREIGN KEY (product_id) REFERENCES `PRODUCT`(id),
ADD FOREIGN KEY (picture_id) REFERENCES `PICTURE`(id);

ALTER TABLE `SERVICE_PICTURE`
ADD FOREIGN KEY (service_id) REFERENCES `SERVICE`(id),
ADD FOREIGN KEY (picture_id) REFERENCES `PICTURE`(id);

ALTER TABLE `SERVICE`
ADD FOREIGN KEY (created_by_id) REFERENCES `WORKER`(user_id),
ADD FOREIGN KEY (updated_by_id) REFERENCES `WORKER`(user_id),
ADD FOREIGN KEY (deleted_by_id) REFERENCES `WORKER`(user_id);

ALTER TABLE `REQUEST`
ADD FOREIGN KEY (service_id)  REFERENCES `SERVICE`(id),
ADD FOREIGN KEY (customer_id) REFERENCES `CUSTOMER`(user_id),
ADD FOREIGN KEY (status_id)   REFERENCES `REQUEST_STATUS`(id);
