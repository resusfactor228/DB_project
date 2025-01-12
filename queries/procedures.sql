CREATE OR REPLACE PROCEDURE add_route(
	IN RouteName VARCHAR,
    IN DistanceKM DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Routes (RouteName, DistanceKM)
    VALUES (RouteName, DistanceKM);
END;
$$;

CREATE OR REPLACE PROCEDURE add_stop(
    IN StopName VARCHAR,
    IN Latitude DECIMAL,
    IN Longitude DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Stops (StopName, Latitude, Longitude)
    VALUES (StopName, Latitude, Longitude);
END;
$$;

CREATE OR REPLACE PROCEDURE add_bus(
    IN BusModel VARCHAR,
    IN Capacity INT,
    IN LastMaintenanceDate DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Buses (BusModel, Capacity, LastMaintenanceDate)
    VALUES (BusModel, Capacity, LastMaintenanceDate);
END;
$$;

CREATE OR REPLACE PROCEDURE add_schedule(
    IN RouteID INT,
    IN BusID INT,
    IN DepartureTime TIME
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Schedules (RouteID, BusID, DepartureTime)
    VALUES (RouteID, BusID, DepartureTime);
END;
$$;

CREATE OR REPLACE PROCEDURE add_routestop(
    IN RouteID INT,
    IN StopID INT,
    IN StopOrder INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO RouteStops (RouteID, StopID, StopOrder)
    VALUES (RouteID, StopID, StopOrder);
END;
$$;

CREATE OR REPLACE PROCEDURE add_maintenance(
    IN BusID INT,
    IN MaintenanceDate DATE,
    IN MaintenanceType VARCHAR,
    IN NextMaintenanceDate DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO BusMaintenance (BusID, MaintenanceDate, MaintenanceType, NextMaintenanceDate)
    VALUES (BusID, MaintenanceDate, MaintenanceType, NextMaintenanceDate);
END;
$$;
