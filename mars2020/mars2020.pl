% planets
planet(earth).
planet(mars).
distance(earth, mars, 480000000).

% mission
mission('Mars 2020 Mission').
owner('Mars 2020 Mission', nasa).
launch_date('Mars 2020 Mission', date(2020,07,30)).
land_date('Mars 2020 Mission', date(2021,02,18)).
launch_place('Mars 2020 Mission', earth).
launch_place('Mars 2020 Mission', mars).
duration('Mars 2020 Mission', 687).

objectives('Mars 2020 Mission', 'Checking spacecraft health and maintenance').
objectives('Mars 2020 Mission', 'Monitoring and calibrating the spacecraft and its onboard subsystems and instruments').
objectives('Mars 2020 Mission', 'Performing attitude correction turns').
objectives('Mars 2020 Mission', 'Conducting navigation activities').
objectives('Mars 2020 Mission', 'Preparing for entry, descent, and landing (EDL) and surface operations').


% rocket
rocket(rocket).

carry(rocket, spacecraft).
carry(spacecraft, perseverance).
carry(spacecraft, ingenuity).
carry(spacecraft, parachute).
carry(spacecraft, descent_vehicle).
carry(spacecraft, skycrane).

% landing system
landind_system(parachute).
landind_system(descent_vehicle).
landind_system(skycrane).

% organization
organization(nasa).

% rover
vehicle(perseverance).
vehicle(ingenuity).

goals(perseverance, 'Looking for Habitability').
goals(perseverance, 'Seeking Biosignatures').
goals(perseverance, 'Caching Samples').
goals(perseverance, 'Preparing for humans').

goals(ingenuity, 'Test powered flight on another world').
goals(ingenuity, 'Experimental flights').

% direction
direction(vertical).
direction(horizontal).

% speed in kph
speed(rocket, vertical , 10000).
speed(perseverance, horizontal , 0.152).
speed(ingenuity, horizontal , 36).
speed(ingenuity, vertical, 10.8).

% queries

% query speed from any direction
speed(rocket,direction(_), _).
speed(ingenuity,direction(_), _).

% search for goals
goals(perseverance, _).
goals(ingenuity, _).

% search who has the specific goal
goals(_, 'Experimental flights').

% search for vehicles carried by spacecraft
carry(spacecraft, vehicles(_)).

% search for landing system carried by spacecraft
carry(spacecraft, landing_system(_)).

% flight_duration(rocket, 7).
