SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `aeropuertos_destino` (
  `id_aeropuerto_destino` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `llegada_vuelo` datetime NOT NULL,
  `puerta_destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `aeropuertos_origen` (
  `id_aeropuerto_origen` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `salida_vuelo` datetime NOT NULL,
  `puerta_origen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `companias` (
  `id_compania` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `pais` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `pasajeros` (
  `id_pasajero` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `edad` int(11) NOT NULL,
  `numero_asiento` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `tipo_aviones` (
  `id_tipo_avion` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `capacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `vuelos` (
  `id_pasajero` int(11) NOT NULL,
  `id_compania` int(11) NOT NULL,
  `id_tipo_avion` int(11) NOT NULL,
  `id_aeropuerto_origen` int(11) NOT NULL,
  `id_aeropuerto_destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `aeropuertos_destino`
  ADD PRIMARY KEY (`id_aeropuerto_destino`),
  ADD KEY `aeropuertos_destino_id_ciudad_ciudades_id_ciudad` (`id_ciudad`);

ALTER TABLE `aeropuertos_origen`
  ADD PRIMARY KEY (`id_aeropuerto_origen`),
  ADD KEY `aeropuertos_origen_id_ciudad_ciudades_id_ciudad` (`id_ciudad`);

ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id_ciudad`);

ALTER TABLE `companias`
  ADD PRIMARY KEY (`id_compania`);

ALTER TABLE `pasajeros`
  ADD PRIMARY KEY (`id_pasajero`);

ALTER TABLE `tipo_aviones`
  ADD PRIMARY KEY (`id_tipo_avion`);

ALTER TABLE `vuelos`
  ADD KEY `vuelos_id_pasajero_pasajeros_id_pasajero` (`id_pasajero`),
  ADD KEY `vuelos_id_compania_companias_id_compania` (`id_compania`),
  ADD KEY `vuelos_id_tipo_avion_tipo_aviones_id_tipo_avion` (`id_tipo_avion`);

ALTER TABLE `aeropuertos_destino`
  ADD CONSTRAINT `aeropuertos_destino_id_ciudad_ciudades_id_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`);

ALTER TABLE `aeropuertos_origen`
  ADD CONSTRAINT `aeropuertos_origen_id_ciudad_ciudades_id_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`);

ALTER TABLE `vuelos`
  ADD CONSTRAINT `vuelos_id_compania_companias_id_compania` FOREIGN KEY (`id_compania`) REFERENCES `companias` (`id_compania`),
  ADD CONSTRAINT `vuelos_id_pasajero_pasajeros_id_pasajero` FOREIGN KEY (`id_pasajero`) REFERENCES `pasajeros` (`id_pasajero`),
  ADD CONSTRAINT `vuelos_id_tipo_avion_tipo_aviones_id_tipo_avion` FOREIGN KEY (`id_tipo_avion`) REFERENCES `tipo_aviones` (`id_tipo_avion`);
COMMIT;