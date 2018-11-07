CREATE TABLE fema_disasters(
disasterNumber text,
ihProgramDeclared text,
iaProgramDeclared text,
paProgramDeclared text,
hmProgramDeclared text,
state text,
declarationDate text,
fyDeclared text,
disasterType text,
incidentType text,
title text,
incidentBeginDate text,
incidentEndDate text,
disasterCloseOutDate text,
declaredCountyArea text,
placeCode text,
hash text,
lastRefresh
);

COPY fema_disasters
    FROM '/Users/Rhoda/Projects/Python/Proposal/DisasterDeclarationsSummaries.csv'
    WITH (FORMAT CSV, HEADER); 
    
select *
from fema_disasters
where incidentbegindate ILIKE '2018-%';

CREATE TABLE 2018_fema_disasters(
disasterNumber text,
ihProgramDeclared text,
iaProgramDeclared text,
paProgramDeclared text,
hmProgramDeclared text,
state text,
declarationDate text,
fyDeclared text,
disasterType text,
incidentType text,
title text,
incidentBeginDate text,
incidentEndDate text,
disasterCloseOutDate text,
declaredCountyArea text,
placeCode text,
hash text,
lastRefresh text
);

select fema_disasters.incidenttype, count(*)
from fema_disasters
where fema_disasters.incidentbegindate ILIKE '2018-%'
group by fema_disasters.incidenttype
order by fema_disasters.incidenttype, count(*) Desc;

CREATE TABLE bike_rides(
tripduration text,
starttime text,
stoptime text,
start_station_id text,
start_station_name text,
start_station_latitude text,
start_station_longitude text,
end_station_id text,
end_station_name text,
end_station_latitude text,
end_station_longitude text,
bikeid text,
usertype text,
birth_year text,
gender text
);

COPY bike_rides
    FROM '/Users/Rhoda/Projects/Python/Proposal/Sept-JC-201809-citibike-tripdata.csv'
    WITH (FORMAT CSV, HEADER); 
    

/* Several things need to happen in order for this analysis to begin to look meaningful 
and have the potential to show promise:
1. I need to figure out how to trim the excess information off the right side of the dates
in both the FEMA and Bike Rides table.
2. I need to get a better understanding of how to visualize data that are both date and 
frequency dependent. This is also true for both sets of data. And I suspect the Twitter feed
will not disappoint.
3. In my mind I envision some kind of clustering type of visualization. And that all three 
sets of data clusters would be super-imposed over each other to begin to look for potential corrleations.*/
select bike_rides.starttime, count(*)
from bike_rides
where bike_rides.starttime ILIKE '2018-%'
group by fema_disasters.incidenttype
order by fema_disasters.incidenttype, count(*) Desc;
