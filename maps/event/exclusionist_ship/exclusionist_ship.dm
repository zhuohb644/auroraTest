/datum/map_template/ruin/away_site/exclusionist_ship
	name = "Exclusionist Ship"
	description = "the humans are dead"
	prefix = "maps/event/"
	suffixes = list("exclusionist_ship/exclusionist_ship.dmm")
	sectors = list(ALL_POSSIBLE_SECTORS)
	template_flags = TEMPLATE_FLAG_SPAWN_GUARANTEED
	id = "exclusionist_ship"
	shuttles_to_initialise = list(/datum/shuttle/autodock/overmap/exclusionist_shuttle)
	unit_test_groups = list(2)

/singleton/submap_archetype/exclusionist_ship
	map = "Exclusionist Ship"
	descriptor = "the humans are dead"

/obj/effect/overmap/visitable/ship/exclusionist_ship
	name = "Exclusionist Ship"
	class = "ICV"
	desc = "A heavily-modified version of a Qing-class Einstein Engines light cargo transportation vessel, though its transponder is not Einstein-registered."
	designation = "Eyes of the Saints"
	icon_state = "corvette"
	moving_state = "corvette-moving"
	color = "#970d0d"
	designer = "Einstein Engines"
	volume = "36 meters length, 43 meters beam/width, 19 meters vertical height"
	drive = "Medium-Speed Warp Acceleration FTL Drive"
	weapons = "Dual extruding medium-caliber ballistic armament, aft obscured flight craft bay"
	sizeclass = "Qing-class liner"
	shiptype = "Research and high-value item transportation."
	max_speed = 1/(2 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 5000
	fore_dir = SOUTH
	vessel_size = SHIP_SIZE_SMALL
	initial_restricted_waypoints = list(
		"Exclusionist Shuttle" = list("nav_exclusionist_hangar")
	)
	initial_generic_waypoints = list(
		"nav_exclusionist_ship1",
		"nav_exclusionist_ship2",
		"nav_exclusionist_ship3",
		"nav_exclusionist_ship4"
	)

/obj/effect/shuttle_landmark/exclusionist_ship
	base_turf = /turf/space/dynamic
	base_area = /area/space

/obj/effect/shuttle_landmark/exclusionist_ship/nav1
	name = "Fore"
	landmark_tag = "nav_exclusionist_ship1"

/obj/effect/shuttle_landmark/exclusionist_ship/nav2
	name = "Aft"
	landmark_tag = "nav_exclusionist_ship2"

/obj/effect/shuttle_landmark/exclusionist_ship/nav3
	name = "Port"
	landmark_tag = "nav_exclusionist_ship3"

/obj/effect/shuttle_landmark/exclusionist_ship/nav4
	name = "Starboard"
	landmark_tag = "nav_exclusionist_ship4"

/obj/effect/shuttle_landmark/exclusionist_ship/dock
	name = "Exclusionist Ship - Docking Port"
	docking_controller = "airlock_exclu_dock"
	landmark_tag = "nav_exclusionist_dock"

/obj/effect/overmap/visitable/ship/landable/exclusionist_shuttle
	name = "Exclusionist Shuttle"
	class = "ICV"
	designation = "Messenger"
	desc = "A heavily-modified version of an old Einstein Engines transport shuttle design."
	icon_state = "shuttle"
	moving_state = "shuttle_moving"
	shuttle = "Exclusionist Shuttle"
	color = "#a22310"
	max_speed = 1/(3 SECONDS)
	burn_delay = 2 SECONDS
	vessel_mass = 3000 //very inefficient pod
	fore_dir = SOUTH
	vessel_size = SHIP_SIZE_TINY

/datum/shuttle/autodock/overmap/exclusionist_shuttle
	name = "Exclusionist Shuttle"
	move_time = 20
	shuttle_area = list(/area/shuttle/exclusionist_ship)
	current_location = "nav_exclusionist_hangar"
	landmark_transition = "nav_exclusionist_transit"
	dock_target = "exclusionist_shuttle"
	range = 1
	fuel_consumption = 2
	logging_home_tag = "nav_exclusionist_hangar"
	defer_initialisation = TRUE

/obj/machinery/computer/shuttle_control/explore/exclusionist_shuttle
	name = "shuttle control console"
	shuttle_tag = "Exclusionist Shuttle"
	req_access = list(ACCESS_SYNDICATE)

/obj/effect/shuttle_landmark/exclusionist_shuttle/transit
	name = "In transit"
	landmark_tag = "nav_exclusionist_transit"
	base_turf = /turf/space/transit

/obj/effect/shuttle_landmark/exclusionist_shuttle/dock
	name = "Exclusionist Ship - Hangar"
	landmark_tag = "nav_exclusionist_hangar"
	docking_controller = "exclusionist_shuttle_dock"
	base_area = /area/exclusionist_ship/hangar
	base_turf = /turf/simulated/floor/plating
	movable_flags = MOVABLE_FLAG_EFFECTMOVE
