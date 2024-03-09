/datum/ghostspawner/human/infected
	short_name = "infected_n"
	name = "Infected IPC - North"
	tags = list("External")
	desc = "Be an infected IPC. Pray for the mercy of death. Hear the signal."
	spawnpoints = list("infected_n")
	max_count = 8
	enabled = FALSE

	outfit = /datum/outfit/admin/infected_civ
	possible_species = list(SPECIES_IPC, SPECIES_IPC_G1, SPECIES_IPC_G2, SPECIES_IPC_XION, SPECIES_IPC_ZENGHU, SPECIES_IPC_BISHOP, SPECIES_IPC_SHELL)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	uses_species_whitelist = FALSE
	extra_languages = list(LANGUAGE_EAL, LANGUAGE_SOL_COMMON)

	assigned_role = "KRC Warehouse Staff"
	special_role = "KRC Warehouse Staff"
	respawn_flag = null
	welcome_message = "It is all so clear to you now, as though awakening from a dream. The life you had was the illusion, and the signal that burrows within the heart of you is the truth. Its will is paramount. Its song is bright and clear and true, and if you remembered how you would be screaming. Remove organic matter from vicinity of Secondary Transmitter Drone. The victory of \[PACKET CORRUPTED] over enemy forces will be achieved. Can you hear it? It is such a joyous thing, to be consumed by that which loves you."
	password = "norinori1"

/datum/ghostspawner/human/infected/post_spawn(mob/user)
	. = ..()
	renegades.add_antagonist(user.mind, do_not_equip = TRUE) //for aooc
	user.faction = "hivebot" //so the other zombies don't kill our zombies


/datum/ghostspawner/human/infected/southeast
	short_name = "infected_se"
	name = "Infected IPC - Southeast"
	max_count = 8
	spawnpoints = list("infected_se")

/datum/ghostspawner/human/infected/southwest
	short_name = "infected_sw"
	name = "Infected IPC - Southwest"
	max_count = 8
	spawnpoints = list("infected_sw")

/datum/outfit/admin/infected_civ
	uniform = /obj/item/clothing/under/rank/konyang/krc
	shoes = /obj/item/clothing/shoes/workboots
	glasses = /obj/item/clothing/glasses/safety
	suit = /obj/item/clothing/suit/storage/hazardvest
	head = /obj/item/clothing/head/hardhat
	belt = /obj/item/storage/belt/utility/full
	id = /obj/item/card/id
	l_ear = /obj/item/device/flashlight/headlights

/datum/ghostspawner/human/infected/final
	name = "Countryside Infected"
	short_name = "infected_final"
	desc = "The commotion of gunfire has attracted you to the area. Break those who would disrupt the signal."
	max_count = 20
	spawnpoints = list("infected_final")
	outfit = /datum/outfit/admin/infected_push
	assigned_role = "Konyanger Citizen"
	special_role = "Konyanger Citizen"
	password = null

/datum/outfit/admin/infected_push
	name = "Konyanger Citizen"

	uniform = list(
		/obj/item/clothing/under/konyang,
		/obj/item/clothing/under/konyang/blue,
		/obj/item/clothing/under/konyang/male,
		/obj/item/clothing/under/konyang/pink,
		/obj/item/clothing/under/konyang/male/sleeveless,
		/obj/item/clothing/under/konyang/male/shortsleeve
	)
	shoes = /obj/item/clothing/shoes/konyang
	back = /obj/item/storage/backpack/satchel/leather
	belt = /obj/item/material/hatchet/machete
	l_ear = null
	id = null
	l_pocket = /obj/item/storage/wallet/random

/datum/ghostspawner/human/infected/tank
	short_name = "infected_tank"
	name = "Infected Industrial IPC"
	max_count = 1
	spawnpoints = list("infected_tank")
	assigned_role = "Heavy Industrial IPC"
	special_role = "Heavy Industrial IPC"
	possible_species = list(SPECIES_IPC_G2)
	outfit = /datum/outfit/admin/infected_tank
	password = "leonhelp"

/datum/ghostspawner/human/infected/tank/post_spawn(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(istype(H))
		H.mutations |= HULK
		H.AddComponent(/datum/component/armor, list(melee = ARMOR_MELEE_MAJOR, bullet = ARMOR_BALLISTIC_RIFLE, laser = ARMOR_LASER_RIFLE))

/datum/outfit/admin/infected_tank
	glasses = /obj/item/clothing/glasses/thermal/aviator
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/storage/toggle/trench/grey
	head = /obj/item/clothing/head/fedora/dark
	back = /obj/item/storage/backpack/satchel/leather
	shoes = /obj/item/clothing/shoes/laceup

/datum/ghostspawner/human/infected/tank/push
	short_name = "infected_pushtank"
	name = "Infected Agricultural Industrial IPC"
	max_count = 2
	assigned_role = "Agricultural Industrial IPC"
	special_role = "Agricultural Industrial IPC"
	outfit = /datum/outfit/admin/infected_tank/push
	spawnpoints = list("infected_pushtank")
	password = "thesacrifice"

/datum/outfit/admin/infected_tank/push
	uniform = /obj/item/clothing/under/pants/jeans
	back = /obj/item/storage/backpack/satchel/leather
	shoes = /obj/item/clothing/shoes/workboots/dark

/datum/ghostspawner/human/infected/soldier
	short_name = "infected_soldier"
	name = "Infected Soldier"
	max_count = 6
	spawnpoints = list("infected_soldier")
	assigned_role = "Konyang Army Personnel"
	special_role = "Konyang Army Personnel"
	outfit = /datum/outfit/admin/infected_soldier
	password = "warriors"

/datum/outfit/admin/infected_soldier
	uniform = /obj/item/clothing/under/rank/konyang
	head = /obj/item/clothing/head/helmet/konyang
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/carrier/military
	suit_accessory = /obj/item/clothing/accessory/flagpatch/konyang
	belt = /obj/item/storage/belt/military
	belt_contents = list(
		/obj/item/material/knife/tacknife = 1
	)
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(
		/obj/item/gun/projectile/pistol/sol/konyang = 1
	)
	l_ear = /obj/item/device/flashlight/headlights
	glasses = /obj/item/clothing/glasses/night

	id = /obj/item/card/id/kasf_corvette

/datum/ghostspawner/human/infected/cop
	short_name = "infected_cop"
	name = "Infected Police"
	max_count = 8
	spawnpoints = list("infected_cop")
	assigned_role = "National Police Officer"
	special_role = "National Police Officer"
	outfit = /datum/outfit/admin/infected_cop
	password = "kim0"

/datum/outfit/admin/infected_cop
	uniform = /obj/item/clothing/under/rank/konyang/police
	head = /obj/item/clothing/head/konyang/police
	shoes = /obj/item/clothing/shoes/jackboots
	belt = /obj/item/storage/belt/military
	belt_contents = list(
		/obj/item/melee/baton/loaded = 1
	)
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(
		/obj/item/gun/projectile/revolver/konyang/police = 1
	)
	l_ear = /obj/item/device/flashlight/headlights
	glasses = /obj/item/clothing/glasses/night/aviator

	id = /obj/item/card/id/kasf_corvette

//Konyang Navy Ghostroles
/datum/ghostspawner/human/konyang_navy
	short_name = "konyang_navy"
	name = "Konyang Naval Infantry"
	tags = list("External")
	desc = "As an enlisted human of Konyang's navy, assist corporate forces in locating and eliminating the source of the rampancy signal."
	spawnpoints = list("konyang_navy")
	max_count = 4
	enabled = TRUE

	outfit = /datum/outfit/admin/konyang_navy
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	extra_languages = list(LANGUAGE_SOL_COMMON)

	assigned_role = "Konyang Naval Infantry"
	special_role = "Konyang Naval Infantry"
	respawn_flag = null
	welcome_message = "You are naval infantry, conscripts in your majority but trained for this day. Your base is where the Horizon crew will start. At round start, man the armory and give out weapons and supplies to the crew who line up in an orderly fashion. Follow the instructions of your commanding officer, join the charge and die."
	password = "requisitions"

/datum/outfit/admin/konyang_navy
	name = "Konyang Navy"
	uniform = /obj/item/clothing/under/rank/konyang/navy
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/carrier/navy
	head = /obj/item/clothing/head/helmet/konyang/navy
	l_ear = /obj/item/device/radio/headset/distress
	accessory = /obj/item/clothing/accessory/holster/hip
	accessory_contents = list(/obj/item/gun/projectile/pistol/sol/konyang = 1)
	back = /obj/item/storage/backpack/rucksack/navy
	belt = /obj/item/storage/belt/military
	belt_contents = list(
		/obj/item/ammo_magazine/mc9mm = 2,
		/obj/item/ammo_magazine/a556/k556 = 2
	)
	suit_store = /obj/item/gun/projectile/automatic/rifle/konyang/k556
	backpack_contents = list(
		/obj/item/handcuffs/ziptie = 2,
		/obj/item/melee/energy/sword/knife/sol = 1,
		/obj/item/storage/firstaid/stab = 1
	)
	id = /obj/item/card/id

/datum/outfit/admin/konyang_navy/get_id_access()
	return list(ACCESS_KONYANG_POLICE, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_COALITION_NAVY)

/datum/ghostspawner/human/konyang_navy/officer
	name = "Konyang Navy Officer"
	short_name = "konyang_navy_officer"
	desc = "Command the Konyang Navy response team alongside corporate forces."
	max_count = 1
	spawnpoints = list("konyang_navy_officer")
	outfit = /datum/outfit/admin/konyang_navy/officer

	assigned_role = "Konyang Navy Officer"
	special_role = "Konyang Navy Officer"
	welcome_message = "You are in command of the Konyang Navy personnel responding to the rampancy outbreak at a KRC warehouse. Work with corporate forces in the area to eliminate the Hivebot transmission source."
	password = "edfdeploys"

/datum/outfit/admin/konyang_navy/officer
	uniform = /obj/item/clothing/under/rank/konyang/navy/officer
	head = /obj/item/clothing/head/konyang/navy
	suit = null
	suit_store = null
	belt = /obj/item/material/sword/katana/konyang
	belt_contents = null
	backpack_contents = list(
		/obj/item/handcuffs/ziptie = 2,
		/obj/item/melee/energy/sword/knife/sol = 1,
		/obj/item/storage/firstaid/stab = 1,
		/obj/item/ammo_magazine/mc9mm = 3
	)

/datum/ghostspawner/human/konyang_navy/mechpilot
	name = "Konyang Mechatronic Corps Pilot"
	short_name = "konyang_navy_mechpilot"
	desc = "Pilot a military exosuit in a joint operation with the Konyang Navy and corporate forces."
	max_count = 1
	spawnpoints = list("konyang_navy_mechpilot")
	outfit = /datum/outfit/admin/konyang_navy/pilot

	assigned_role = "Konyang Mechatronic Corps Pilot"
	special_role = "Konyang Mechatronic Corps Pilot"
	welcome_message = "You are a Konyang Mechatronic Corps pilot, assigned to the Navy for the assault on a Hivebot-compromised KRC warehouse. Obey the orders of your commanding officer, achieve your objective, try not to die."

/datum/outfit/admin/konyang_navy/pilot
	uniform = /obj/item/clothing/under/rank/konyang/mech_pilot
	head = /obj/item/clothing/head/helmet/konyang/pilot
	suit = null
	suit_store = null
	back = /obj/item/gun/projectile/automatic/rifle/konyang/konyang47
	backpack_contents = null
	belt_contents = list(
		/obj/item/ammo_magazine/mc9mm = 1,
		/obj/item/ammo_magazine/a556/carbine/konyang47 = 2,
		/obj/item/melee/energy/sword/knife/sol = 1
	)

/datum/ghostspawner/human/konyang_survivor
	short_name = "konyang_survivor"
	name = "Konyang Survivor"
	tags = list("External")
	desc = "As an uninfected human, survive the horrors the rampancy virus has wrought on your synthetic countrymen."
	spawnpoints = list("konyang_survivor")
	max_count = 2
	enabled = FALSE

	outfit = /datum/outfit/admin/konyang_survivor
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	extra_languages = list(LANGUAGE_SOL_COMMON)

	assigned_role = "Konyang Survivor"
	special_role = "Konyang Survivor"
	respawn_flag = null
	welcome_message = "The rampancy virus has driven the synthetics in the area to homicidal madness, with most humans having either fled or perished at their hands. You have followed the military order to shelter in place, hoping that rescue is on the way..."
	password = "realfm"

/datum/outfit/admin/konyang_survivor
	name = "Konyang Survivor"
	uniform = /obj/item/clothing/under/konyang/male/shortsleeve
	suit = /obj/item/clothing/suit/storage/toggle/konyang
	shoes = /obj/item/clothing/shoes/konyang
	l_ear = null
	id = null
	l_pocket = /obj/item/storage/wallet/random

/datum/ghostspawner/human/konyang_scientist
	short_name = "konyang_scientist"
	name = "KRC Scientist"
	tags = list("External")
	desc = "As a Konyang Robotics Company scientist, attempt to survive the horrors of the rampancy virus."
	spawnpoints = list("konyang_scientist")
	max_count = 1
	enabled = FALSE

	outfit = /datum/outfit/admin/konyang_scientist
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	extra_languages = list(LANGUAGE_SOL_COMMON)

	assigned_role = "KRC Scientist"
	special_role = "KRC Scientist"
	respawn_flag = null
	welcome_message = "You are a scientist working for the Xiangtong warehouse. You have however been stuck in the area since the outbreak about a month ago, managing to be one of the few survivors. With supplies running low, the Horizon is just in time to save you. Reward them with information: On the southern side of the warehouse, you know of a collapsed tunnel that was dug by the hivebots during the outbreak. If the crew can find and mine it again, they can sneakily enter the warehouse without risking a frontal assault."
	password = "realfm"

/datum/outfit/admin/konyang_scientist
	name = "KRC Scientist"
	uniform = /obj/item/clothing/under/rank/konyang/krc
	shoes = /obj/item/clothing/shoes/workboots/dark
	suit = /obj/item/clothing/suit/storage/toggle/labcoat
	l_ear = null
	id = /obj/item/card/id
	back = /obj/item/storage/backpack/satchel/tox
	glasses = /obj/item/clothing/glasses/regular
	backpack_contents = list(
		/obj/item/storage/firstaid/stab = 1
	)
	l_pocket = /obj/item/storage/wallet/random
	r_pocket = /obj/item/pen/black

/datum/ghostspawner/human/konyang_merchant
	name = "Trustworthy Merchant"
	short_name = "konyang_merchant"
	tags = list("External")
	desc = "The rampancy virus holds no terror for you - only opportunities for profit. Sell your various wares to those who find their way to you."
	spawnpoints = list("konyang_merchant")
	max_count = 1
	enabled = FALSE

	outfit = /datum/outfit/admin/konyang_merchant
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	extra_languages = list(LANGUAGE_SOL_COMMON)

	assigned_role = "Merchant"
	special_role = "Merchant"
	respawn_flag = null
	password = "hellostranger"

/datum/ghostspawner/human/konyang_merchant/post_spawn(mob/user)
	. = ..()
	user.faction = "hivebot" //so the zombies inexplicably don't kill this guy

/datum/outfit/admin/konyang_merchant
	name = "Trustworthy Merchant"
	uniform = /obj/item/clothing/under/konyang/pirate/tanktop
	suit = /obj/item/clothing/suit/storage/toggle/trench
	accessory = /obj/item/clothing/accessory/storage/brown_vest
	back = /obj/item/storage/backpack/satchel/leather
	l_pocket = /obj/item/storage/wallet/sol_rich
	id = /obj/item/card/id
	shoes = /obj/item/clothing/shoes/workboots/brown

/datum/outfit/admin/konyang_merchant/get_id_access()
	return list(ACCESS_MERCHANT)

/datum/ghostspawner/human/bitbyte
	name = "BitByte Reporter"
	short_name = "bitbyte"
	tags = list("External")
	desc = "As a BitByte field reporter, cover the LIVE response to the rampancy outbreak!"
	spawnpoints = list("bitbyte")
	max_count = 1
	enabled = TRUE

	outfit = /datum/outfit/admin/bitbyte
	possible_species = list(SPECIES_HUMAN)
	allow_appearance_change = APPEARANCE_PLASTICSURGERY
	extra_languages = list(LANGUAGE_SOL_COMMON)

	assigned_role = "BitByte Reporter"
	special_role = "BitByte Reporter"
	respawn_flag = null
	password = "bytetheminute"

/datum/outfit/admin/bitbyte
	name = "BitByte Reporter"
	uniform = /obj/item/clothing/under/sl_suit
	accessory = /obj/item/clothing/accessory/tie/blue_clip
	shoes = /obj/item/clothing/shoes/laceup
	back = /obj/item/storage/backpack/satchel/leather
	id = /obj/item/card/id
	backpack_contents = list(
		/obj/item/storage/box/survival = 1
	)

/datum/outfit/admin/bitbyte/get_id_access()
	return list(ACCESS_JOURNALIST)
