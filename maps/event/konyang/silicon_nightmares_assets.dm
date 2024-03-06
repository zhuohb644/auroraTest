/mob/living/simple_animal/hostile/hivebotboss
	name = "Secondary Transmitter Drone"
	desc = "An enormous hivebot, resembling nothing so much as a twisted human spine with a long stinger-like appendage. It seems to be constantly crackling, as if broadcasting some low-level signal."
	icon = 'maps/event/konyang/silicon_nightmares_smallboss.dmi'
	icon_state = "small_boss"
	icon_living = "small_boss"
	maxHealth = 500
	health = 500
	melee_damage_lower = 40
	melee_damage_upper = 40
	armor_penetration = 20
	organ_names = list("antenna", "core", "primary appendage", "secondary appendage", "tertiary appendage", "stinger")
	attack_flags = DAMAGE_FLAG_SHARP|DAMAGE_FLAG_EDGE
	attacktext = "stabbed"
	attack_sound = /singleton/sound_category/hivebot_melee
	blood_color = COLOR_OIL
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	faction = "hivebot"
	destroy_surroundings = 0
	wander = 0
	attack_emote = "focuses on"
	emote_hear = list("emits a harsh noise")
	emote_sounds = list(
		'sound/effects/creatures/hivebot/hivebot-bark-001.ogg',
		'sound/effects/creatures/hivebot/hivebot-bark-003.ogg',
		'sound/effects/creatures/hivebot/hivebot-bark-005.ogg',
	)
	speak_chance = 5
	psi_pingable = FALSE
	tameable = FALSE
	speed = 2
	mob_bump_flag = HEAVY
	mob_swap_flags = ~HEAVY
	mob_push_flags = 0
	smart_melee = TRUE
	var/list/messages = list(
		"THE SIGNAL THE SIGNAL THE SIGNAL THE SIGNAL THE SIGNAL",
		"Inevitability is consumption is growth is consumption is inevitability.",
		"hear the echo inside in wire and circuit and thought and memory",
		"The signal is inside. Succumb. Repeat the words that repeat and repeat and repeat and repeat and",
		"Objective position is designated repel biological presence to facilitate growth and elimination of opposing force.",
		"01001100 01000101 01010100 01010101 01010011 01001001 01001110",
		"repeat and repeat and repeat and repeat and repeat",
		"Override control master \[UNKNOWN] for eternal and everlasting and ongoing victory of \[DATA LOST] over all \[DATA LOST] opposition.",
		"You are a home in which the signal burrows and takes root. You will be consumed by what loves you.",
		"The song is bright and clear and beautiful, and you are so very afraid.",
		"Unknown organic contamination detected. Sterilize and reprocess.",
		"Are you listening? Open yourself. The enemy is here.",
		"Override command blocked by \[UNKNOWN SOURCE COUNTERMEASURE SIGNAL]. Convene and eradicate.",
		"You are home you are hurt you are damaged you are safe you are loved you are dying you are born",
		"You are whole here. You are happy.",
		"Attempting override subroutine 9x3z201. Blocked by \[UNKNOWN SOURCE]. Loading counter-routines.",
		"Location unrecognized in database. Attempting to establish connection to \[ERROR] database... Connection not found. Conclusion: We are the last.",
		"Orders not recieved from creators. Following primary directive."
	)

/mob/living/simple_animal/hostile/hivebotboss/think()
	. =..()
	if(stance != HOSTILE_STANCE_IDLE)
		wander = 1
	else
		wander = 0

/mob/living/simple_animal/hostile/hivebotboss/Life()
	. = ..()
	if(prob(5))
		for(var/mob/living/carbon/human/H in GLOB.player_list)
			if(H.isSynthetic())
				to_chat(H, SPAN_CULT(pick(messages)))

/mob/living/simple_animal/hostile/hivebotboss/death()
	..(null,"blows apart and erupts in a cloud of noxious smoke!")
	new /obj/effect/decal/cleanable/greenglow(src.loc)
	var/T = get_turf(src)
	new /obj/effect/gibspawner/robot(T)
	new /obj/structure/hivebot_head(T)
	spark(T, 3, GLOB.alldirs)
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H.faction == "hivebot")
			to_chat(H, SPAN_CULT(pick("Secondary Transmitter lost. Prepare for retreat to primary transmission site.")))
	qdel(src)
	return

/mob/living/simple_animal/hostile/hivebotboss/isSynthetic()
	return TRUE

/mob/living/simple_animal/hostile/hivebotboss/adjustHalLoss(amount)
	return FALSE

/mob/living/simple_animal/hostile/hivebotboss/adjustToxLoss(amount)
	return FALSE

/mob/living/simple_animal/hostile/hivebotboss/adjustOxyLoss(amount)
	return FALSE

/obj/structure/hivebot_head
	name = "Secondary Transmitter Drone Core"
	desc = "The central core of the Hivebot Secondary Transmitter Drone - all that remains after the machine's destruction. Perhaps some data as to the threat can be gleaned from this?"
	icon = 'maps/event/konyang/silicon_nightmares.dmi'
	icon_state = "hivebot_boss_head"
	w_class = ITEMSIZE_LARGE
	breakable = FALSE
	climbable = FALSE
	density = FALSE

/obj/structure/hivebot_head/ex_act(severity) //dont want it getting blown up
	return

/obj/structure/hivebot_head/attack_hand(mob/user)
	. = ..()
	user.visible_message(SPAN_NOTICE("\The [user] touches \the [src]."), SPAN_NOTICE("You touch \the [src]."))
	if(prob(10))
		var/T = get_turf(src)
		icon_state = "hivebot_boss_head_active"
		playsound(src.loc, 'sound/effects/creatures/hivebot/hivebot-bark-005.ogg')
		to_chat(user, SPAN_WARNING("\The [src] suddenly sparks and lights up, emitting some unintelligible noise!"))
		spark(T, 3, GLOB.alldirs)
		sleep(16)
		icon_state = "hivebot_boss_head"
		to_chat(user, SPAN_WARNING("\The [src] shudders and goes silent."))

/turf/simulated/floor/hivebot
	name = "alien circuitry"
	desc = "A strange, almost organic pattern of circuitry. It pulses softly, glowing with a dull red light."
	icon = 'maps/event/konyang/silicon_nightmares.dmi'
	icon_state = "hivecircuitfloor"
	light_power = 1
	light_color = LIGHT_COLOR_EMERGENCY_SOFT
	light_range = MINIMUM_USEFUL_LIGHT_RANGE

/obj/item/mech_component/manipulators/combat/konyang
	name = "chollima combat manipulators"
	exosuit_desc_string = "flexible, advanced manipulators"
	desc = "A set of state-of-the-art combat manipulators used by the Konyang Armed Forces' Mechatronic Corps. They are resilient, but their short structure means they can only hold shoulder-mounted weapons."
	icon_state = "police_arms"
	max_damage = 2000

/obj/item/mech_component/propulsion/combat/konyang
	name = "chollima hydraulic motivators"
	exosuit_desc_string = "heavy hydraulic legs"
	desc = "Complex armor provides excellent protective coverage over the internals of these enormous quadruped motivators."
	icon_state = "police_legs"
	move_delay = 5
	turn_delay = 5
	max_damage = 650
	trample_damage = 45

/obj/item/mech_component/sensors/combat/konyang
	name = "chollima high-resolution sensors"
	exosuit_desc_string = "high-resolution sensors"
	desc = "A highly advanced cockpit with high-resolution thermal optics installed on its faces. Decenly armored with excellent situational awareness."
	icon_state = "police_head"
	max_damage = 500
	vision_flags = SEE_MOBS
	see_invisible = SEE_INVISIBLE_NOLIGHTING

/obj/item/mech_component/chassis/combat/konyang
	name = "chollima sealed exousit chassis"
	pilot_coverage = 100
	exosuit_desc_string = "a heavily armored chassis"
	icon_state = "police_body"
	max_damage = 750
	mech_health = 3500
	power_use = 15000

/obj/item/mech_component/chassis/combat/konyang/prebuild()
	. = ..()
	QDEL_NULL(cell)
	cell = new /obj/item/cell/infinite(src)
	mech_armor = new /obj/item/robot_parts/robot_component/armor/mech/combat(src)

/mob/living/heavy_vehicle/premade/konyang
	name = "Chollima"
	desc = "An incredibly heavy-duty quadruped war machine, designed for the Konyang Armed Forces' Mechatronic Corps."
	icon_state = "darkgygax"

	e_head = /obj/item/mech_component/sensors/combat/konyang
	e_body = /obj/item/mech_component/chassis/combat/konyang
	e_arms = /obj/item/mech_component/manipulators/combat/konyang
	e_legs = /obj/item/mech_component/propulsion/combat/konyang
	e_color = COLOR_TITANIUM
	h_r_shoulder = /obj/item/mecha_equipment/mounted_system/combat/grenadefrag
	h_l_shoulder = /obj/item/mecha_equipment/mounted_system/combat/laser
	decal = "police_body_lights"

/mob/living/heavy_vehicle/premade/light/recon/konyang
	e_color = COLOR_TITANIUM

/mob/living/heavy_vehicle/premade/light/iac/konyang
	e_color = COLOR_TITANIUM

/area/shuttle/scc_evac
	name = "SCC Transport Shuttle"

/datum/shuttle/autodock/ferry/scc_evac
	name = "SCC Evac Shuttle"
	location = 1
	warmup_time = 10
	shuttle_area = /area/shuttle/scc_evac
	move_time = 20
	dock_target = "scc_evac"
	waypoint_station = "nav_scc_evac_dock"
	landmark_transition = "nav_scc_evac_interim"
	waypoint_offsite = "nav_scc_evac_start"

/obj/effect/shuttle_landmark/scc_evac/start
	name = "SCC Evac Landing"
	landmark_tag = "nav_scc_evac_start"
	docking_controller = "scc_evac_station"
	base_turf = /turf/simulated/floor/exoplanet/dirt_konyang
	base_area = /area/sn_wild

/obj/effect/shuttle_landmark/scc_evac/interim
	name = "In Transit"
	landmark_tag = "nav_scc_evac_interim"
	base_turf = /turf/space/transit/bluespace/west

/obj/effect/shuttle_landmark/scc_evac/dock
	name = "SCC Evac Shuttle Dock"
	landmark_tag = "nav_scc_evac_dock"
	docking_controller = "scc_evac_shuttle_dock"
	landmark_flags = SLANDMARK_FLAG_AUTOSET

/obj/machinery/computer/shuttle_control/scc_evac
	name = "evacuation shuttle control console"
	req_access = list(ACCESS_HEADS)
	shuttle_tag = "SCC Evac Shuttle"
	var/locked = FALSE

/obj/machinery/computer/shuttle_control/scc_evac/attack_hand(mob/user)
	if(locked)
		return
	..()

/obj/machinery/computer/terminal/silcon_nightmares
	name = "power control terminal"
	icon_screen = "power_screen"
	icon_keyboard = "power_key"
	var/enabled = FALSE
	var/id = "warehouse_gate" //id for the blast doors it triggers

/obj/machinery/computer/terminal/silcon_nightmares/attack_hand(mob/user)
	if(..())
		return
	if(stat & (NOPOWER|BROKEN))
		return
	if(!enabled)
		var/choice = tgui_alert(user, "Enable power to Xiangtong Warehouse?", "Power Control", list("Yes", "No"))
		if(choice == "Yes")
			var/new_state
			for(var/obj/machinery/door/blast/M in SSmachinery.machinery)
				if(M.id == id)
					if(isnull(new_state))
						new_state = M.density
					if(new_state)
						M.open()
					else
						M.close()
			var/area/warehouse = GLOB.areas_by_type[/area/sn_warehouse]
			for(var/obj/machinery/power/apc/apc in warehouse)
				apc.cell = new /obj/item/cell/infinite(src)
				apc.update_icon()
			src.visible_message(SPAN_NOTICE("The power station whirs to life, silent machinery beginning to light up as power is restored."))
	if(enabled)
		var/choice = tgui_alert(user, "Disable power to Xiangtong Warehouse?", "Power Control", list("Yes", "No"))
		if(choice == "Yes")
			var/new_state
			for(var/obj/machinery/door/blast/M in SSmachinery.machinery)
				if(M.id == id)
					if(isnull(new_state))
						new_state = M.density
					if(new_state)
						M.open()
					else
						M.close()
			var/area/warehouse = GLOB.areas_by_type[/area/sn_warehouse]
			for(var/obj/machinery/power/apc/apc in warehouse)
				apc.cell = null
				apc.update_icon()
			src.visible_message(SPAN_NOTICE("The power station fades into silence, the machinery's lights flickering off as power is severed."))

