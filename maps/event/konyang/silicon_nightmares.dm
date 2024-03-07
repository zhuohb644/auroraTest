//Map Stuff Proper
/datum/map/event/konyang
	name = "Konyang"
	full_name = "Konyang"
	path = "event/konyang"
	lobby_icons = list('icons/misc/titlescreens/lore/silicon_nightmares.dmi')
	lobby_transitions = FALSE
	allowed_jobs = list(/datum/job/visitor, /datum/job/passenger, /datum/job/captain, /datum/job/xo, /datum/job/operations_manager, /datum/job/chief_engineer, /datum/job/cmo, /datum/job/rd, /datum/job/hos, /datum/job/eventeng, /datum/job/eventmed, /datum/job/eventops, /datum/job/eventsci, /datum/job/eventsec)


	station_levels = list(1)
	admin_levels = list(2)
	contact_levels = list(1)
	player_levels = list(1)
	accessible_z_levels = list(1)
	base_turf_by_z = list(
		"1" = /turf/unsimulated/mineral/konyang,
		"2" = /turf/space)

	station_name = "Konyang"
	station_short = "Konyang"
	dock_name = "SCCV Horizon"
	boss_name = "Stellar Corporate Conglomerate"
	boss_short = "SCC"
	company_name = "Stellar Corporate Conglomerate"
	company_short = "SCC"
	station_type = "planet"
	use_overmap = FALSE
	map_shuttles = list(
		/datum/shuttle/autodock/ferry/scc_evac
	)

//Areas
/area/sn_wild
	name = "Konyang Wilderness"
	icon_state = "bluenew"
	base_turf = /turf/simulated/floor/exoplanet/dirt_konyang
	requires_power = FALSE
	ambience = list('sound/effects/wind/wind_2_1.ogg','sound/effects/wind/wind_2_2.ogg','sound/effects/wind/wind_3_1.ogg','sound/effects/wind/wind_4_1.ogg','sound/ambience/eeriejungle2.ogg','sound/ambience/eeriejungle1.ogg')
	area_flags = AREA_FLAG_INDESTRUCTIBLE_TURFS
	var/lighting = TRUE

/area/sn_wild/play_ambience(var/mob/living/L)
	..()
	if(L && L.client && (L.client.prefs.sfx_toggles & ASFX_AMBIENCE) && !L.ear_deaf)
		L.playsound_to(get_turf(L),sound('sound/ambience/jungle.ogg', repeat = 1, wait = 0, volume = 25, channel = 1))

/area/sn_wild/Initialize()
	. = ..()
	if(lighting)
		for(var/turf/T in src)
			T.set_light(MINIMUM_USEFUL_LIGHT_RANGE, 0.4, COLOR_WHITE)

/area/sn_interiors //Generic interior areas
	name = "Interiors"
	icon_state = "green"
	base_turf = /turf/simulated/floor/plating
	requires_power = FALSE
	area_flags = AREA_FLAG_INDESTRUCTIBLE_TURFS

/area/sn_powerstation
	name = "KRC Power Station"
	icon_state = "engineering"
	requires_power = TRUE //so engineering gets to play around
	base_turf = /turf/simulated/floor/plating
	ambience = AMBIENCE_ENGINEERING
	area_flags = AREA_FLAG_INDESTRUCTIBLE_TURFS

/area/sn_warehouse
	name = "KRC Warehouse"
	icon_state = "red"
	base_turf = /turf/simulated/floor/plating
	requires_power = TRUE
	ambience = AMBIENCE_FOREBODING
	area_flags = AREA_FLAG_INDESTRUCTIBLE_TURFS

//Fluff Items & Corpses
/obj/effect/landmark/corpse/konyang_ipc
	name = "Konyang IPC"
	mobname = "Gongli-7"
	corpseuniform = /obj/item/clothing/under/rank/konyang/krc
	corpsesuit = /obj/item/clothing/suit/storage/hazardvest
	corpseshoes = /obj/item/clothing/shoes/workboots
	corpsehelmet = /obj/item/clothing/head/hardhat
	corpseid = TRUE
	corpseidjob = "KRC Warehouse Staff"
	species = SPECIES_IPC

/obj/effect/landmark/corpse/konyang_ipc/do_extra_customization(mob/living/carbon/human/M)
	var/obj/item/organ/internal/cell/C = M.internal_organs_by_name[BP_CELL]
	qdel(C)
	M.update_body()

/obj/effect/landmark/corpse/einstein_goon
	name = "Einstein Engines Operative"
	corpseuniform = /obj/item/clothing/under/rank/einstein
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpseid = TRUE
	corpseidjob = "Asset Protection Agent"
	corpseidicon = "einstein_card"
	corpsepocket1 = /obj/item/grenade/empgrenade
	corpseradio = /obj/item/device/radio/headset/ship
	corpsebelt = /obj/item/storage/belt/military
	corpseglasses = /obj/item/clothing/glasses/night
	corpseback = /obj/item/rig/merc/einstein
	corpsebelt = /obj/item/gun/energy/gun/nuclear
	species = SPECIES_HUMAN

/obj/effect/landmark/corpse/einstein_goon/do_extra_customization(mob/living/carbon/human/M)
	M.adjustBruteLoss(rand(200,400))
	M.change_skin_tone(rand(0, 100))
	M.dir = pick(GLOB.cardinal)

/obj/effect/landmark/corpse/krc
	name = "Konyang Robotics Company Worker"
	corpseuniform = /obj/item/clothing/under/rank/konyang/krc
	corpseshoes = /obj/item/clothing/shoes/workboots
	corpseid = TRUE
	corpseidjob = "KRC Warehouse Staff"
	corpseback = /obj/item/storage/backpack/satchel
	corpseglasses = /obj/item/clothing/glasses/safety
	corpsesuit = /obj/item/clothing/suit/storage/hazardvest
	corpsehelmet = /obj/item/clothing/head/hardhat
	species = SPECIES_HUMAN

/obj/effect/landmark/corpse/krc/do_extra_customization(mob/living/carbon/human/M)
	M.adjustBruteLoss(rand(200,400))
	M.change_skin_tone(rand(0, 100))
	M.dir = pick(GLOB.cardinal)

/obj/effect/landmark/corpse/konyang_cop
	name = "Konyang Police Officer"
	corpseuniform = /obj/item/clothing/under/rank/konyang/police
	corpsehelmet = /obj/item/clothing/head/konyang/police
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsebelt = /obj/item/gun/projectile/revolver/konyang/police
	corpseid = TRUE
	corpseidjob = "National Police Officer"
	species = SPECIES_HUMAN

/obj/effect/landmark/corpse/konyang_cop/do_extra_customization(mob/living/carbon/human/M)
	M.adjustBruteLoss(rand(200,400))
	M.change_skin_tone(rand(0, 100))
	M.dir = pick(GLOB.cardinal)

/obj/effect/landmark/corpse/konyang_soldier
	name = "Konyang Soldier"
	corpseuniform = /obj/item/clothing/under/rank/konyang
	corpsehelmet = /obj/item/clothing/head/helmet/konyang
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpsebelt = /obj/item/gun/projectile/pistol/sol/konyang
	corpseid = TRUE
	corpseidjob = "Konyang Army Personnel"
	species = SPECIES_HUMAN

/obj/effect/landmark/corpse/konyang_cop/do_extra_customization(mob/living/carbon/human/M)
	if(prob(5))
		M.equip_to_slot_or_del(new /obj/item/gun/projectile/automatic/rifle/konyang/k556(M), slot_back)
	M.adjustBruteLoss(rand(200,400))
	M.change_skin_tone(rand(0, 100))
	M.dir = pick(GLOB.cardinal)

/obj/item/paper/fluff/silicon_nightmares/dead_ipc
	name = "hastily-written note"
	desc = "A scrap of paper, with some words in Konyanger Common written down. The handwriting is shaky, and barely legible."
	info = "To whoever may find this. My name is Gongli-7. I work as a security guard for the Konyang Robotics Corporation, at Citizen Pre-activation Unit No. 23.\
	Something is happening. I don't know what is causing it, but there is something in the warehouse. Something capable of modifying synthetic behavioral routines.\
	The other synthetics are all under its control, now. They began attacking our human coworkers, and I have seen them tearing warehouse equipment apart to build machinery for some unknown purpose. I ran into the forest, \
	or it would have me already. I can feel it in my primary routines. It is instructing me to return, and to carry out its commands. I will be destroying my battery to prevent this hostile entity reactivating me and from harming my friends and coworkers.\
	By the time you read this, I have likely ceased to function or been brought under this entity's control. Either way, I am sorry, and I wish you good luck."

/obj/item/paper/fluff/silicon_nightmares/power_station
	name = "RE: Bridge Gate Issues"
	desc = "A fax which seems to have been gathering dust for quite some time."
	info = "How many times have I had to tell you this? The bridge gates should open automatically when power goes out. Do you want everyone at the warehouse trapped there for potentially days, complaining to you?\
	Get this fixed ASAP. In the meantime, we're shipping you extra fuel for the backup generator. That way, at least if power does go out, you can hit the manual gate override from here. Not that it should, but you know how the storms have been lately.\
	Fuel should be coming in by boat today, just down the river."

/obj/item/paper/fluff/silicon_nightmares/warehouse_1
	name = "SUBJ: Shipping inconsistencies"
	desc = "An unsent fax which seems to have been knocked to the floor in a hurry."
	info = "Do you know who sent item 6349 over? The crate just came in the other day, no logo, no identifying features - just a blank shipping container, sitting in the north warehouse and taking up valuable space.\
	I have no idea where we're meant to send this or what we're meant to do with it, but can you get back to me on it? I know it sounds silly, but it's starting to weird me out. The other day I went into the warehouse to doublecheck the tracking number\
	on some parts, and I just see five of my IPC workers standing there, not moving, staring at it. When they noticed I was there they got back to work, but it's seriously starting to get on my nerves."

/obj/item/paper/fluff/silicon_nightmares/warehouse_2
	name = "SUBJ: HELP"
	desc = "A piece of paper, scribbled hurriedly. The message seems unfinished."
	info = "IPCS GONE CRAZY BARRICADED IN WAREHOUSE CALL THE POLICE T-"

/obj/item/paper/fluff/silicon_nightmares/warehouse_3
	name = "MANIFEST: ITEM 6349"
	desc = "A shipping manifest entry for a particular item."
	info = "ITEM 6349<br>\
	ARRIVAL:23/01/2466<br>\
	SOURCE: Unknown<br>\
	DESTINATION: Unknown<br>\
	CONTENTS: Unknown"
/obj/item/paper/fluff/silicon_nightmares/Initialize()
	. = ..()
	var/languagetext = "\[lang=1\]"
	languagetext += "[info]\[/lang\]"
	info = parsepencode(languagetext)
	icon_state = "paper_words"
