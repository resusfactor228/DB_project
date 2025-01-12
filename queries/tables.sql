CREATE TABLE Routes (
    RouteID SERIAL PRIMARY KEY,
    RouteName VARCHAR(100) NOT NULL,
    DistanceKM DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Stops (
    StopID SERIAL PRIMARY KEY,
    StopName VARCHAR(100) NOT NULL,
    Latitude DECIMAL(9, 6) NOT NULL,
    Longitude DECIMAL(9, 6) NOT NULL
);

CREATE TABLE Buses (
    BusID SERIAL PRIMARY KEY,
    BusModel VARCHAR(100) NOT NULL,
    Capacity INT NOT NULL,
    LastMaintenanceDate DATE
);

CREATE TABLE Schedules (
    ScheduleID SERIAL PRIMARY KEY,
    RouteID INT,
    BusID INT,
    DepartureTime TIME NOT NULL,
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID),
    FOREIGN KEY (BusID) REFERENCES Buses(BusID)
);

CREATE TABLE RouteStops (
    RouteStopID SERIAL PRIMARY KEY,
    RouteID INT,
    StopID INT,
    StopOrder INT NOT NULL,
    FOREIGN KEY (RouteID) REFERENCES Routes(RouteID),
    FOREIGN KEY (StopID) REFERENCES Stops(StopID)
);

CREATE TABLE BusMaintenance (
    MaintenanceID SERIAL PRIMARY KEY,
    BusID INT,
    MaintenanceDate DATE NOT NULL,
    MaintenanceType VARCHAR(100) NOT NULL,
    NextMaintenanceDate DATE,
    FOREIGN KEY (BusID) REFERENCES Buses(BusID)
);

CREATE OR REPLACE FUNCTION update_next_maintenance_date()
RETURNS TRIGGER AS $$
BEGIN
    NEW.NextMaintenanceDate := NEW.MaintenanceDate + INTERVAL '6 months';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
