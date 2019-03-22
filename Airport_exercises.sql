# 1) Cantidad de registros de la tabla de vuelos:
select count(*) from Flights;
# 2) Retraso promedio de salida y llegada según el aeropuerto origen.
select Origin, AVG(ArrDelay), AVG(DepDelay) From Flights GROUP BY Origin;
# 3) Retraso promedio de llegada de los vuelos, por meses y según el aeropuerto origen. Además, quieren que los resultado se muestren de la siguiente forma (fíjate en el orden de las filas):
select Origin, colYear, colMonth, AVG(ArrDelay) From Flights GROUP BY colYear, colMonth, Origin;
# 4) Retraso promedio de llegada de los vuelos, por meses y según el aeropuerto origen (misma consulta que antes y con el mismo orden). Pero además, ahora quieren que en vez del código del aeropuerto se muestra el nombre de la ciudad.
select USAirports.City, colMonth, AVG(ArrDelay) From Flights INNER JOIN USAirports on USAirports.IATA=Flights.Origin GROUP BY colMonth, Origin;
# 5) Las compañías con más vuelos cancelados. Además, deben estar ordenadas de forma que las compañías con más cancelaciones aparezcan las primeras.
select UniqueCarrier, COUNT(*) From Flights WHERE Cancelled=1 GROUP BY UniqueCarrier ORDER BY UniqueCarrier DESC;
# 6) El identificador de los 10 aviones que más distancia han recorrido haciendo vuelos.
select flightID, Distance from Flights order by Distance desc Limit 10;
# Test tailNum
select TailNum, SUM(Distance) from Flights GROUP BY TailNum order by sum(Distance) desc Limit 10;
# 7) Compañías con su retraso promedio sólo de aquellas las que sus vuelos llegan a su destino con un retraso promedio mayor de 10 minutos.
select UniqueCarrier, avg(ArrDelay) From Flights Where ArrDelay>10 Group by UniqueCarrier order by avg(ArrDelay) desc; 




