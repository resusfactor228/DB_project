-- Индексы на часто используемые поля для фильтрации и сортировки
CREATE INDEX idx_routes_distance_km ON Routes(DistanceKM);
CREATE INDEX idx_stops_latitude ON Stops(Latitude);
CREATE INDEX idx_stops_longitude ON Stops(Longitude);
CREATE INDEX idx_buses_capacity ON Buses(Capacity);
CREATE INDEX idx_schedules_departure_time ON Schedules(DepartureTime);
CREATE INDEX idx_route_stops_stop_order ON RouteStops(StopOrder);
CREATE INDEX idx_bus_maintenance_maintenance_date ON BusMaintenance(MaintenanceDate);
CREATE INDEX idx_bus_maintenance_next_maintenance_date ON BusMaintenance(NextMaintenanceDate);
